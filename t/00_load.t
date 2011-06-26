#!/usr/bin/perl -w
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 00_load.t'
#########################
# $Id: 00_load.t 4213 2010-09-27 00:52:37Z hospelt $
## no critic (ProhibitUselessNoCritic ProhibitMagicNumbers)
use strict;
use warnings;

our $VERSION = "1.000";

use Test::More tests => 11;

for my $module
    qw(
       Garmin::FIT::Streamer::Package
       Garmin::FIT::Streamer::BaseType
       Garmin::FIT::Streamer::Type
       Garmin::FIT::Streamer::Definition
       Garmin::FIT::Streamer::Profile
       Garmin::FIT::Streamer
) {
        use_ok($module) || BAIL_OUT("Cannot even use $module");
}
like(Garmin::FIT::Streamer::Package->release_time,
     qr{^[0-9]+\z}, "release_time is a number");
is(Garmin::FIT::Streamer::Package::released("Garmin::FIT::Streamer", "1.000"),
   "1.000", "Module released");
eval { Garmin::FIT::Streamer::Package::released("Mumble", "1.000") };
like($@, qr{^Could not find a history for package 'Mumble' at },
     "Expected module not found");
eval { Garmin::FIT::Streamer::Package::released("Garmin::FIT::Streamer", "9999") };
like($@,
     qr{^No known version '9999' of package 'Garmin::FIT::Streamer' at },
     "Expected version not found");
eval { Garmin::FIT::Streamer::Package::released("OogieBoogie", "1.000") };
like($@,
     qr{^Could not find a history for package 'OogieBoogie' at },
     "No history for unknown modules");
