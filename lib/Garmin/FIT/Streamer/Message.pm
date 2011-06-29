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

    my %message = (
        fields	=> \my %fields,
       );

    defined($message{name} = delete $params{name}) ||
        croak "Missing parameter 'name'";
    croak "Name '$message{name}' looks like a natural" if
        $message{name} =~ /^\s*[0-9]+\s*\z/;

    defined(my $number = delete $params{number}) ||
        croak "Missing parameter 'number'";
    $number =~ /^\s*([0-9]+)\s*\z/ ||
        croak "Parameter 'number' is not a natural number but '$number'";
    $message{number} = int($1);

    my $comment = delete $params{comment};
    $message{comment} = $comment if defined $comment;
    my $context = delete $params{context};
    $message{context} = $context if defined $context;

    if (exists $params{fields}) {
        defined(my $fields = delete $params{fields}) ||
            croak "Parameter 'fields' is undefined";
        ref $fields eq "ARRAY" ||
            croak "Parameter 'fields' is not an ARRAY reference but '$fields'";
        for my $field (@$fields) {
            defined $field ||
                croak "Parameter 'fields' element is undefined";
            eval { $field->isa("Garmin::FIT::Streamer::Field") } ||
                croak "Parameter 'fields' element is not a Garmin::FIT::Streamer::Field object but '$field'";
            my $field_name   = lc $field->name;
            croak "Already have a field named '$field_name'" if
                $fields{$field_name};
            my $field_number = lc $field->number;
            croak "Already have a field numbered '$number'" if
                $fields{$field_number};
            $fields{$field_name} = $fields{$field_number} = $field;
        }
    }

    croak "Unknown parameter ", join(", ", keys %params) if %params;

    die "Multiple named profiles"    if $profile->{lc $message{name}};
    die "Multiple numbered profiles" if $profile->{$message{number}};
    return
        $profile->{lc $message{name}} =
        $profile->{$message{number}} =
        bless \%message, $class;
}

sub name {
    return shift->{name};
}

sub number {
    return shift->{number};
}

sub fields {
    return shift->{fields};
}

sub field_from_id {
    defined $_[1] || croak "No field_id argument";
    return $_[0]->{fields}{lc $_[1]} ||  croak "Unknown field_id '$_[1]'";
}

sub try_field_from_id {
    defined $_[1] || croak "No field_id argument";
    return $_[0]->{fields}{lc $_[1]};
}

sub from_id {
    defined $_[1] || croak "No message_id argument";
    return $profile->{lc $_[1]} || croak "Unknown message_id '$_[1]'";
}

sub try_from_id {
    defined $_[1] || croak "No message_id argument";
    return $profile->{lc $_[1]};
}
