package TestDrive;
# $Id: TestDrive.pm 4556 2011-05-03 14:41:42Z hospelt $
## no critic (UselessNoCritic MagicNumbers)
use strict;
use warnings;

our $VERSION = "1.000";

use Carp;
use Errno qw(ENOENT ESTALE);

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(slurp);

# Import a complete file and return the contents as a single string
sub slurp {
    my $file = shift;
    my ($maybe_gone, $binmode);
    if (@_) {
        if (@_ == 1) {
            $maybe_gone = shift;
        } else {
            my %params = @_;
            $maybe_gone = delete $params{maybe_gone};
            $binmode	= delete $params{binmode};
            croak "Unknown parameter ", join(", ", map "'$_'", keys %params) if
                %params;
        }
    }
    croak "Filename is undefined" if !defined $file;
    croak "Filename '$file' contains \\x00" if $file =~ s/\x00/\\x00/g;
    open(my $fh, "<", $file) or
        $maybe_gone && ($! == ENOENT || $! == ESTALE) ?
	return undef : croak "Could not open '$file': $!";
    binmode($fh) if $binmode;
    my $rc = read($fh, my $slurp, -s $fh);
    croak "File '$file' is still growing" if $rc &&= read($fh, my $more, 1);
    croak "Error reading from '$file': $!" if !defined $rc;
    close($fh) || croak "Error while closing '$file': $!";
    return $slurp;
}

1;
