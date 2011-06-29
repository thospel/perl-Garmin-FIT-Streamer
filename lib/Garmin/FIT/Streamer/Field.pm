package Garmin::FIT::Streamer::Field;
use strict;
use warnings;

our $VERSION = '1.000';

use Carp;
use Scalar::Util qw(looks_like_number);

require Garmin::FIT::Streamer::Type;

our @CARP_NOT = qw(Garmin::FIT::Streamer::Type);

sub new {
    my ($class, %params) = @_;

    my %field;

    my $model_field = delete $params{field};
    if (ref $model_field eq "") {
        if (defined $model_field) {
            croak "Scalar field '$model_field' not handled (yet)";
        }
    } else {
        eval { $model_field->isa("Garmin::FIT::Streamer::Field") } ||
            croak "Parameter field is not a Garmin::FIT::Streamer::Field object but '$model_field'";
        $field{model} = $model_field;
    }

    my $number =
        exists $params{number} ? delete $params{number} :
        $model_field ? $model_field->number :
        croak "Missing parameter 'number'";
    defined $number || croak "Parameter 'number' is undefined";
    $number =~ /^\s*([0-9]+)\s*\z/ ||
        croak "Parameter 'number' is not a natural number but '$number'";
    $1 <= 255 ||
        croak "Field '$1': Field number '$1' is too high (at most 255)";
    $field{number} = int($1);

    eval {
        if (exists $params{name}) {
            defined($field{name} = delete $params{name}) ||
                croak "Missing parameter 'name'";
            croak "Name '$field{name}' looks like a natural" if
                $field{name} =~ /^\s*[0-9]+\s*\z/;
        }

        my $type =
            exists $params{type} ? delete $params{type} :
            $model_field ? $model_field->type :
            croak "Missing parameter 'type'";
        if (ref $type eq "") {
            defined($type) || croak "Parameter 'type' is undefined";
            $field{type} = Garmin::FIT::Streamer::Type->from_id($type);
        } elsif (eval { $type->isa("Garmin::FIT::Streamer::Type") }) {
            $field{type} = $type;
        } else {
            croak "Parameter 'type' is not a name or a Garmin::FIT::Streamer::Type object but '$type'";
        }

        my $type_size = $field{type}->size;
        my $size =
            exists $params{size} ? delete $params{size} :
            $model_field ? $model_field->size :
            $type_size;
        $size =~ /^\s*(\+?[0-9]+)\s*\z/ ||
        croak "Parameter 'size' is not a natural number but '$size'";
        croak "Parameter size '$1' is inconsistent with type size '$type_size'" if
        $type_size && $type_size != $1;
        $field{size} = int($1);

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
            # $array =~ /^\s*(\+?[1-9][0-9]*)\s*\z/ ||
            # croak "Parameter 'array' is not a positive integer but '$array'";
            $field{array} = $array;
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
                    $special ||= 1;
                } else {
                    die "Assertion: Unknown tag '$tag'";
                }
            }
            $field{$tag} = \@values if $special;
        }

        croak "Unknown parameter ", join(", ", map "'$_'", keys %params) if %params;
    };
    die "Field '$number': $@" if $@;

    return bless \%field, $class;
}

sub name {
    return shift->{name};
}

sub number {
    return shift->{number};
}

sub type {
    return shift->{type} || die "Assertion: No type";
}

sub base_type {
    return shift->type->base_type;
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

sub model {
    return shift->{model};
}

1;
