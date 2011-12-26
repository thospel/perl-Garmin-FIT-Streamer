#!/usr/bin/perl -w
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 02_read.t'
#########################
# $Id: 02_read.t 4213 2010-09-27 00:52:37Z hospelt $
## no critic (UselessNoCritic MagicNumbers)
use strict;
use warnings;

our $VERSION = "1.000";

use File::Temp qw(tempdir);

use Test::More "no_plan";

use Garmin::FIT::Streamer;

my $fit = Garmin::FIT::Streamer->new;
isa_ok($fit, "Garmin::FIT::Streamer", "Expected type");
