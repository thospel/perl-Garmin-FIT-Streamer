package Garmin::FIT::Streamer::Definition;
use strict;
use warnings;

our $VERSION = '1.000';

use Carp;
use Scalar::Util qw(refaddr);

require Garmin::FIT::Streamer::BaseType;
require Garmin::FIT::Streamer::Profile;

our @CARP_NOT = qw(Garmin::FIT::Streamer);

my $dummy_fields = {};

sub new {
    my ($class, %params) = @_;

    # defined(my $fit = delete $params{fit}) || croak "No fit parameter";

    defined(my $message_id = delete $params{message}) ||
        croak "No message parameter";
    my $message = Garmin::FIT::Streamer->try_message_from_id($message_id);
    my $message_fields = $message ? $message->{fields} : $dummy_fields;
    my $message_number = $message ?
        $message->{number} :
        $message_id =~ /^\s*([0-9]+)\s*\z/ ? $1 + 0 :
        croak "Invalid message parameter '$message_id'";

    defined(my $fields = delete $params{fields}) ||
        croak "No fields parameter";
    ref $fields eq "ARRAY" ||
        croak "fields is not an ARRAY reference but '$fields'";
    @$fields <= 255 || croak "Too many fields (at most 255)";
    @$fields || croak "No fields being defined";

    my $big_endian  = delete $params{big_endian} ? 1 : 0;

    croak "Unknown parameter ", join(", ", keys %params) if %params;

    my $define_string = pack($big_endian ? "xCnC" : "xCvC",
                             $big_endian, $message_number, scalar @$fields);
    my $code_string = "C";
    my (%fields, $field, $field_id, $field_number, $base_type);

    my @fields = @$fields;
    for my $field_id (@fields) {
        defined $field_id || croak "Undefined field";
        my $known;
        if (ref $field_id eq "") {
            croak "Field '$field_id': Unknown because message '$message_id' is not in the global profile" if $message_fields == $dummy_fields;
            $field = $known = $message_fields->{lc $field_id} ||
                croak "Field '$field_id': Unknown because message '$message_id' has no such field in the global profile";
            $field_number = $field->{number} ||
                die "Assertion: no field number";
        } elsif (ref $field_id eq "HASH") {
            $field = $field_id;
            defined($field_id = $field_number = $field->{number}) ||
                croak "No field number";
        } else {
            croak "Field '$field' is neither a string nor a HASH reference";
        }
        eval {
            $field_number =~ /^\s*([0-9]+)\s*\z/ ||
                croak "Field number '$field_number' is not a natural number";
            $field_number = $1 + 0;
            $field_number <= 255 || croak "Field number '$field_number' is too high (at most 255)";
            croak "Multiple uses of field number $field_number" if
                $fields{$field_number};
            my $message_field =
                $message_fields->{$field->{number}} || $dummy_fields;

            my $type = $field->{type};
            if (defined($type)) {
                if (ref $type eq "") {
                    $type = Garmin::FIT::Streamer->type($type);
                    $base_type = $type->{base_type};
                } else {
                    $base_type = $type->{base_type};
                    eval { $base_type->isa("Garmin::FIT::Streamer::BaseType")}&&
                        defined $base_type->{name} &&
                        $base_type == Garmin::FIT::Streamer::BaseType->from_id($base_type->{name}) ||
                        croak "Corrupt type";
                }
                $message_field == $dummy_fields ||
                    $message_field->{type}{base_type} == $base_type ||
                    croak "Inconsistent base_type. Field uses '$base_type->{name}' but profile expects '$message_field->{type}{base_type}{name}'";
            } else {
                $type = $message_field->{type} || croak "No field type";
                $base_type = $type->{base_type};
            }

            my $size = $field->{size};
            if (defined $size) {
                $size =~ /^\s*([0-9]+)\s*\z/ ||
                croak "Field size may not be '$size'";
                $size = $1 + 0 || croak "Field size may not be '$1'";
                croak "Inconsistent field size '$size' for base type '$base_type->{name}' (size $base_type->{size})" if
                    $base_type->{size} && $size != $base_type->{size};
            } else {
                $size = $base_type->{size} || croak "Base type '$base_type->{name}' without field size";
            }
            $define_string .= pack("CCC",
                                   $field_number, $size, $base_type->{number});
            $code_string .= $base_type->{decoder}[$big_endian];
            $code_string .= $size if !$base_type->{size};
            $field_id = $fields{$field_number} = {
                number	=> $field_number,
                type	=> $type,
                size	=> $size,
                $known ? (message_field => $known) : (),
            };
        };
        die "Field '$field_id': $@" if $@;
    }

    my $definition = {
        # fit		=> $fit,
        message_number	=> $message_number,
        message		=> $message,
        big_endian	=> $big_endian,
        fields		=> \@fields,
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
    my ($definition, $local_id, @values) = @_;
    my $i = 0;
    for my $value (@values) {
        my $field = $definition->{fields}[$i++];
        my $base_type = $field->{type}{base_type};
        if (defined $value) {
            # string: 7
            if ($base_type->{number} != 7) {
                if (defined $field->{type}{values}{$value}) {
                    $value = $field->{type}{values}{$value};
                }
                $value =~ $base_type->{regex} ||
                    croak "Invalid $base_type->{name} value '$value'";
            }
        } else {
            $value = $base_type->{invalid};
        }
    }
    return pack($definition->{code_string}, $local_id, @values);
}

1;
