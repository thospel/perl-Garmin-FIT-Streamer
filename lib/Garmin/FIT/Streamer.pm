package Garmin::FIT::Streamer;
use strict;
use warnings;

our $VERSION = '1.000';

use Carp;
use Scalar::Util qw(looks_like_number openhandle);
use Digest::CRC qw(crc16);

require Garmin::FIT::Streamer::Definition;
require Garmin::FIT::Streamer::Unit;

our @CARP_NOT = qw(Garmin::FIT::Streamer::Definition);

use Data::Dumper;
$Data::Dumper::Indent = 1;
$Data::Dumper::Sortkeys = 1;

use constant {
    HEADER_SIZE	=> 12,
    CRC16_POLY	=> crc16("\x80"),
};

our ($crc16_high, $crc16_low, $crc16_modulo, $debug_parse);

sub new {
    my ($class, %params) = @_;

    my $fit = bless {
    }, $class;

    if (defined(my $on_record = delete $params{on_record})) {
        ref $on_record eq "CODE" ||
            croak "on_record is not a CODE reference but '$on_record'";
        $fit->{on_record} = $on_record;
    }
    if (defined(my $on_definition = delete $params{on_definition})) {
        ref $on_definition eq "CODE" ||
            croak "on_definition is not a CODE reference but '$on_definition'";
        $fit->{on_definition} = $on_definition;
    }

    if (defined(my $unit_preferences = delete $params{unit_preferences})) {
        $unit_preferences =
            Garmin::FIT::Streamer::Unit->converters($unit_preferences);
        $fit->{unit_preferences} = $unit_preferences if %$unit_preferences;
    }

    if (defined(my $dump_fh = delete $params{dump_fh})) {
        openhandle($dump_fh) || croak "dump_fh is not an open filehandle";
        $fit->{dump_fh} = $dump_fh;
    }

    croak "Unknown parameter ", join(", ", keys %params) if %params;

    $fit->in_reset;
    $fit->out_reset;
    return $fit;
}

sub in_reset {
    my ($fit) = @_;

    $fit->{in_buffer} = "";
    $fit->{in_want} = HEADER_SIZE;
    $fit->{in_need} = HEADER_SIZE;
    $fit->{in_state} = "get_header";
    $fit->{in_crc} = Digest::CRC->new(type => "crc16");
    $fit->{in_types} = [];
}

sub out_reset {
    my ($fit) = @_;

    $fit->{out_buffer} =
        pack("CCvVa4",
             HEADER_SIZE,
             Garmin::FIT::Streamer::Profile->PROTOCOL_VERSION,
             Garmin::FIT::Streamer::Profile->PROFILE_VERSION,
             0,	# Body size
             ".FIT");
    $fit->{out_messages} = [];
    $fit->{out_message_ids} = {};
}

sub out {
    my ($fit) = @_;

    substr($fit->{out_buffer}, 4, 4,
           pack("V", length($fit->{out_buffer}) - HEADER_SIZE));
    die "Assertion: Buffer somehow became UTF-8" if
        utf8::is_utf8($fit->{out_buffer});
    return $fit->{out_buffer} . pack("v", crc16($fit->{out_buffer}));
}

sub to_handle {
    my ($fit, $fh) = @_;

    substr($fit->{out_buffer}, 4, 4,
           pack("V", length($fit->{out_buffer}) - HEADER_SIZE));
    die "Assertion: Buffer somehow became UTF-8" if
        utf8::is_utf8($fit->{out_buffer});
    local $\;
    print($fh $fit->{out_buffer}) || croak "Write error: $!";
    print($fh pack("v", crc16($fit->{out_buffer}))) || croak "Write error: $!";
}

sub to_file {
    my ($fit, $file) = @_;

    open(my $fh, ">", $file) ||
        croak "Could not open file '$file' for write: $!";
    binmode($fh);
    $fit->to_handle($fh);
    close($fh) || croak "Could not close file '$file': $!";
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
    $fit->{in_state} = "get_record_header";
    $fit->{in_need} = 1;
}

