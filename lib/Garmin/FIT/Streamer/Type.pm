package Garmin::FIT::Streamer::Type;
use strict;
use warnings;

our $VERSION = '1.000';

use Carp;
use Scalar::Util qw(looks_like_number);

our $types;
require Garmin::FIT::Streamer::BaseType;

our @CARP_NOT = qw(Garmin::FIT::Streamer::BaseType);

sub types {
    return $types;
}

sub new {
    my ($class, %params) = @_;

    my %type;
    $type{name} = delete $params{name} //
        croak "Missing parameter 'name'";
    $type{base_type} = delete $params{base_type} //
        croak "Missing parameter 'base_type'";
    if (ref $type{base_type} eq "") {
        $type{base_type} =
            Garmin::FIT::Streamer::BaseType->from_id($type{base_type});
    } elsif (!eval { $type{base_type}->isa("Garmin::FIT::Streamer::BaseType") }) {
        croak "Parameter 'base_type' is neither a name nor a Garmin::FIT::Streamer::BaseType but '$type{base_type}'";
    }
    $type{size} = $type{base_type}->size;

    my $comment = delete $params{comment};
    $type{comment} = $comment if defined $comment;
    if (defined(my $values = delete $params{values})) {
        my $regex = $type{base_type}->regex;
        my $min   = $type{base_type}->min;
        my $max   = $type{base_type}->max;
        $regex // $max ||
            croak "BaseType '", $type{base_type}->name, "' doesn't allow values";
        ref $values eq "HASH" || ref $values eq "ARRAY" ||
            croak "Parameter 'values' is not a HASH or ARRAY reference but '$values'";
        if (ref $values eq "HASH" && %$values) {
            $type{values} = \my %values;
            for my $name (keys %$values) {
                croak "Value name '$name' can match values" if $name =~ $regex;
                $values->{$name} // croak "Value '$name' is undefined";
                # Maybe allow this to give a name to the invalid value
                ref $values->{$name} eq "" ||
                    croak "Value '$name' is not a plain value but '$values->{$name}'";
                if ($regex) {
                    $values->{$name} =~ $regex ||
                        croak "Value '$name' is not a valid '", $type{base_type}->name, "' BaseType but '$values->{$name}'";
                } elsif (defined $max && looks_like_number($values->{$name})) {
                    croak "Value '$name' is not a valid '", $type{base_type}->name, "' BaseType but '$values->{$name}'";
                }
                croak "Already have a value named '$name'" if $values{lc $name};
                croak "Already have a value valued '$values->{$name}'" if
                    $values{lc $values->{name}};
                $values{lc $name} = $values{lc $values->{name}} = {
                    name	=> $name,
                    value	=> $values->{$name} =~ /^\s*(-?[0-9]+)\s*\z/ ?
                        int($1) : $values->{$name},
                };
            }
        } elsif (ref $values eq "ARRAY" && @$values) {
            $type{values} = \my %values;
            for my $value (@$values) {
                ref $value eq "HASH" ||
                    croak defined $value ?
                        "Value is not a HASH reference but '$value'" :
                        "Undefined value";
                my %value = %$value;
                # Allow value_name and value for easy profile parsing
                my $name =
                    exists $value{name} ? delete $value{name} :
                    exists $value{value_name} ? delete $value{value_name} :
                    croak "Value has no name or value_name";
                $name // croak "Undefined value name";
                if ($regex) {
                    croak "Value name '$name' can match values" if $name =~ $regex;
                } elsif (defined $max && looks_like_number($name)) {
                    croak "Value name '$name' looks like a number";
                }

                my $val = delete $value{value} //
                    croak "Value '$name' is undefined";
                if ($regex) {
                    $val =~ $regex ||
                        croak "Value '$name' is not a valid '", $type{base_type}->name, "' BaseType but '$val'";
                } elsif (defined $max) {
                    looks_like_number($val) ||
                       croak "Value '$name' is not a valid '", $type{base_type}->name, "' BaseType but '$val'";
                    $val == int($val) ||
                       croak "Value '$name' is not a valid '", $type{base_type}->name, "' BaseType but '$val'";
                    $min <= $val && $val <= $max ||
                       croak "Value '$name' is not a valid '", $type{base_type}->name, "' BaseType but '$val'";
                }
                my $comment = delete $value{comment};
                croak "Already have a value named '$name'" if $values{lc $name};
                croak "Already have a value valued '$val'" if $values{lc $val};
                $values{lc $name} = $values{lc $val} = {
                    name	=> $name,
                    # Wrong really. The user regex might allow more than integers
                    # (floats/doubles in particular).
                    # But currently I want real perl integers so they look good
                    # in the autogenerated Profile (+0 doesn't always make an IV)
                    value	=> $val  =~ /^\s*(-?[0-9]+)\s*\z/ ?
                        int($1) : $val,
                    defined $comment ? (comment => $comment) : (),
                };
                croak "Unknown value parameter ", join(", ", keys %value) if %value;
            }
        }
    }

    croak "Unknown parameter ", join(", ", keys %params) if %params;

    croak "Already have a Type named '$type{name}'" if $types->{lc $type{name}};
    return $types->{lc $type{name}} = bless \%type, $class;
}

