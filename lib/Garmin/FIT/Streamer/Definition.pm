package Garmin::FIT::Streamer::Definition;
use strict;
use warnings;

our $VERSION = '1.000';

use Carp;
use Scalar::Util qw(refaddr);

use Garmin::FIT::Streamer::Profile;

our @CARP_NOT = qw(Garmin::FIT::Streamer);

sub new {
    my ($class, %params) = @_;

    # defined(my $fit = delete $params{fit}) || croak "No fit parameter";
    defined(my $message = delete $params{message}) ||
        croak "No message parameter";
    defined(my $fields = delete $params{fields}) ||
        croak "No fields parameter";
    ref $fields eq "ARRAY" ||
        croak "fields is not an ARRAY reference but '$fields'";
    @$fields <= 255 || croak "Too many fields (at most 255)";
    @$fields || croak "No fields being defined";
    my $big_endian  = delete $params{big_endian} ? 1 : 0;

    croak "Unknown parameter ", join(", ", keys %params) if %params;

    my $define_string = pack($big_endian ? "xCnC" : "xCvC",
                             $big_endian, $message, scalar @$fields);
    my $code_string = "C";
    my %fields;

    for my $field (@$fields) {
        defined(my $field_number = $field->{number}) || croak "No field number";
        croak "Multiple uses of field $field_number" if $fields{$field_number};
        defined(my $base_type = $field->{base_type}) ||
            croak "No field base_type";
        $base_type = Garmin::FIT::Streamer->base_type($base_type);
        my $size = $field->{size};
        if (defined $size) {
            $size =~ /^\s*([0-9]+)\s*\z/ ||
                croak "Field size may not be '$size'";
            $size = $1 + 0 || croak "Field size may not be '$1'";
            croak "Inconsistent field size '$size' for base type '$base_type->{name}'" if
                $base_type->{size} && $size != $base_type->{size};
        } else {
            $size = $base_type->{size} || croak "No field size";
        }
        $define_string .= pack("CCC",
                               $field_number, $size, $base_type->{number});
        $code_string .= $base_type->{decoder}[$big_endian];
        $code_string .= $size if !$base_type->{size};
        $fields{field_number} = {
            number	=> $field_number,
            base_type	=> $base_type,
            size	=> $size,
        };
    }

    my $definition = {
        # fit		=> $fit,
        message		=> $message,
        big_endian	=> $big_endian,
        fields		=> \%fields,
        define_string	=> $define_string,
        code_string	=> $code_string,
    };
    $definition->{id} = sprintf("%X", refaddr($definition));

    return bless $definition, $class;
}

sub id {
    return shift->{id};
}

sub big_endian {
    return shift->{big_endian};
}

sub code_string {
    return shift->{code_string};
}

sub define_string {
    my ($definition, $local_id) = @_;
    return chr(0x40 + $local_id) . $definition->{define_string};
}

sub encode {
    my $definition = shift;
    return pack($definition->{code_string}, @_);
}

1;
