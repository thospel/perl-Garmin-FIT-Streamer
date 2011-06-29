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
        defined($base_type{$tag} = delete $params{$tag}) ||
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
        defined($base_type{regex} = delete $params{regex}) ||
            croak "Missing parameter 'regex'";
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

sub from_id {
    defined $_[1] || croak "No base_type id argument";
    return $base_types->{lc $_[1]} || croak "Unknown base_type id '$_[1]'";
}

sub regex {
    return shift->{regex};
}

sub decoder {
    return shift->{decoder} if @_ <= 1;
    return $_[0]->{decoder}[$_[1] ? 1 : 0] || die "Assertion: No decoder";
}

1;