sub get_record_header {
    my $fit = shift;
    my $header = ord shift;
    if ($header & 0x80) {
        $fit->{local_message} = ($header >> 5) & 0x3;
        my $time_offset = $header & 0x1f;
        # I haven't seen a file with these yet and I don't know relative
        # to what the times are calculated
        die "Abnormal headers not handled (yet)";
    } else {
        if ($header & 0x40) {
            $fit->{in_type} = $header & 0xf;
            $fit->{in_state} = "get_define_header";
            $fit->{in_need} = 5;
        } else {
            $fit->{local_message} = $header & 0xf;
            $fit->{in_type} = $fit->{in_types}[$fit->{local_message}] ||
                croak "Local message type $fit->{local_message} used but not defined";
            $fit->{in_state} = "get_data";
            $fit->{in_need}  = $fit->{in_type}->total_size;
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
    $fit->{in_types}[$fit->{in_type}] = {
        nr_fields	=> $nr_fields || croak("Definition of 0 fields"),
        big_endian	=> $architecture,
        message_number	=> $num,
        message		=> Garmin::FIT::Streamer::Message->try_from_id($num),
    };
    $fit->{in_state} = "get_define_fields";
    $fit->{in_need} = 3*$nr_fields;
}

sub get_define_fields {
    my $fit = shift;
    my @definitions = unpack("C*", shift);

    my $in_type = $fit->{in_types}[$fit->{in_type}];
    my $message = $in_type->{message};

    my (@fields, $field);
    while (my ($field_nr, $size, $base_type) = splice(@definitions, 0, 3)) {
        my $base_type = Garmin::FIT::Streamer::BaseType->from_id($base_type);
        print STDERR "Type $base_type->{name}\n" if $base_type->{notice};

        if ($message and $field = $message->try_field_from_id($field_nr)) {
            # Field is known in the profile
            $field = {
                model_field	=> $field,
                base_type	=> $base_type,
                size		=> $size,
            };
        } else {
            # Field is not known in the profile
            $field = {
                number		=> $field_nr,
                base_type	=> $base_type,
                size		=> $size,
            }
        }
        push @fields, $field;
    }

    my $definition = Garmin::FIT::Streamer::Definition->new(
        message		=> $message || $in_type->{message_number},
        fields		=> \@fields,
        big_endian	=> $in_type->{big_endian},
        unit_preferences=> $fit->{unit_preferences});
    $fit->{on_definition}->($fit, $definition) if $fit->{on_definition};
    $fit->{in_types}[$fit->{in_type}] = $definition;

    if ($fit->{in_want} > 2) {
        $fit->{in_need} = 1;
        $fit->{in_state} = "get_record_header";
    } elsif ($fit->{in_want} == 2) {
        $fit->{in_need} = 2;
        $fit->{in_state} = "get_crc";
    } else {
        die "Unexpected EOF";
    }
}

sub get_data {
    my $fit = shift;

    ($fit->{in_type}->on_record || $fit->{on_record} ||
     croak "No on_record callback")->(
        $fit,
        $fit->{in_type},
        $fit->{in_type}->decode(shift));

    if ($fit->{in_want} > 2) {
        $fit->{in_need} = 1;
        $fit->{in_state} = "get_record_header";
    } elsif ($fit->{in_want} == 2) {
        $fit->{in_need} = 2;
        $fit->{in_state} = "get_crc";
    } else {
        die "Unexpected EOF";
    }
}

sub get_crc {
    my $fit = shift;
    # Skip test if the file CRC is 0
    # Calculating CRC over message including the CRC should always be 0
    shift eq "\x00\x00" || $fit->{in_crc}->digest == 0 ||
        croak "Invalid CRC16";
    $fit->{in_need} = 1e99;
    $fit->{in_state} = "done";
}

sub add_bytes {
    my $fit = shift;
    $fit->{in_buffer} .= shift;
    while (length $fit->{in_buffer} >= $fit->{in_need}) {
        my $method = $fit->{in_state} || croak "Assertion: No method";
        $fit->{in_want} -= $fit->{in_need};
        my $bytes = substr($fit->{in_buffer}, 0, $fit->{in_need}, "");
        print STDERR "$method: ", unpack("H*", $bytes), "\n" if $debug_parse;
        die "Assertion: Buffer somehow became UTF-8" if utf8::is_utf8($bytes);
        $fit->{in_crc}->add($bytes);
        $fit->$method($bytes);
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

sub make_sender {
    my ($fit, $message, $fields) = @_;
    my @fetch;
    for my $i (0..@$fields/2-1) {
        my $field = $fields->[$i *=2];
        push @fetch, $field->{nr};
    }
    return {
        fetch	=> \@fetch,
    };
}

sub define {
    my $fit = shift;
    my $message = Garmin::FIT::Streamer::Definition->new(
        message	=> shift,
        fields	=> \@_,
        );
    return $message;
}

sub put {
    my $fit = shift;
    my $message = shift;
    my $id = $message->id;
    my $local_id = $fit->{out_message_ids}{$id};
    if (!defined $local_id) {
        # Not defined yet
        # Select a number
        $local_id = @{$fit->{out_messages}};
        if ($local_id >= 16) {
            # All numbers are in use
            # bump a random one
            $local_id = int rand 16;
            delete $fit->{out_message_ids}{$fit->{out_messages}[$local_id]->id} || die "Assertion: Did not have the bumped id";
        }
        $fit->{out_messages}[$local_id] = $message;
        $fit->{out_message_ids}{$id} = $local_id;
        # define message header
        $fit->{out_buffer} .= $message->define_string($local_id);
    }
    $fit->{out_buffer} .= $message->encode($local_id, @_);
}

sub protocol {
    return shift->{protocol};
}

sub profile {
    return shift->{profile};
}

sub local_message {
    return shift->{local_message};
}

sub dump_record {
    my ($fit, $definition, $data) = @_;

    my $fh = $fit->{dump_fh} || \*STDERR;
    my $message_id = $definition->message_id;

    print $fh "DATA $definition->{message_id} ($fit->{local_message}):\n";
    my @fields = $definition->fields;
    @fields == @$data || die "Assertion: Inconsistent number of fields";
    my $max_len = 0;
    for my $value (@$data) {
        my $field = shift @fields;
        my $field_id = $field->id;
        my $field_number = $field->number;
        my $unit = $field->unit;
        $unit = $unit ? " $unit->[0]" : "";

        if (defined $value) {
            if (ref $value eq "") {
                my $comment = eval { "\t(" . ($field->type->value_comment($value) // return) . ")" } || "";
                $value = looks_like_number($value) ? "'$value$unit'$comment" : "'$value'$comment"
            } else {
                $value =
                    "[" .
                    join(", ", map defined $_ ? looks_like_number($_) ? "'$_$unit'" : "'$_'": "undef", @$value) .
                    "]";
            }
        } else {
            $value = "undef";
        }
        my $base_type_name = $field->base_type->name;
        $value = ["  $field_id $base_type_name \[$field_number\]:", $value];
        $max_len = int((length($value->[0])+7)/8)*8 if
            $max_len < length $value->[0];
    }
    for my $value (@$data) {
        printf $fh "%-*s%s\n", $max_len, $value->[0], $value->[1];
    }
}

# There just has to be a way to speed this up using lookup tables
# (An obvious way would be byte multiplication tables, but I don't want to
#  invest 384k in the tables)
# Oh well, we do only two crc_multiplies for a crc16_shift so I suppose this
# is acceptable
# Arguments and result are bit reversed
# Arguments are assumed to be <= 0xffff
sub crc16_multiply {
    my ($x, $y) = @_;

    my $a = 0;
    # Use bitwise peasant multiplication with poly reduction
    # It looks reversed because the leftmost bit is really the coef of X**0
    while ($y & 0xffff) {
        $a ^= $x if $y & 0x8000;
        if ($x & 1) {
            $x = ($x >> 1) ^ CRC16_POLY;
        } else {
            $x >>= 1 or return $a;
        }
        $y <<= 1;
    }
    return $a;
}

# This is a sort of "left shift by $n bytes:
#   crc16_shift(crc16($a), $n) = crc16($a . "\x00" x $n)
# which implies:
#   crc16($a . $b) = crc16_shift(crc16($a), length $b) ^ crc16($b)
sub crc16_shift {
    my ($pre, $n) = @_;

    $n %= $crc16_modulo;
    my $low  = $crc16_low->[$n & 0xff];
    my $high = $crc16_high->[$n >> 8];
    return crc16_multiply(crc16_multiply($low, $high), $pre);
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
