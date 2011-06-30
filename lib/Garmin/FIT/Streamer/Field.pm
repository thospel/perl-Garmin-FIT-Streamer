package Garmin::FIT::Streamer::Field;
use strict;
use warnings;

our $VERSION = '1.000';

use Carp;
use Scalar::Util qw(looks_like_number);

require Garmin::FIT::Streamer::Type;

our @CARP_NOT = qw(Garmin::FIT::Streamer::Type);

# We should probably distinguish creating a definition field and a base field
# We conflate the two classes here
sub new {
    my ($class, %params) = @_;

    my %field;

    my $base_type = delete $params{base_type};
    if (defined $base_type) {
        if (ref $base_type eq "") {
            $base_type = Garmin::FIT::Streamer::BaseType->from_id($base_type);
        } elsif (!eval { $base_type->isa("Garmin::FIT::Streamer::BaseType") }) {
            croak "Parameter 'base_type' is not a plain value or a Garmin::FIT::Streamer::BaseType object but '$base_type'";
        }
    }

    my $model_field = delete $params{model_field};
    my $model_number;
    if (defined $model_field) {
        if (ref $model_field eq "") {
            croak "Scalar field '$model_field' not handled (yet)";
        }
        eval { $model_field->isa("Garmin::FIT::Streamer::Field") } ||
            croak "Parameter model_field is not a Garmin::FIT::Streamer::Field object but '$model_field'";
        $field{model_field} = $model_field;
        $base_type ||= $model_field->base_type;
        $model_number = $model_field->number;
    }

    my $number =
        exists $params{number} ? delete $params{number} :
        $model_field ? $model_number :
        croak "Missing parameter 'number'";
    defined $number || croak "Parameter 'number' is undefined";
    $number =~ /^\s*([0-9]+)\s*\z/ ||
        croak "Parameter 'number' is not a natural number but '$number'";
    $1 <= 255 ||
        croak "Field '$1': Field number '$1' is too high (at most 255)";
    # Don;'t check the $model_number. If they are different assume the user
    # knows what he is doing and wants to reuse some simular field
    # !defined $model_number || $model_number == $1 ||
    #    croak "Field '$1': Field number '$1' is inconsistent with field model number '$model_number'";
    $field{number} = int($1);

    eval {
        if (exists $params{name}) {
            $field{name} = delete $params{name} ||
                croak defined $field{name} ?
                    "Parameter 'name' is false" :
                    "Missing parameter 'name'";
            croak "Name '$field{name}' looks like a natural" if
                $field{name} =~ /^\s*[0-9]+\s*\z/;
            $field{id} = $field{name};
        } else {
            $field{id} =
                $model_field && $model_field->name ||
                "<$field{number}>";
        }

        my $type =
            exists $params{type} ? delete $params{type} :
            $model_field ? $model_field->type :
            $base_type ? $base_type->name :
            croak "Missing parameter 'type'";
        if (ref $type eq "") {
            defined($type) || croak "Parameter 'type' is undefined";
            $field{type} = $type = Garmin::FIT::Streamer::Type->from_id($type);
        } elsif (eval { $type->isa("Garmin::FIT::Streamer::Type") }) {
            $field{type} = $type;
        } else {
            croak "Parameter 'type' is not a name or a Garmin::FIT::Streamer::Type object but '$type'";
        }
        if ($base_type && $type->base_type != $base_type) {
            my $got_name = $type->base_type;
            my $expect_name = $base_type->name;
            croak "Inconsistent base_type '$got_name' while expecting '$expect_name'";
        }

        my $type_size = $field{type}->size;
        my $size =
            exists $params{size} ? delete $params{size} :
            $model_field ? $model_field->size :
            $type_size;
        $size =~ /^\s*(\+?[0-9]+)\s*\z/ ||
        croak "Parameter 'size' is not a natural number but '$size'";
        $field{size} = int($1);
        if ($type_size && $type_size != $field{size}) {
            # Mmm, it seems we have an array
            $field{size} % $type_size == 0 ||
                croak "Parameter size '$field{size}' is inconsistent with type size '$type_size'";
            $field{array} = $field{size} / $type_size;
        }

        $field{big_endian} = delete $params{big_endian} ? 1 : 0 if
            exists $params{big_endian};
        my $comment =
            exists $params{comment} ? delete $params{comment} :
            $model_field ? $model_field->comment :
            undef;
        $field{comment} = $comment if defined $comment;

        my $array =
            exists $params{array} ? delete $params{array} :
            $model_field ? $model_field->array :
            undef;
        if (defined $array) {
            if ($array =~ /^\s*(\+?[1-9][0-9]*)\s*\z/) {
                if (defined $field{array}) {
                    $field{array} == $1 ||
                        croak "Implied array size '$field{array}' inconsistent with declared array size '$1'";
                } else {
                    $field{array} = $1;
                }
            } else {
                # Don't know how to handle this (yet)
                # croak "Parameter 'array' is not a positive integer but '$array'";
                $field{array} = $array if !defined $field{array};
            }
        }

        my ($value, $splits);
        for my $tag (qw(bits scale offset unit accumulate)) {
            my $value =
                exists $params{$tag} ? delete $params{$tag} :
                $model_field ? $model_field->$tag :
                next;
            defined $value || next;
            my @values;
            if (ref $value eq "") {
                $value =~ s/^\s+//;
                $value =~ s/\s+\z//;
                @values = split /\s*,\s*/, $value or
                croak "Parameter '$tag' is empty";
            } elsif (ref $value eq "ARRAY") {
                @values = @$value or
                    croak "Parameter '$tag' element is an empty ARRAY reference";
                for my $v (@values) {
                    defined $v || croak "Parameter '$tag' element is undefined";
                    ref $v eq "" || croak "Parameter '$tag' element is not a plain value but '$v'";
                    $v =~ s/^\s+//;
                    $v =~ s/\s+\z//;
                    $v ne "" || croak "Parameter '$tag' element is empty";
                }
            } else {
                croak "Parameter '$tag' is not a plain value or an array reference but '$value'";
            }
            if (defined $splits) {
                $splits == @values ||
                    croak "Parameter '$tag' has an inconsistent split";
            } else {
                $splits = @values;
            }

            my $special;
            for my $v (@values) {
                if ($tag eq "scale") {
                    $v =~ /^\+?0*([1-9][0-9]*)\z/ ||
                        croak "Parameter 'scale' is not a positive integer but '$v'";
                    $v = int($1);
                    $special ||= $v != 1;
                } elsif ($tag eq "offset") {
                    looks_like_number($v) ||
                        croak "Parameter 'offset' is not a number but '$v'";
                    $v = int($1) if $v =~ /^([+-]?[0-9]+)\z/;
                    $special ||= $v;
                } elsif ($tag eq "accumulate") {
                    if ($v eq "1") {
                        $special ||= 1;
                    } elsif ($v ne "0") {
                        croak "Parameter 'accumulate' is neither 0 nor 1 but '$v'";
                    }
                } elsif ($tag eq "bits") {
                    $v =~ /^\+?0*([1-9][0-9]*)\z/ ||
                        croak "Parameter 'bits' is not a positive integer but '$v'";
                    $v = int($1);
                    $special ||= 1;
                } elsif ($tag eq "unit") {
                    $v || croak "Parameter unit is not a true value but '$v'";
                    $special ||= 1;
                } else {
                    die "Assertion: Unknown tag '$tag'";
                }
            }
            $field{$tag} = \@values if $special;
        }
        # The combination in fact DOES happen
        # e.g. weight_scale has a scale of 100 and a special value that means
        # "calculating"
        # croak "Cannot combine values with offset or scale" if
        #    (defined $field{scale} || defined $field{offset}) &&
        #    $field{type}->values;

        croak "Unknown parameter ", join(", ", map "'$_'", keys %params) if %params;
    };
    die "Field '$number': $@" if $@;

    return bless \%field, $class;
}

