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

use constant {
    # Some message number not in the global profile
    UNKNOWN	=> 1000,
};

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
my %message;
# unnamed entries
$message{file_id} = $fit->define(
    0,	# file_id
    {
        number		=> 0,	# type
        type	=> "enum",
    }, {
        number		=> 1,	# manufacturer
        type	=> "uint16",
    }, {
        number		=> 2,	# product
        type	=> "uint16",
    }, {
        number		=> 3,	# serial_number
        type	=> "uint32z",
    }, {
        number		=> 4,	# time_created
        type	=> "uint32",
    },
);
# Named and numbered entries
$message{record} = $fit->define(
    "record",
    "heart_rate",
    4,		# cadence
    {
        number		=> 5,	# distance
        type	=> "uint32",
    }, "speed",
);
$message{unknown_id} = $fit->define(
    UNKNOWN,	# Some id not in the profile
    {
        number		=> 0,
        type		=> "enum",
    }, {
        number		=> 255,
        type		=> "uint16",
    },
);
$fit->put($message{file_id}, 4, 15, 22, 1234, 621463080);
$fit->put($message{record}, 140, 88,  510, 2800);
$fit->put($message{record}, 143, 90, 2080, 2920);
$fit->put($message{record}, 144, 92, 3710, 3050);
$fit->put($message{unknown_id}, 124, 68);
$fit->put($message{unknown_id}, undef, undef);
$out = $fit->out;
is(unpack("H*", $out),
   "0c107800640000002e46495440000000000500010001028402028403048c04048600040f001600d204000028c60a25410000140004030102040102050486060284018c58fe010000f00a018f5a20080000680b01905c7e0e0000ea0b420000e80302000100ff0284027c440002ffffff7b36",
   "Expected byte sequence");
# $fit->add_bytes($out);

# All kinds of error
$fit = Garmin::FIT::Streamer->new;

eval {
    $fit->define();
};
like($@, qr{^\QNo message parameter at }, "Expected error message");

eval {
    $fit->define(undef);
};
like($@, qr{^\QNo message parameter at }, "Expected error message");

eval {
    $fit->define("Waf", {
        number		=> 0,
        type		=> "uint16",
    });
};
like($@, qr{^\QInvalid message parameter 'Waf' at }, "Expected error message");

eval {
    $fit->define(20);
};
like($@, qr{^\QNo fields being defined at }, "Expected error message");

eval {
    $fit->define(0, ({
        number		=> 0,
        type		=> "enum",
    }) x 256);
};
like($@, qr{^\QToo many fields (at most 255) at }, "Expected error message");

eval {
    $fit->define(0, ({
        number		=> 0,
        type		=> "enum",
    }) x 255);
};
like($@,
     qr{^\QField '0': Multiple uses of field number 0 at },
     "Expected error message");

eval {
    $fit->define(200, {
        number		=> 0,
    });
};
like($@,
     qr{^\QField '0': No field type at },
     "Expected error message");

eval {
    $fit->define(0, {
        number		=> 0,
        type		=> "uint16",
    });
};
like($@,
     qr{^\QField '0': Inconsistent base_type. Field uses 'uint16' but profile expects 'enum' at },
     "Expected error message");

eval {
    $fit->define(0, {
        number		=> 0,
        type		=> "enum",
        size		=> 2,
    });
};
like($@,
     qr{^\QField '0': Inconsistent field size '2' for base type 'enum' (size 1) at },
     "Expected error message");

eval {
    $fit->define(UNKNOWN, {
        number		=> 0,
        type		=> "string",
        size		=> 0,
    });
};
like($@,
     qr{^\QField '0': Field size may not be '0' at },
     "Expected error message");

eval {
    $fit->define(UNKNOWN, {
        number		=> 0,
        type		=> "string",
        size		=> "big",
    });
};
like($@,
     qr{^\QField '0': Field size may not be 'big' at },
     "Expected error message");

eval {
    $fit->define(UNKNOWN, {
        number		=> 0,
        type		=> "string",
    });
};
like($@,
     qr{^\QField '0': Base type 'string' without field size at },
     "Expected error message");

eval {
    $fit->define(0, undef);
};
like($@,
     qr{^\QUndefined field at },
     "Expected error message");

eval {
    $fit->define(UNKNOWN, "waf");
};
like($@,
     qr{^\QField 'waf': Unknown because message '1000' is not in the global profile at },
     "Expected error message");

eval {
    $fit->define(0, "waf");
};
like($@,
     qr{^\QField 'waf': Unknown because message '0' has no such field in the global profile at },
     "Expected error message");

eval {
    $fit->define(0, {
        number	=> 256,
    });
};
like($@,
     qr{^\QField '256': Field number '256' is too high (at most 255) at },
     "Expected error message");
