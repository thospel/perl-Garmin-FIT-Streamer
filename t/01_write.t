#!/usr/bin/perl -w
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 01_write.t'
#########################
# $Id: 01_write.t 4213 2010-09-27 00:52:37Z hospelt $
## no critic (ProhibitUselessNoCritic ProhibitMagicNumbers)
use strict;
use warnings;

our $VERSION = "1.000";

BEGIN {
    use FindBin;
    use lib $FindBin::Bin;
}

use File::Temp qw(tempdir);
use TestDrive qw(slurp);
use Test::More "no_plan";

use Garmin::FIT::Streamer;

my $dir = tempdir(CLEANUP => 1);

my $fit = Garmin::FIT::Streamer->new;
isa_ok($fit, "Garmin::FIT::Streamer", "Expected type");

my $out = $fit->out;
is(unpack("H*", $out),
   "0c107800000000002e4649541983",
   "Expected byte sequence");

my $file = "$dir/out";
$fit->to_file($file);
my $content = slurp($file);
is(unpack("H*", $content),
   unpack("H*", $out),
   "Expected byte sequence");

$fit = Garmin::FIT::Streamer->new;
my %definition;
$definition{file_id} = $fit->define(
    0,	# file_id
    {
        number		=> 0,	# type
        base_type	=> "enum",
    }, {
        number		=> 1,	# manufacturer
        base_type	=> "uint16",
    }, {
        number		=> 2,	# product
        base_type	=> "uint16",
    }, {
        number		=> 3,	# serial_number
        base_type	=> "uint32z",
    }, {
        number		=> 4,	# time_created
        base_type	=> "uint32",
    },
);
$definition{record} = $fit->define(
    20,			# record
    {
        number		=> 3,	# heart_rate
        base_type	=> "uint8",
    }, {
        number		=> 4,	# cadence
        base_type	=> "uint8",
    }, {
        number		=> 5,	# distance
        base_type	=> "uint32",
    }, {
        number		=> 6,	# speed
        base_type	=> "uint16",
    },
);
$fit->put($definition{file_id}, 4, 15, 22, 1234, 621463080);
$fit->put($definition{record}, 140, 88,  510, 2800);
$fit->put($definition{record}, 143, 90, 2080, 2920);
$fit->put($definition{record}, 144, 92, 3710, 3050);
$out = $fit->out;
is(unpack("H*", $out),
   "0c107800500000002e46495440000000000500010001028402028403048c04048600040f001600d204000028c60a25410000140004030102040102050486060284018c58fe010000f00a018f5a20080000680b01905c7e0e0000ea0bec90",
   "Expected byte sequence");
# $fit->add_bytes($out);