sub name {
    return shift->{name} || croak "No name";
}

sub try_name {
    return shift->{name};
}

sub number {
    return shift->{number};
}

sub id {
    return shift->{id};
}

sub type {
    return shift->{type} || die "Assertion: No type";
}

sub base_type {
    return shift->{type}->base_type;
}

sub comment {
    return shift->{comment};
}

sub bits {
    return shift->{bits};
}

sub array {
    return shift->{array};
}

sub scale {
    return shift->{scale} || 1;
}

sub offset {
    return shift->{offset} || 0;
}

sub unit {
    return shift->{unit};
}

sub accumulate {
    return shift->{accumulate} || 0;
}

sub size {
    return shift->{size};
}

sub big_endian {
    return shift->{big_endian};
}

sub model_field {
    return shift->{model_field};
}

sub decode_inplace {
    my $field = shift;
    for my $data (@_) {
        if (defined $field->{array}) {
            my $base_type = $field->{type}->base_type;
            my @array = unpack($base_type->decoder($field->{big_endian}) . "*", $data);
            local $field->{array};
            $field->decode_inplace(@array);
            $data = \@array;
        } elsif (eval { $data = $field->{type}->value_name($data); 1 }) {
            # done
        } elsif ($data eq $field->{type}->base_type->invalid) {
            $data = undef;
        } else {
            $data /= $field->{scale}[0]  if $field->{scale};
            $data -= $field->{offset}[0] if $field->{offset};
        }
    }
}

1;
