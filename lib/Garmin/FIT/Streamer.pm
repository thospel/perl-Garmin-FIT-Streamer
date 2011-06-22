package Garmin::FIT::Streamer;
use strict;
use warnings;

our $VERSION = '1.000';

use Carp;

use Garmin::FIT::Streamer::Profile;

use Data::Dumper;
$Data::Dumper::Indent = 1;
$Data::Dumper::Sortkeys = 1;

my $profile = Garmin::FIT::Streamer::Profile->profile;
my $base_types = Garmin::FIT::Streamer::Profile->base_types;

sub new {
    my ($class, %params) = @_;
    my $fit = bless {
    }, $class;
    croak "Unknown parameter ", join(", ", keys %params) if %params;
    $fit->reset;
    return $fit;
}

sub reset {
    my ($fit) = @_;
    $fit->{in_buffer} = "";
    $fit->{in_want} = 12;
    $fit->{in_need} = 12;
    $fit->{in_state} = "get_header";
    $fit->{in_types} = [];
}

sub get_header {
    my $fit = shift;
    my ($len, $protocol, $profile, $size, $type) = unpack("CCvVa4", shift);
    $len == 12 || croak "Invalid header length $len (expected 12)";
    $type eq ".FIT" || croak "Invalid file type (expected .FIT)";
    $fit->{protocol} = $protocol;
    $fit->{profile}  = $profile;
    # 2 more bytes for the CRC
    $fit->{in_want} = $size + 2;
    # Would like a record header
    $fit->{in_need} = 1;
    $fit->{in_state} = "get_record_header";
}

sub get_record_header {
    my $fit = shift;
    my $header = ord shift;
    if ($header & 0x80) {
        my $local_message_type = ($header >> 5) & 0x3;
        my $time_offset = $header & 0x1f;
        die "Abnormal header";
    } else {
        if ($header & 0x40) {
            $fit->{in_type} = $header & 0xf;
            $fit->{in_state} = "get_define_header";
            $fit->{in_need} = 5;
        } else {
            my $local_message_type = $header & 0xf;
            $fit->{in_type} = $fit->{in_types}[$local_message_type] ||
                croak "Local message type $local_message_type used but not defined";
            $fit->{in_state} = "get_data";
            $fit->{in_need}  = $fit->{in_type}{size};
        }
    }
}

sub get_define_header {
    my $fit = shift;
    my ($architecture, $num0, $num1, $nr_fields) = unpack("xCCCC", shift);
    my $num =
        $architecture == 0 ? $num0 + $num1 * 256 :
        $architecture == 1 ? $num1 + $num0 * 256 :
        croak "Invalid architecture $architecture";
    $fit->{in_type} = $fit->{in_types}[$fit->{in_type}] = {
        nr_fields	=> $nr_fields || croak("Definition of 0 fields"),
        big_endian	=> $architecture,
        global_nr	=> $num,
        global_type	=> $profile->{$num},
    };
    $fit->{in_state} = "get_define_fields";
    $fit->{in_need} = 3*$nr_fields;
}

sub get_define_fields {
    my $fit = shift;
    my @definition = unpack("C*", shift);

    my $in_type = $fit->{in_type};
    my $meta = ref $in_type->{global_type} eq "HASH" ?
        $in_type->{global_type}{fields} : {};
    my $total_size = 0;
    my $decoder = "";
    $in_type->{fields} = \my @fields;
    while (my ($field_nr, $size, $base_type) = splice(@definition, 0, 3)) {
        my $type = $base_types->{$base_type} || die "Unknown type $base_type";
        print STDERR "Type $base_type\n" if $type->{notice};
        if ($type->{size}) {
            $type->{size} == $size || die "Unexpected size $size for base_type $base_type ($type->{name})";
            $decoder .= $type->{decoder}[$in_type->{big_endian}];
        } else {
            $decoder .= $type->{decoder}[$in_type->{big_endian}];
            $decoder .= $size;
        }
        $total_size += $size;
        push @fields, {
            base_type	=> $base_type,
            type	=> $type,
            size	=> $size,
            field_nr	=> $field_nr,
            $meta->{$field_nr} ? (meta	=> $meta->{$field_nr}) : (),
        };
    }
    $in_type->{size} = $total_size;
    $in_type->{decoder} = $decoder;
    # print STDERR Dumper($in_type);

    if ($fit->{in_want} > 2) {
        $fit->{in_need} = 1;
        $fit->{in_state} = "get_record_header";
    } elsif ($fit->{in_want} == 2) {
        $fit->{in_need} = 1;
        $fit->{in_state} = "get_crc";
    } else {
        die "Unexpected EOF";
    }
}

sub get_data {
    my $fit = shift;
    my @fields = @{$fit->{in_type}{fields}};
    my @data = unpack($fit->{in_type}{decoder}, shift);
    my $global_name = $fit->{in_type}{global_type}{name};
    print STDERR "DATA:\n";
    for my $data (@data) {
        print STDERR "  '$data'	($global_name: $fields[0]{meta}{name} $fields[0]{type}{name} \[$fields[0]{field_nr}\])\n";
        $data = undef if $data eq $fields[0]{type}{invalid};
        $data = [$data, shift @fields];
    }
    # print STDERR Dumper(\@data);
    if ($fit->{in_want} > 2) {
        $fit->{in_need} = 1;
        $fit->{in_state} = "get_record_header";
    } elsif ($fit->{in_want} == 2) {
        $fit->{in_need} = 1;
        $fit->{in_state} = "get_crc";
    } else {
        die "Unexpected EOF";
    }
}

sub get_crc {
    my $fit = shift;
    $fit->{in_need} = 1e99;
    $fit->{in_state} = "done";
}

sub add_bytes {
    my $fit = shift;
    $fit->{in_buffer} .= shift;
    while (length $fit->{in_buffer} >= $fit->{in_need}) {
        my $method = $fit->{in_state} || croak "Assertion: No method";
        $fit->{in_want} -= $fit->{in_need};
        $fit->$method(substr($fit->{in_buffer}, 0, $fit->{in_need}, ""));
    }
    return $fit->{in_want} - length $fit->{in_buffer};
}

sub from_handle {
    my ($fit, $fh) = @_;
    my $buffer;
    my $want = $fit->add_bytes("");
    while ($want) {
        my $rc = read($fh, $buffer, $want);
        if ($rc) {
            $want = $fit->add_bytes($buffer);
        } elsif (defined $rc) {
            croak "Unexpected EOF";
        } else {
            croak "Read error: $!";
        }
    }
}

sub from_file {
    my ($fit, $file) = @_;
    defined $file || croak "undefined file";
    open(my $fh, "<", $file) || croak "Could not open '$file': $!";
    binmode $fh;
    eval { $fit->from_handle($fh) };
    die "File '$file': $@" if $@;
    close($fh) || croak "Error closing '$file': $!";
}

sub protocol {
    return shift->{protocol};
}

sub profile {
    return shift->{profile};
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Garmin::FIT::Streamer - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Garmin::FIT::Streamer;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Garmin::FIT::Streamer, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Ton Hospel, E<lt>ton@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Ton Hospel

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
