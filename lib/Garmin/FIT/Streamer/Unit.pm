package Garmin::FIT::Streamer::Unit;
use strict;
use warnings;

our $VERSION = '1.000';

use Carp;

our %base_units = (
    kg		=> 1,
    meter	=> 1,
    second	=> 1,
    # degree	=> 1,
    degrees	=> 1,
    celcius	=> 1,
    volt	=> 1,
    bit		=> 1,
    beat	=> 1,
);
our %units = (
    "s"		=> {
        second	=> 1,
    },
    min	=> {
        minute	=> 1,
    },
    minute	=> {
        second	=> 60,
    },
    hour	=> {
        minute	=> 60,
    },
    day	=> {
        hour	=> 24,
    },
    mile	=> {
        inch	=> 63360,
    },
    inch	=> {
        cm	=> 2.54,
    },
    cm		=> {
        meter	=> 0.01,
    },
    mm		=> {
        meter	=> 0.001,
    },
    mph	=> {
        "mile/hour"	=> 1,
    },
    rpm		=> {
        "rotation/minute"	=> 1,
    },
    rotation	=> {
        degrees	=> 360,
    },
    semicircles	=> {
        degrees	=> 180/2**31,
    },
    "V"		=> {
        volt	=> 1,
    },
    byte	=> {
        bit	=> 8,
    },
    watt	=> {
        "joule/second"	=> 1,
    },
    joule	=> {
        "newton*meter"	=> 1,
    },
    newton	=> {
        "kg*m/s/s"	=> 1,
    },
    bpm		=> {
        "beats/minute"	=> 1,
    },
    "cal"	=> {
        "joule"		=> 4.184,
    },
);

$units{$_}{$_} = 1 for keys %base_units;

sub converters {
    my ($class, $preferences) = @_;
    ref $preferences eq "HASH" ||
        croak "preferences is not a HASH reference but '$preferences'";
    my %converters;
    for my $from (keys %$preferences) {
        eval {
            $units{$from} || croak "Unknown";
            my $to = $preferences->{$from} // croak "Undefined preference";
            ref $to eq "" || croak "Preference is not a plain value but '$to'";
            $units{$to} || croak "Unknown target '$to'";
            my $converter = $units{$from}{$to} ||
               croak "Unrelated target '$to'";
            $converters{$from} = [$to, $converter];
        };
        die "Unit $from: $@" if $@;
    }
    return \%converters;
}

1;
