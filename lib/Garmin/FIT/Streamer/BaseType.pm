package Garmin::FIT::Streamer::BaseType;
use strict;
use warnings;

our $VERSION = '1.000';

use Carp;

our $base_types;
require Garmin::FIT::Streamer::Profile;

our @CARP_NOT = qw(
    Garmin::FIT::Streamer::Profile
);

sub base_types {
    return $base_types;
}

sub new {
    my ($class, %params) = @_;

    my %base_type;
    $base_type{notice} = 1 if delete $params{notice};

    for my $tag (qw(name number size decoder invalid)) {
        $base_type{$tag} = delete $params{$tag} //
            croak "Missing parameter '$tag'";
    }
    croak "name parameter '$base_type{name}' is a number" if
        $base_type{name} =~ /^\s*[0-9]+\s*\z/;
    for my $tag (qw(number size invalid)) {
        $base_type{$tag} =~ /^\s*([0-9]+)\s*\z/ ||
            croak "Parameter '$tag' is not a natural number but '$base_type{$tag}'";
        $base_type{$tag} = int($1);
    }
    if ($base_type{size}) {
        # We already checked that invalid is an integer
        # looks_like_number($base_type{invalid}) ||
        #   croak "Parameter 'invalid' is not a number but '$base_type{invalid}'";
        if (exists $params{regex}) {
            $base_type{regex} = delete $params{regex} //
                croak "Undefined parameter 'regex'";
            $base_type{invalid} =~ $base_type{regex} ||
                croak "Parameter 'invalid' value '$base_type{invalid}' does not match regex";
        } else {
            # Integer types only

            my $min = delete $params{min} // croak "Missing parameter 'min'";
            $min =~ /^\s*([+-]?[0-9]+)\s*\z/ ||
                croak "Parameter 'min' is not an integer but '$min'";
            $base_type{min} = int($1);;
            my $max = delete $params{max} // croak "Missing parameter 'max'";
            $max =~ /^\s*([+-]?[0-9]+)\s*\z/ ||
                croak "Parameter 'min' is not an integer but '$max'";
            $base_type{max} = int($1);;

            # We already checked that invalid is an integer
            # $base_type{invalid} == int($base_type{invalid}) ||
            #    croak "Parameter 'invalid' is not an integer but '$base_type{invalid}'";
            $base_type{invalid} < $base_type{min} ||
            $base_type{max} < $base_type{invalid} ||
                croak "Parameter 'invalid' value '$base_type{invalid}' falls in the interval [$base_type{min}, $base_type{max}]";
        }
    }
    my $comment = delete $params{comment};
    $base_type{comment} = $comment if defined $comment;

    croak "Unknown parameter ", join(", ", keys %params) if %params;

    ref $base_type{decoder} eq "ARRAY" ||
        croak "Parameter 'decoder' is not an ARRAY reference but '$base_type{decoder}'";
    @{$base_type{decoder}} == 2 ||
        croak "Parameter decoder is not a 2 element ARRAY reference";
    for my $decoder (@{$base_type{decoder}}) {
        ref $decoder eq "" ||
            croak "Parameter 'decoder' element is no a plain string but '$decoder'";
    }
    $base_type{decoder} = [@{$base_type{decoder}}];

    croak "Already have a BaseType named '$base_type{name}'" if
        $base_types->{lc $base_type{name}};
    croak "Already have a BaseType numbered '$base_type{number}'" if
        $base_types->{$base_type{number}};
    return
        $base_types->{lc $base_type{name}} =
        $base_types->{$base_type{number}} =
        bless \%base_type, $class;
}

sub name {
    return shift->{name};
}

sub number {
    return shift->{number};
}

sub size {
    return shift->{size};
}

sub invalid {
    return shift->{invalid};
}

sub from_id {
    defined $_[1] || croak "No base_type id argument";
    return $base_types->{lc $_[1]} || croak "Unknown base_type id '$_[1]'";
}

sub regex {
    return shift->{regex};
}

sub min {
    return shift->{min};
}

sub max {
    return shift->{max};
}

sub decoder {
    return shift->{decoder} if @_ <= 1;
    return $_[0]->{decoder}[$_[1] ? 1 : 0] || die "Assertion: No decoder";
}

1;
