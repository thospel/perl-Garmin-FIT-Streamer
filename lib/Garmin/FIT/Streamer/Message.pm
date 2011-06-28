package Garmin::FIT::Streamer::Message;
use strict;
use warnings;

our $VERSION = '1.000';

use Carp;

our $profile;
require Garmin::FIT::Streamer::Field;

our @CARP_NOT = qw(Garmin::FIT::Streamer::Field);

sub profile {
    return $profile;
}

sub new {
    my ($class, %params) = @_;

    my %message;
    return bless \%message, $class;
}

sub from_id {
    defined $_[1] || croak "No message_id argument";
    return $profile->{lc $_[1]} || croak "Unknown message_id '$_[1]'";
}

sub try_from_id {
    defined $_[1] || croak "No message_id argument";
    return $profile->{lc $_[1]};
}
