package Garmin::FIT::Streamer::Field;
use strict;
use warnings;

our $VERSION = '1.000';

use Carp;
use Scalar::Util qw(looks_like_number);

require Garmin::FIT::Streamer::Type;

sub new {
    my ($class, %params) = @_;

    my %field;
    defined($field{name} = delete $params{name}) ||
        croak "Missing parameter 'name'";
    croak "Name '$field{name}' looks like a natural" if
        $field{name} =~ /^\s*[0-9]+\s*\z/;

    defined(my $number = delete $params{number}) ||
        croak "Missing parameter 'number'";
    $number =~ /^\s*([0-9]+)\s*\z/ ||
        croak "Parameter 'number' is not a natural number but '$number'";
    $field{number} = int($1);

    defined(my $type = delete $params{type}) ||
        croak "Missing parameter 'type'";
    if (ref $type eq "") {
        $field{type} = Garmin::FIT::Streamer::Type->from_id($type);
    } elsif (eval { $type->isa("Garmin::FIT::Streamer::Type") }) {
        $field{type} = $type;
    } else {
        croak "Parameter 'type' is not a name or a Garmin::FIT::Streamer::Type object but '$type'";
    }

    my $comment = delete $params{comment};
    $field{comment} = $comment if defined $comment;
    my $array = delete $params{array};
    if (defined $array) {
        # $array =~ /^\s*(\+?[1-9][0-9]*)\s*\z/ ||
        # croak "Parameter 'array' is not a positive integer but '$array'";
        $field{array} = $array;
    }

    my $splits;
    for my $tag (qw(bits scale offset unit accumulate)) {
        defined(my $value = delete $params{$tag}) || next;
        if ($value =~ /,/) {
            $field{$tag} = [split /\s*,\s*/, $value];
            if (defined $splits) {
                $splits == @{$field{$tag}} ||
                    croak "Inconsistent split for $tag";
            } else {
                $splits = @{$field{$tag}};
            }
        } else {
            $value =~ s/\s+\z//;
            $value =~ s/^\s+//;
            croak "Parameter '$tag' is empty" if $value eq "";
            if ($tag eq "scale") {
                $value =~ /^\+?0*([1-9][0-9]*)\z/ ||
                    croak "Parameter 'scale' is not a positive integer but '$value'";
                $value = int($1);
                next if $value == 1;
            } elsif ($tag eq "offset") {
                looks_like_number($value) ||
                    croak "Parameter 'offset' is not a number but '$value'";
                $value = int($1) if $value =~ /^([+-]?[0-9]+)\z/;
                next if $value == 0;
            } elsif ($tag eq "accumulate") {
                $value eq "0" || $value eq "1" || croak "Parameter 'accumulate' is not either 0 or 1 but '$value'";
                next if $value eq "0";
                $value = 1;
            } elsif ($tag eq "bits") {
                $value =~ /^\+?0*([1-9][0-9]*)\z/ ||
                    croak "Parameter 'bits' is not a positive integer but '$value'";
                $value = int($1);
            }
            $field{$tag} = $value;
            if (defined $splits) {
                $splits == 1 || croak "Inconsistent split for $tag";
            } else {
                $splits = 1;
            }
        }
    }
    return bless \%field, $class;
}

sub name {
    return shift->{name};
}

sub number {
    return shift->{number};
}

1;
