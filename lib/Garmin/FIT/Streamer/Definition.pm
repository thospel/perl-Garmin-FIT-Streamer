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
    # use Data::Dumper;
    # print Dumper(\@_);

    # defined(my $fit = delete $params{fit}) || croak "No fit parameter";

    my ($message, $message_number);
    my $message_id = delete $params{message};
    if (ref $message_id eq "") {
        defined $message_id || croak "No message parameter";
        if ($message = Garmin::FIT::Streamer::Message->try_from_id($message_id)) {
            $message_number = $message->number;
            $message_id = $message->name;
        } else {
            $message_number = $message_id;
        }
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

    my $unit_preferences = delete $params{unit_preferences};
    my $big_endian = delete $params{big_endian} ? 1 : 0;

    my $define_string = pack($big_endian ? "xCnC" : "xCvC",
                             $big_endian, $message_number, scalar @$fields);
    my $code_string = "";

    my (%field_index, $base_type, $model);
    my $total_size = 0;
    my $i = 0;
    my @fields = @$fields;
    for my $field (@fields) {
        defined $field || croak "Undefined field";
        if (ref $field eq "") {
            $message || croak "Field '$field': Unknown because message '$message_id' is not in the global profile";
            $model = eval { $message->field_from_id($field) } ||
                croak "Field '$field': Unknown because message '$message_id=$message_number' has no such field in the global profile";
            eval {
                $field = ref($model)->new(
                    model_field => $model,
                    big_endian	=> $big_endian,
                    unit_preferences	=> $unit_preferences,
                   );
            };
            die "Message '$message_id': Field '$field': $@" if $@;
            $base_type = $field->base_type;
        } elsif (ref $field eq "HASH") {
            if (defined($model = $field->{model_field})) {
                if (ref $model eq "") {
                    $model = $message->field_from_id($model);
                    $field = Garmin::FIT::Streamer::Field->new(
                        %$field,
                        model_field	=> $model,
                        big_endian	=> $big_endian,
                        unit_preferences	=> $unit_preferences,
                       );
                } elsif (eval { $model->isa("Garmin::FIT::Streamer::Field") }) {
                    $field = (ref $model)->new(
                        %$field,
                        big_endian => $big_endian,
                        unit_preferences	=> $unit_preferences,
                       );
                } else {
                    croak "Parameter field is neither a plain value nor a Garmin::FIT::Streamer::Field object but '$model'";
                }
            } else {
                $field = Garmin::FIT::Streamer::Field->new(
                    %$field,
                    big_endian	=> $big_endian,
                    unit_preferences	=> $unit_preferences,
                   );
            }
            $base_type = $field->base_type;
            if (my $profile = $field->model_field ||
                $message && $message->try_field_from_id($field->number)) {
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
        croak "Multiple uses of field number $field_number" if
            exists $field_index{$field_number};
        $field_index{$field_number} = $i;
        if (defined(my $field_name = $field->try_name)) {
            croak "Multiple uses of field name $field_name" if
                exists $field_index{lc $field_name};
            $field_index{lc $field_name} = $i;
        }

        my $size = $field->size ||
            croak "Field '$field_number': Parameter 'size' is still 0";
        $total_size += $size;
        $define_string .= pack("CCC",
                               $field_number, $size, $base_type->number);
        if (defined(my $array = $field->array)) {
            $code_string .= "a" . $size;
        } else {
            $code_string .= $base_type->decoder($big_endian);
            $code_string .= $size if !$base_type->size;
        }
    } continue {
        ++$i;
    }

    my $definition = {
        # fit		=> $fit,
        message_id	=> $message_id,
        message_number	=> $message_number,
        message		=> $message,
        big_endian	=> $big_endian,
        fields		=> \@fields,
        field_index	=> \%field_index,
        define_string	=> $define_string,
        code_string	=> $code_string,
        total_size	=> $total_size,
    };
    if (defined(my $on_record = delete $params{on_record})) {
        ref $on_record eq "CODE" ||
            croak "Parameter 'on_record' is not undefined or a CODE reference but '$on_record'";
        $definition->{on_record} = $on_record;
    }
    my $user_data = delete $params{user_data};
    $definition->{user_data} = $user_data if defined $user_data;
    $definition->{id} = sprintf("%X", refaddr($definition));

    my $select = delete $params{select};
    $class->can("select")->($select) if defined $select;

    croak "Unknown parameter ", join(", ", map "'$_'", keys %params) if %params;

    return bless $definition, $class;
}

sub on_record {
    return shift->{on_record} if @_ <= 1;
    my ($definition, $on_record) = @_;
    !defined $on_record || ref $on_record eq "CODE" ||
    croak "on_record is not undefined or a CODE reference but '$on_record'";
    my $old = $definition->{on_record};
    $definition->{on_record} = $on_record;
    return $old;
}

sub user_data {
    return shift->{user_data} if @_ <= 1;
    my $definition = shift;
    my $old = $definition->{user_data};
    $definition->{user_data} = shift;
    return $old;
}

sub select : method {
    my ($definition, %select) = @_;

    my $field_index = $definition->{field_index};
    my (%seen_index, @tags, @indices);
    for my $tag (keys %select) {
        if (defined(my $index = $field_index->{lc $tag})) {
            croak "Can only select a field once" if $seen_index{$index};
            $seen_index{$index} = 1;
            push @tags, $tag;
            push @indices, $index;
        } elsif ($select{$tag}) {
            # Mandatory
            croak("Selected field '$tag' is not available. Have: ",
                  join(", ", map $_->{id}, @{$definition->{fields}}));
        }
    }

    # At some point we could also optimize the decode string....
    $definition->{select_tags}    = \@tags;
    $definition->{select_indices} = \@indices;
}

sub id {
    return shift->{id};
}

sub big_endian {
    return shift->{big_endian};
}

sub message_number {
    return shift->{message_number};
}

sub message_id {
    return shift->{message_id};
}

sub message {
    return shift->{message} || croak "Message not in profile";
}

sub try_message {
    return shift->{message};
}

sub code_string {
    return shift->{code_string};
}

sub total_size {
    return shift->{total_size};
}

sub define_string {
    my ($message, $local_id) = @_;
    return chr(0x40 + $local_id) . $message->{define_string};
}

sub fields {
    return @{shift->{fields}};
}

sub field {
    defined $_[1] || croak "No field id argument";
    return $_[0]->{fields}[$_[0]->{field_index}{lc $_[1]} // croak "Unknown field id '$_[1]'"];
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
    return pack("C" . $message->{code_string}, $local_id, @values);
}

sub decode {
    my $definition = shift;

    defined $_[0] || croak "No bytes argument";
    length $_[0] == $definition->{total_size} || croak "Incorrect bytes length";
    my @data = unpack($definition->{code_string}, $_[0]);

    if ($definition->{select_tags}) {
        my %data;
        @data{@{$definition->{select_tags}}} = map {
            $definition->{fields}[$_]->decode_inplace($data[$_]);
            $data[$_]; # // croak("Invalid value in field ",
                       #        $definition->{fields}[$_]->id);
        } @{$definition->{select_indices}};
        return \%data;
    }
    my $i = -1;
    for my $field (@{$definition->{fields}}) {
        $field->decode_inplace($data[++$i]);
    }
    return \@data;
}

1;
