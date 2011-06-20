use 5.008001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile
    (NAME		=> 'Garmin::FIT::Streamer',
     VERSION_FROM	=> 'lib/Garmin/FIT/Streamer/Package.pm',
     PREREQ_PM		=> {
         # Only for the tests
	 "Test::More"			=> "0.01",
     },
     ABSTRACT_FROM	=> 'lib/Garmin/FIT/Streamer.pm',
     AUTHOR		=> 'Ton Hospel <Ton Hospel <Garmin-FIT-Streamer@ton.iguana.be>',
     PL_FILES		=> {},
     $^O eq "MSWin32" ? (
         PM_FILTER	=> '$(PERL) -p -e1',
     ) : (),
     clean		=> {
         FILES => '$(DISTNAME).ppd ppm cover_db',
     },
);