sub name {
    return shift->{name};
}

sub base_type {
    return shift->{base_type};
}

sub size {
    return shift->{size};
}

sub values {
    return shift->{values};
}

sub value {
    return $_[0]->values->{lc($_[1] // croak "No value id argument")} //
        croak "Unknown value id '$_[1]'";
}

sub value_name {
    return ($_[0]->values->{lc($_[1] // croak "No value id argument")} //
        croak "Unknown value id '$_[1]'")->{name};
}

sub value_value {
    return ($_[0]->values->{lc($_[1] // croak "No value id argument")} //
        croak "Unknown value id '$_[1]'")->{value};
}

sub value_comment {
    return ($_[0]->values->{lc($_[1] // croak "No value id argument")} //
        croak "Unknown value id '$_[1]'")->{comment};
}

sub from_id {
    return $types->{lc($_[1] // croak "No type id argument")} ||
        croak "Unknown type id '$_[1]'";
}

package Garmin::FIT::Streamer::Type::DateTime;
use Carp;
use POSIX qw(strftime);
use Time::Local qw(timegm);
use Scalar::Util qw(looks_like_number);

use vars qw(@ISA $base_time);
@ISA = qw(Garmin::FIT::Streamer::Type);

$base_time = timegm(0, 0, 0, 31, 11, 89);	# 1989-12-31 00:00:00 UTC
sub value_name {
    return ($_[0]->values->{lc($_[1] // croak "No value id argument")} // do {
        return $_[1] if $_[1] < $_[0]->values->{min}{value};
        # Some systems still don't have %F, use %Y-%m-%d instead
        return strftime("%Y-%m-%dT%TZ", gmtime($base_time + $_[1]));
    })->{name};
}

sub value_value {
    return ($_[0]->values->{lc($_[1] // croak "No value id argument")} // do {
        if (looks_like_number($_[1])) {
            return $_[1] if $_[1] < $_[0]->values->{min}{value};
            croak "Epoch time $_[1] before base_time $base_time" if
                $_[1] - $base_time < $_[0]->values->{min}{value};
            return $_[1] - $base_time;
        } else {
            croak "Date converter not implemented (yet)";
        }
    })->{value};
}

package Garmin::FIT::Streamer::Type::LocalDateTime;;
use Carp;
use POSIX qw(strftime);
use Time::Local qw(timelocal);

use vars qw(@ISA $base_time);
@ISA = qw(Garmin::FIT::Streamer::Type);

$base_time = timelocal(0, 0, 0, 31, 11, 89);	# 1989-12-31 00:00:00
sub value_name {
    return ($_[0]->values->{lc($_[1] // croak "No value id argument")} //
        # Some systems still don't have %F, use %Y-%m-%d instead
        return strftime("%Y-%m-%dT%T", localtime($base_time + $_[1]))
       )->{name};
}

1;
