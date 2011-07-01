#!/usr/bin/perl -w
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 00_syntax.t'
#########################
# $Id: 00_syntax.t 4213 2010-09-27 00:52:37Z hospelt $

## no critic (ProhibitUselessNoCritic ProhibitMagicNumbers)
use strict;
use warnings;
BEGIN { $^W = 1 };

use Test::More tests => 3;
use FindBin qw($Bin);

my $t_dir;
BEGIN {
    require lib;
    $t_dir = $FindBin::Bin;
    "lib"->import($t_dir);
}

use Errno qw(ENOENT ESTALE);
use File::Temp qw(tempdir);

my $tmpdir = tempdir(CLEANUP => 1);

# Import a complete file and return the contents as a single string
sub slurp {
    my $file = shift;
    die "Filename is undefined" if !defined $file;
    die "Filename '$file' contains \\x00" if $file =~ s/\x00/\\x00/g;
    open(my $fh, "<", $file) || die "Could not open '$file': $!";
    my $rc = read($fh, my $slurp, -s $fh);
    die "File '$file' is still growing" if $rc &&= read($fh, my $more, 1);
    die "Error reading from '$file': $!" if !defined $rc;
    close($fh) || die "Error while closing '$file': $!";
    return $slurp;
}

sub check {
    local *OLDERR;
    open(OLDERR, ">&", "STDERR") || die "Can't dup STDERR: $!";
    open(STDERR, ">", "$tmpdir/stderr") || die "Can't open $tmpdir/stderr: $!";
    my $rc = system($^X, "-c", @_);
    open(STDERR, ">&", "OLDERR")        || die "Can't dup OLDERR: $!";
    my $errors = slurp("$tmpdir/stderr");
    $errors =~ s/.* syntax OK\n//;
    if ($errors ne "") {
        diag($errors);
        return 1;
    }
    return $rc;
}

$Bin =~ s!/t/?\z!/bin! || die "No /t at end of $Bin";
for my $program (qw(fit_dump fit_from_tcx tcx_from_fit)) {
    ok(!check("-I", "$Bin/blib/lib", "-I", "$Bin/blib/arch", "$Bin/$program"),
       "Can compile $program");
}
