package Garmin::FIT::Streamer::Definition;
use strict;
use warnings;

our $VERSION = '1.000';

use Carp;
use Scalar::Util qw(refaddr);

require Garmin::FIT::Streamer::Message;

our @CARP_NOT = qw(Garmin::FIT::Streamer::Message);

my $dummy_fields = {};

sub new {
    my ($class, %params) = @_;

    # defined(my $fit = delete $params{fit}) || croak "No fit parameter";

    my ($message, $message_number);
    my $message_id = delete $params{message};
    if (ref $message_id eq "") {
        defined $message_id || croak "No message parameter";
        $message = Garmin::FIT::Streamer::Message->try_from_id($message_id);
        $message_number = $message ? $message->number : $message_id;
    } elsif (eval { $message_id->isa("Garmin::FIT::Streamer::Message") }) {
        $message = $message_id;
        $message_number = $message->number;
        $message_id = $message->name;
    } else {
        croak "Parameter message is neither a plain value nor a Garmin::FIT::Streamer::Message object but '$message_id'";
    }
    $message_number =~ /^\s*\+?([0-9]+)\s*\z/ ||
        croak "Unknown non-numeric message parameter '$message_number'";
    $message_number = int($1);
    $message_number <= 65535 || croak "Parameter 'message' has value '$message_number' but should be at most 65535";


    defined(my $fields = delete $params{fields}) ||
        croak "No fields parameter";
    ref $fields eq "ARRAY" ||
        croak "fields is not an ARRAY reference but '$fields'";
    @$fields <= 255 || croak "Too many fields (at most 255)";
    @$fields || croak "No fields being defined";

    my $big_endian = delete $params{big_endian} ? 1 : 0;

    croak "Unknown parameter ", join(", ", keys %params) if %params;

    my $define_string = pack($big_endian ? "xCnC" : "xCvC",
                             $big_endian, $message_number, scalar @$fields);
    my $code_string = "C";
    my (%fields, $base_type, $model);

    my @fields = @$fields;
    for my $field (@fields) {
        defined $field || croak "Undefined field";
        if (ref $field eq "") {
            $message || croak "Field '$field': Unknown because message '$message_id' is not in the global profile";
            $model = eval { $message->field_from_id($field) } ||
                croak "Field '$field': Unknown because message '$message_id' has no such field in the global profile";
            eval { $field = ref($model)->new(field => $model) };
            die "Field '$field': $@" if $@;
            $base_type = $field->base_type;
        } elsif (ref $field eq "HASH") {
            if (defined($model = $field->{field})) {
                if (ref $model eq "") {
                    $model = $message->field_from_id($model);
                    $field = Garmin::FIT::Streamer::Field->new(
                        %$field,
                        field => $model);
                } elsif (eval { $field->isa("Garmin::FIT::Streamer::Field") }) {
                    $field = (ref $field)->new(%$field);
                } else {
                    croak "Parameter field is neither a plain value nor a Garmin::FIT::Streamer::Field object but '$model'";
                }
            } else {
                $field = Garmin::FIT::Streamer::Field->new(%$field);
            }
            $base_type = $field->base_type;
            if (my $profile = $field->model || $message && $message->try_field_from_id($field->number)) {
                if ($profile->base_type != $base_type) {
                    my $field_number = $field->number;
                    my $field_name = $base_type->{name};
                    my $profile_name = $profile->base_type->name;
                    croak "Field '$field_number': Inconsistent base_type. Field uses '$field_name' but profile expects '$profile_name'";
                }
            }
        } else {
            croak "Field '$field' is neither a plain value nor a HASH reference";
        }
        my $field_number = $field->number;
        my $size = $field->size ||
            croak "Field '$field_number': Parameter 'size' is still 0";
        croak "Multiple uses of field number $field_number" if
            $fields{$field_number};
        $fields{$field_number} = 1;

        $define_string .= pack("CCC",
                               $field_number, $size, $base_type->number);
        $code_string .= $base_type->decoder($big_endian);
        $code_string .= $size if !$base_type->size;
    }

    my $mess = {
        # fit		=> $fit,
        message_number	=> $message_number,
        message		=> $message,
        big_endian	=> $big_endian,
        fields		=> \@fields,
        define_string	=> $define_string,
        code_string	=> $code_string,
    };
    $mess->{id} = sprintf("%X", refaddr($mess));

    return bless $mess, $class;
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
    my ($message, $local_id) = @_;
    return chr(0x40 + $local_id) . $message->{define_string};
}

sub encode {
    my ($message, $local_id, @values) = @_;
    my $i = 0;
    for my $value (@values) {
        my $field = $message->{fields}[$i++];
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
    return pack($message->{code_string}, $local_id, @values);
}

1;
