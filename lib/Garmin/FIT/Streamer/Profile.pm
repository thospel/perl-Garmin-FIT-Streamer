package Garmin::FIT::Streamer::Profile;

use strict;
use warnings;

our $VERSION = "1.000";

package Garmin::FIT::Streamer::BaseType;
our $base_types;

package Garmin::FIT::Streamer::Type;
our $types;

package Garmin::FIT::Streamer::Message;
our $profile;

package Garmin::FIT::Streamer;
our ($crc16_low, $crc16_high, $crc16_modulo);

package Garmin::FIT::Streamer::Profile;

# BEGIN GENERATED
# Generated from file 'Profile.html' by program 'profile_from_html'

sub PROFILE_MAJOR() {   1 }
sub PROFILE_MINOR() {  20 }
sub PROFILE_SCALE() { 100 }

sub PROTOCOL_MAJOR() {  1 }
sub PROTOCOL_MINOR() {  0 }
sub PROTOCOL_SCALE() { 16 }

sub PROFILE_VERSION() {
    return PROFILE_MAJOR() * PROFILE_SCALE() + PROFILE_MINOR();
}

sub PROTOCOL_VERSION() {
    return PROTOCOL_MAJOR() * PROTOCOL_SCALE() + PROTOCOL_MINOR();
}

my $all_units;

$base_types = {
  '0' => bless( {
    'decoder' => [
      'C',
      'C'
    ],
    'invalid' => 255,
    'max' => 254,
    'min' => 0,
    'name' => 'enum',
    'number' => 0,
    'size' => 1
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '1' => bless( {
    'decoder' => [
      'c',
      'c'
    ],
    'invalid' => 127,
    'max' => 126,
    'min' => -128,
    'name' => 'sint8',
    'number' => 1,
    'size' => 1
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '10' => bless( {
    'decoder' => [
      'C',
      'C'
    ],
    'invalid' => 0,
    'max' => 255,
    'min' => 1,
    'name' => 'uint8z',
    'notice' => 1,
    'number' => 10,
    'size' => 1
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '13' => bless( {
    'decoder' => [
      'a',
      'a'
    ],
    'invalid' => 255,
    'name' => 'byte',
    'notice' => 1,
    'number' => 13,
    'size' => 0
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '131' => bless( {
    'decoder' => [
      'v!',
      'n!'
    ],
    'invalid' => 32767,
    'max' => 32766,
    'min' => -32768,
    'name' => 'sint16',
    'notice' => 1,
    'number' => 131,
    'size' => 2
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '132' => bless( {
    'decoder' => [
      'v',
      'n'
    ],
    'invalid' => 65535,
    'max' => 65534,
    'min' => 0,
    'name' => 'uint16',
    'number' => 132,
    'size' => 2
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '133' => bless( {
    'decoder' => [
      'V!',
      'N!'
    ],
    'invalid' => 2147483647,
    'max' => 2147483646,
    'min' => '-2147483648',
    'name' => 'sint32',
    'number' => 133,
    'size' => 4
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '134' => bless( {
    'decoder' => [
      'V',
      'N'
    ],
    'invalid' => 4294967295,
    'max' => 4294967294,
    'min' => 0,
    'name' => 'uint32',
    'number' => 134,
    'size' => 4
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '136' => bless( {
    'decoder' => [
      'f<',
      'f>'
    ],
    'invalid' => 4294967295,
    'name' => 'float32',
    'notice' => 1,
    'number' => 136,
    'regex' => qr{^[+-]?[0-9]+(?:\.[0-9]*)?(?:[eE][+-]?[0-9]+)?\z},
    'size' => 4
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '137' => bless( {
    'decoder' => [
      'd<',
      'd>'
    ],
    'invalid' => '18446744073709551615',
    'name' => 'float64',
    'notice' => 1,
    'number' => 137,
    'regex' => qr{^[+-]?[0-9]+(?:\.[0-9]*)?(?:[eE][+-]?[0-9]+)?\z},
    'size' => 4
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '139' => bless( {
    'decoder' => [
      'v',
      'n'
    ],
    'invalid' => 0,
    'max' => 65535,
    'min' => 1,
    'name' => 'uint16z',
    'notice' => 1,
    'number' => 139,
    'size' => 2
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '140' => bless( {
    'decoder' => [
      'V',
      'N'
    ],
    'invalid' => 0,
    'max' => 4294967295,
    'min' => 1,
    'name' => 'uint32z',
    'number' => 140,
    'size' => 4
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '2' => bless( {
    'decoder' => [
      'C',
      'C'
    ],
    'invalid' => 255,
    'max' => 254,
    'min' => 0,
    'name' => 'uint8',
    'number' => 2,
    'size' => 1
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '7' => bless( {
    'decoder' => [
      'Z',
      'Z'
    ],
    'invalid' => 0,
    'name' => 'string',
    'number' => 7,
    'size' => 0
  }, 'Garmin::FIT::Streamer::BaseType' ),
  'byte' => {},
  'enum' => {},
  'float32' => {},
  'float64' => {},
  'sint16' => {},
  'sint32' => {},
  'sint8' => {},
  'string' => {},
  'uint16' => {},
  'uint16z' => {},
  'uint32' => {},
  'uint32z' => {},
  'uint8' => {},
  'uint8z' => {}
};
$base_types->{'byte'} = $base_types->{'13'};
$base_types->{'enum'} = $base_types->{'0'};
$base_types->{'float32'} = $base_types->{'136'};
$base_types->{'float64'} = $base_types->{'137'};
$base_types->{'sint16'} = $base_types->{'131'};
$base_types->{'sint32'} = $base_types->{'133'};
$base_types->{'sint8'} = $base_types->{'1'};
$base_types->{'string'} = $base_types->{'7'};
$base_types->{'uint16'} = $base_types->{'132'};
$base_types->{'uint16z'} = $base_types->{'139'};
$base_types->{'uint32'} = $base_types->{'134'};
$base_types->{'uint32z'} = $base_types->{'140'};
$base_types->{'uint8'} = $base_types->{'2'};
$base_types->{'uint8z'} = $base_types->{'10'};
$types = {
  'activity' => bless( {
    'base_type' => {},
    'name' => 'activity',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'manual',
        'value' => 0
      },
      '1' => {
        'name' => 'auto_multi_sport',
        'value' => 1
      },
      'auto_multi_sport' => {},
      'manual' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'activity_class' => bless( {
    'base_type' => {},
    'name' => 'activity_class',
    'size' => 1,
    'values' => {
      '100' => {
        'name' => 'level_max',
        'value' => 100
      },
      '127' => {
        'comment' => '0 to 100',
        'name' => 'level',
        'value' => 127
      },
      '128' => {
        'name' => 'athlete',
        'value' => 128
      },
      'athlete' => {},
      'level' => {},
      'level_max' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'autolap_trigger' => bless( {
    'base_type' => {},
    'name' => 'autolap_trigger',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'time',
        'value' => 0
      },
      '1' => {
        'name' => 'distance',
        'value' => 1
      },
      '2' => {
        'name' => 'position_start',
        'value' => 2
      },
      '3' => {
        'name' => 'position_lap',
        'value' => 3
      },
      '4' => {
        'name' => 'position_waypoint',
        'value' => 4
      },
      '5' => {
        'name' => 'position_marked',
        'value' => 5
      },
      '6' => {
        'name' => 'off',
        'value' => 6
      },
      'distance' => {},
      'off' => {},
      'position_lap' => {},
      'position_marked' => {},
      'position_start' => {},
      'position_waypoint' => {},
      'time' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'battery_status' => bless( {
    'base_type' => {},
    'name' => 'battery_status',
    'size' => 1,
    'values' => {
      '1' => {
        'name' => 'new',
        'value' => 1
      },
      '2' => {
        'name' => 'good',
        'value' => 2
      },
      '3' => {
        'name' => 'ok',
        'value' => 3
      },
      '4' => {
        'name' => 'low',
        'value' => 4
      },
      '5' => {
        'name' => 'critical',
        'value' => 5
      },
      'critical' => {},
      'good' => {},
      'low' => {},
      'new' => {},
      'ok' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'bool' => bless( {
    'base_type' => {},
    'name' => 'bool',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'no',
        'value' => 0
      },
      '1' => {
        'name' => 'yes',
        'value' => 1
      },
      'no' => {},
      'yes' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'bp_status' => bless( {
    'base_type' => {},
    'name' => 'bp_status',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'no_error',
        'value' => 0
      },
      '1' => {
        'name' => 'error_incomplete_data',
        'value' => 1
      },
      '2' => {
        'name' => 'error_no_measurement',
        'value' => 2
      },
      '3' => {
        'name' => 'error_data_out_of_range',
        'value' => 3
      },
      '4' => {
        'name' => 'error_irregular_heart_rate',
        'value' => 4
      },
      'error_data_out_of_range' => {},
      'error_incomplete_data' => {},
      'error_irregular_heart_rate' => {},
      'error_no_measurement' => {},
      'no_error' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'byte' => bless( {
    'base_type' => {},
    'name' => 'byte',
    'size' => 0
  }, 'Garmin::FIT::Streamer::Type' ),
  'course_capabilities' => bless( {
    'base_type' => {},
    'name' => 'course_capabilities',
    'size' => 4,
    'values' => {
      '1' => {
        'name' => 'processed',
        'value' => 1
      },
      '128' => {
        'name' => 'cadence',
        'value' => 128
      },
      '16' => {
        'name' => 'position',
        'value' => 16
      },
      '2' => {
        'name' => 'valid',
        'value' => 2
      },
      '256' => {
        'name' => 'training',
        'value' => 256
      },
      '32' => {
        'name' => 'heart_rate',
        'value' => 32
      },
      '4' => {
        'name' => 'time',
        'value' => 4
      },
      '512' => {
        'name' => 'navigation',
        'value' => 512
      },
      '64' => {
        'name' => 'power',
        'value' => 64
      },
      '8' => {
        'name' => 'distance',
        'value' => 8
      },
      'cadence' => {},
      'distance' => {},
      'heart_rate' => {},
      'navigation' => {},
      'position' => {},
      'power' => {},
      'processed' => {},
      'time' => {},
      'training' => {},
      'valid' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'course_point' => bless( {
    'base_type' => {},
    'name' => 'course_point',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'generic',
        'value' => 0
      },
      '1' => {
        'name' => 'summit',
        'value' => 1
      },
      '10' => {
        'name' => 'fourth_category',
        'value' => 10
      },
      '11' => {
        'name' => 'third_category',
        'value' => 11
      },
      '12' => {
        'name' => 'second_category',
        'value' => 12
      },
      '13' => {
        'name' => 'first_category',
        'value' => 13
      },
      '14' => {
        'name' => 'hors_category',
        'value' => 14
      },
      '15' => {
        'name' => 'sprint',
        'value' => 15
      },
      '16' => {
        'name' => 'left_fork',
        'value' => 16
      },
      '17' => {
        'name' => 'right_fork',
        'value' => 17
      },
      '18' => {
        'name' => 'middle_fork',
        'value' => 18
      },
      '2' => {
        'name' => 'valley',
        'value' => 2
      },
      '3' => {
        'name' => 'water',
        'value' => 3
      },
      '4' => {
        'name' => 'food',
        'value' => 4
      },
      '5' => {
        'name' => 'danger',
        'value' => 5
      },
      '6' => {
        'name' => 'left',
        'value' => 6
      },
      '7' => {
        'name' => 'right',
        'value' => 7
      },
      '8' => {
        'name' => 'straight',
        'value' => 8
      },
      '9' => {
        'name' => 'first_aid',
        'value' => 9
      },
      'danger' => {},
      'first_aid' => {},
      'first_category' => {},
      'food' => {},
      'fourth_category' => {},
      'generic' => {},
      'hors_category' => {},
      'left' => {},
      'left_fork' => {},
      'middle_fork' => {},
      'right' => {},
      'right_fork' => {},
      'second_category' => {},
      'sprint' => {},
      'straight' => {},
      'summit' => {},
      'third_category' => {},
      'valley' => {},
      'water' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'date_time' => bless( {
    'base_type' => {},
    'comment' => 'seconds since UTC 00:00 Dec 31 1989',
    'name' => 'date_time',
    'size' => 4,
    'values' => {
      '268435456' => {
        'comment' => 'if date_time is < 0x10000000 then it is system time (seconds from device power on)',
        'name' => 'min',
        'value' => 268435456
      },
      'min' => {}
    }
  }, 'Garmin::FIT::Streamer::Type::DateTime' ),
  'device_index' => bless( {
    'base_type' => {},
    'name' => 'device_index',
    'size' => 1,
    'values' => {
      '0' => {
        'comment' => 'Creator of the file is always device index 0.',
        'name' => 'creator',
        'value' => 0
      },
      'creator' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'device_type' => bless( {
    'base_type' => {},
    'name' => 'device_type',
    'size' => 1,
    'values' => {
      '1' => {
        'name' => 'antfs',
        'value' => 1
      },
      '11' => {
        'name' => 'bike_power',
        'value' => 11
      },
      '119' => {
        'name' => 'weight_scale',
        'value' => 119
      },
      '12' => {
        'name' => 'environment_sensor',
        'value' => 12
      },
      '120' => {
        'name' => 'heart_rate',
        'value' => 120
      },
      '121' => {
        'name' => 'bike_speed_cadence',
        'value' => 121
      },
      '122' => {
        'name' => 'bike_cadence',
        'value' => 122
      },
      '123' => {
        'name' => 'bike_speed',
        'value' => 123
      },
      '124' => {
        'name' => 'stride_speed_distance',
        'value' => 124
      },
      '15' => {
        'name' => 'multi_sport_speed_distance',
        'value' => 15
      },
      '17' => {
        'name' => 'fitness_equipment',
        'value' => 17
      },
      '18' => {
        'name' => 'blood_pressure',
        'value' => 18
      },
      'antfs' => {},
      'bike_cadence' => {},
      'bike_power' => {},
      'bike_speed' => {},
      'bike_speed_cadence' => {},
      'blood_pressure' => {},
      'environment_sensor' => {},
      'fitness_equipment' => {},
      'heart_rate' => {},
      'multi_sport_speed_distance' => {},
      'stride_speed_distance' => {},
      'weight_scale' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'display_heart' => bless( {
    'base_type' => {},
    'name' => 'display_heart',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'bpm',
        'value' => 0
      },
      '1' => {
        'name' => 'max',
        'value' => 1
      },
      '2' => {
        'name' => 'reserve',
        'value' => 2
      },
      'bpm' => {},
      'max' => {},
      'reserve' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'display_measure' => bless( {
    'base_type' => {},
    'name' => 'display_measure',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'metric',
        'value' => 0
      },
      '1' => {
        'name' => 'statute',
        'value' => 1
      },
      'metric' => {},
      'statute' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'display_position' => bless( {
    'base_type' => {},
    'name' => 'display_position',
    'size' => 1,
    'values' => {
      '0' => {
        'comment' => 'dd.dddddd',
        'name' => 'degree',
        'value' => 0
      },
      '1' => {
        'comment' => 'dddmm.mmm',
        'name' => 'degree_minute',
        'value' => 1
      },
      '10' => {
        'comment' => 'Indonesian Equatorial LCO',
        'name' => 'indonesian_equatorial',
        'value' => 10
      },
      '11' => {
        'comment' => 'Indonesian Irian LCO',
        'name' => 'indonesian_irian',
        'value' => 11
      },
      '12' => {
        'comment' => 'Indonesian Southern LCO',
        'name' => 'indonesian_southern',
        'value' => 12
      },
      '13' => {
        'comment' => 'India zone 0',
        'name' => 'india_zone_0',
        'value' => 13
      },
      '14' => {
        'comment' => 'India zone IA',
        'name' => 'india_zone_IA',
        'value' => 14
      },
      '15' => {
        'comment' => 'India zone IB',
        'name' => 'india_zone_IB',
        'value' => 15
      },
      '16' => {
        'comment' => 'India zone IIA',
        'name' => 'india_zone_IIA',
        'value' => 16
      },
      '17' => {
        'comment' => 'India zone IIB',
        'name' => 'india_zone_IIB',
        'value' => 17
      },
      '18' => {
        'comment' => 'India zone IIIA',
        'name' => 'india_zone_IIIA',
        'value' => 18
      },
      '19' => {
        'comment' => 'India zone IIIB',
        'name' => 'india_zone_IIIB',
        'value' => 19
      },
      '2' => {
        'comment' => 'dddmmss',
        'name' => 'degree_minute_second',
        'value' => 2
      },
      '20' => {
        'comment' => 'India zone IVA',
        'name' => 'india_zone_IVA',
        'value' => 20
      },
      '21' => {
        'comment' => 'India zone IVB',
        'name' => 'india_zone_IVB',
        'value' => 21
      },
      '22' => {
        'comment' => 'Irish Transverse Mercator',
        'name' => 'irish_transverse',
        'value' => 22
      },
      '23' => {
        'comment' => 'Irish Grid',
        'name' => 'irish_grid',
        'value' => 23
      },
      '24' => {
        'comment' => 'Loran TD',
        'name' => 'loran',
        'value' => 24
      },
      '25' => {
        'comment' => 'Maidenhead grid system',
        'name' => 'maidenhead_grid',
        'value' => 25
      },
      '26' => {
        'comment' => 'MGRS grid system',
        'name' => 'mgrs_grid',
        'value' => 26
      },
      '27' => {
        'comment' => 'New Zealand grid system',
        'name' => 'new_zealand_grid',
        'value' => 27
      },
      '28' => {
        'comment' => 'New Zealand Transverse Mercator',
        'name' => 'new_zealand_transverse',
        'value' => 28
      },
      '29' => {
        'comment' => 'Qatar National Grid',
        'name' => 'qatar_grid',
        'value' => 29
      },
      '3' => {
        'comment' => 'Austrian Grid (BMN)',
        'name' => 'austrian_grid',
        'value' => 3
      },
      '30' => {
        'comment' => 'Modified RT-90 (Sweden)',
        'name' => 'modified_swedish_grid',
        'value' => 30
      },
      '31' => {
        'comment' => 'RT-90 (Sweden)',
        'name' => 'swedish_grid',
        'value' => 31
      },
      '32' => {
        'comment' => 'South African Grid',
        'name' => 'south_african_grid',
        'value' => 32
      },
      '33' => {
        'comment' => 'Swiss CH-1903 grid',
        'name' => 'swiss_grid',
        'value' => 33
      },
      '34' => {
        'comment' => 'Taiwan Grid',
        'name' => 'taiwan_grid',
        'value' => 34
      },
      '35' => {
        'comment' => 'United States National Grid',
        'name' => 'united_states_grid',
        'value' => 35
      },
      '36' => {
        'comment' => 'UTM/UPS grid system',
        'name' => 'utm_ups_grid',
        'value' => 36
      },
      '37' => {
        'comment' => 'West Malayan RSO',
        'name' => 'west_malayan',
        'value' => 37
      },
      '38' => {
        'comment' => 'Borneo RSO',
        'name' => 'borneo_rso',
        'value' => 38
      },
      '39' => {
        'comment' => 'Estonian grid system',
        'name' => 'estonian_grid',
        'value' => 39
      },
      '4' => {
        'comment' => 'British National Grid',
        'name' => 'british_grid',
        'value' => 4
      },
      '40' => {
        'comment' => 'Latvian Transverse Mercator',
        'name' => 'latvian_grid',
        'value' => 40
      },
      '41' => {
        'comment' => 'Reference Grid 99 TM (Swedish)',
        'name' => 'swedish_ref_99_grid',
        'value' => 41
      },
      '5' => {
        'comment' => 'Dutch grid system',
        'name' => 'dutch_grid',
        'value' => 5
      },
      '6' => {
        'comment' => 'Hungarian grid system',
        'name' => 'hungarian_grid',
        'value' => 6
      },
      '7' => {
        'comment' => 'Finnish grid system Zone3 KKJ27',
        'name' => 'finnish_grid',
        'value' => 7
      },
      '8' => {
        'comment' => 'Gausss Krueger (German)',
        'name' => 'german_grid',
        'value' => 8
      },
      '9' => {
        'comment' => 'Icelandic Grid',
        'name' => 'icelandic_grid',
        'value' => 9
      },
      'austrian_grid' => {},
      'borneo_rso' => {},
      'british_grid' => {},
      'degree' => {},
      'degree_minute' => {},
      'degree_minute_second' => {},
      'dutch_grid' => {},
      'estonian_grid' => {},
      'finnish_grid' => {},
      'german_grid' => {},
      'hungarian_grid' => {},
      'icelandic_grid' => {},
      'india_zone_0' => {},
      'india_zone_ia' => {},
      'india_zone_ib' => {},
      'india_zone_iia' => {},
      'india_zone_iib' => {},
      'india_zone_iiia' => {},
      'india_zone_iiib' => {},
      'india_zone_iva' => {},
      'india_zone_ivb' => {},
      'indonesian_equatorial' => {},
      'indonesian_irian' => {},
      'indonesian_southern' => {},
      'irish_grid' => {},
      'irish_transverse' => {},
      'latvian_grid' => {},
      'loran' => {},
      'maidenhead_grid' => {},
      'mgrs_grid' => {},
      'modified_swedish_grid' => {},
      'new_zealand_grid' => {},
      'new_zealand_transverse' => {},
      'qatar_grid' => {},
      'south_african_grid' => {},
      'swedish_grid' => {},
      'swedish_ref_99_grid' => {},
      'swiss_grid' => {},
      'taiwan_grid' => {},
      'united_states_grid' => {},
      'utm_ups_grid' => {},
      'west_malayan' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'display_power' => bless( {
    'base_type' => {},
    'name' => 'display_power',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'watts',
        'value' => 0
      },
      '1' => {
        'name' => 'percent_ftp',
        'value' => 1
      },
      'percent_ftp' => {},
      'watts' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'enum' => bless( {
    'base_type' => {},
    'name' => 'enum',
    'size' => 1
  }, 'Garmin::FIT::Streamer::Type' ),
  'event' => bless( {
    'base_type' => {},
    'name' => 'event',
    'size' => 1,
    'values' => {
      '0' => {
        'comment' => 'Group 0.  Start / stop_all',
        'name' => 'timer',
        'value' => 0
      },
      '10' => {
        'comment' => 'marker',
        'name' => 'course_point',
        'value' => 10
      },
      '11' => {
        'comment' => 'marker',
        'name' => 'battery',
        'value' => 11
      },
      '12' => {
        'comment' => 'Group 1. Start at beginning of activity if VP enabled, when VP pace is changed during activity or VP enabled mid activity.  stop_disable when VP disabled.',
        'name' => 'virtual_partner_pace',
        'value' => 12
      },
      '13' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'hr_high_alert',
        'value' => 13
      },
      '14' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'hr_low_alert',
        'value' => 14
      },
      '15' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'speed_high_alert',
        'value' => 15
      },
      '16' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'speed_low_alert',
        'value' => 16
      },
      '17' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'cad_high_alert',
        'value' => 17
      },
      '18' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'cad_low_alert',
        'value' => 18
      },
      '19' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'power_high_alert',
        'value' => 19
      },
      '20' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'power_low_alert',
        'value' => 20
      },
      '21' => {
        'comment' => 'marker',
        'name' => 'recovery_hr',
        'value' => 21
      },
      '22' => {
        'comment' => 'marker',
        'name' => 'battery_low',
        'value' => 22
      },
      '23' => {
        'comment' => 'Group 1.  Start if enabled mid activity (not required at start of activity). Stop when duration is reached.  stop_disable if disabled.',
        'name' => 'time_duration_alert',
        'value' => 23
      },
      '24' => {
        'comment' => 'Group 1.  Start if enabled mid activity (not required at start of activity). Stop when duration is reached.  stop_disable if disabled.',
        'name' => 'distance_duration_alert',
        'value' => 24
      },
      '25' => {
        'comment' => 'Group 1.  Start if enabled mid activity (not required at start of activity). Stop when duration is reached.  stop_disable if disabled.',
        'name' => 'calorie_duration_alert',
        'value' => 25
      },
      '26' => {
        'comment' => 'Group 1..  Stop at end of activity.',
        'name' => 'activity',
        'value' => 26
      },
      '27' => {
        'comment' => 'marker',
        'name' => 'fitness_equipment',
        'value' => 27
      },
      '3' => {
        'comment' => 'start / stop',
        'name' => 'workout',
        'value' => 3
      },
      '4' => {
        'comment' => 'Start at beginning of workout.  Stop at end of each step.',
        'name' => 'workout_step',
        'value' => 4
      },
      '5' => {
        'comment' => 'stop_all group 0',
        'name' => 'power_down',
        'value' => 5
      },
      '6' => {
        'comment' => 'stop_all group 0',
        'name' => 'power_up',
        'value' => 6
      },
      '7' => {
        'comment' => 'start / stop group 0',
        'name' => 'off_course',
        'value' => 7
      },
      '8' => {
        'comment' => 'Stop at end of each session.',
        'name' => 'session',
        'value' => 8
      },
      '9' => {
        'comment' => 'Stop at end of each lap.',
        'name' => 'lap',
        'value' => 9
      },
      'activity' => {},
      'battery' => {},
      'battery_low' => {},
      'cad_high_alert' => {},
      'cad_low_alert' => {},
      'calorie_duration_alert' => {},
      'course_point' => {},
      'distance_duration_alert' => {},
      'fitness_equipment' => {},
      'hr_high_alert' => {},
      'hr_low_alert' => {},
      'lap' => {},
      'off_course' => {},
      'power_down' => {},
      'power_high_alert' => {},
      'power_low_alert' => {},
      'power_up' => {},
      'recovery_hr' => {},
      'session' => {},
      'speed_high_alert' => {},
      'speed_low_alert' => {},
      'time_duration_alert' => {},
      'timer' => {},
      'virtual_partner_pace' => {},
      'workout' => {},
      'workout_step' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'event_type' => bless( {
    'base_type' => {},
    'name' => 'event_type',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'start',
        'value' => 0
      },
      '1' => {
        'name' => 'stop',
        'value' => 1
      },
      '2' => {
        'name' => 'consecutive_depreciated',
        'value' => 2
      },
      '3' => {
        'name' => 'marker',
        'value' => 3
      },
      '4' => {
        'name' => 'stop_all',
        'value' => 4
      },
      '5' => {
        'name' => 'begin_depreciated',
        'value' => 5
      },
      '6' => {
        'name' => 'end_depreciated',
        'value' => 6
      },
      '7' => {
        'name' => 'end_all_depreciated',
        'value' => 7
      },
      '8' => {
        'name' => 'stop_disable',
        'value' => 8
      },
      '9' => {
        'name' => 'stop_disable_all',
        'value' => 9
      },
      'begin_depreciated' => {},
      'consecutive_depreciated' => {},
      'end_all_depreciated' => {},
      'end_depreciated' => {},
      'marker' => {},
      'start' => {},
      'stop' => {},
      'stop_all' => {},
      'stop_disable' => {},
      'stop_disable_all' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'file' => bless( {
    'base_type' => {},
    'name' => 'file',
    'size' => 1,
    'values' => {
      '1' => {
        'comment' => 'Read only, single file. Must be in root directory.',
        'name' => 'device',
        'value' => 1
      },
      '10' => {
        'comment' => 'Read only, single file. Directory=Totals',
        'name' => 'totals',
        'value' => 10
      },
      '11' => {
        'comment' => 'Read/write, single file. Directory=Goals',
        'name' => 'goals',
        'value' => 11
      },
      '14' => {
        'comment' => 'Read only. Directory=Blood Pressure',
        'name' => 'blood_pressure',
        'value' => 14
      },
      '2' => {
        'comment' => 'Read/write, single file. Directory=Settings',
        'name' => 'settings',
        'value' => 2
      },
      '20' => {
        'comment' => 'Read/erase, multiple files. Directory=Activities',
        'name' => 'activity_summary',
        'value' => 20
      },
      '3' => {
        'comment' => 'Read/write, multiple files, file number = sport type. Directory=Sports',
        'name' => 'sport',
        'value' => 3
      },
      '4' => {
        'comment' => 'Read/erase, multiple files. Directory=Activities',
        'name' => 'activity',
        'value' => 4
      },
      '5' => {
        'comment' => 'Read/write/erase, multiple files. Directory=Workouts',
        'name' => 'workout',
        'value' => 5
      },
      '6' => {
        'comment' => 'Read/write/erase, multiple files. Directory=Courses',
        'name' => 'course',
        'value' => 6
      },
      '9' => {
        'comment' => 'Read only, single file. Circular buffer. All message definitions at start of file. Directory=Weight',
        'name' => 'weight',
        'value' => 9
      },
      'activity' => {},
      'activity_summary' => {},
      'blood_pressure' => {},
      'course' => {},
      'device' => {},
      'goals' => {},
      'settings' => {},
      'sport' => {},
      'totals' => {},
      'weight' => {},
      'workout' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'file_flags' => bless( {
    'base_type' => {},
    'name' => 'file_flags',
    'size' => 1,
    'values' => {
      '2' => {
        'name' => 'read',
        'value' => 2
      },
      '4' => {
        'name' => 'write',
        'value' => 4
      },
      '8' => {
        'name' => 'erase',
        'value' => 8
      },
      'erase' => {},
      'read' => {},
      'write' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'fitness_equipment_state' => bless( {
    'base_type' => {},
    'comment' => 'fitness equipment event data',
    'name' => 'fitness_equipment_state',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'ready',
        'value' => 0
      },
      '1' => {
        'name' => 'in_use',
        'value' => 1
      },
      '2' => {
        'name' => 'paused',
        'value' => 2
      },
      '3' => {
        'comment' => 'lost connection to fitness equipment',
        'name' => 'unknown',
        'value' => 3
      },
      'in_use' => {},
      'paused' => {},
      'ready' => {},
      'unknown' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'float32' => bless( {
    'base_type' => {},
    'name' => 'float32',
    'size' => 4
  }, 'Garmin::FIT::Streamer::Type' ),
  'float64' => bless( {
    'base_type' => {},
    'name' => 'float64',
    'size' => 4
  }, 'Garmin::FIT::Streamer::Type' ),
  'garmin_product' => bless( {
    'base_type' => {},
    'name' => 'garmin_product',
    'size' => 2,
    'values' => {
      '1' => {
        'name' => 'hrm1',
        'value' => 1
      },
      '10007' => {
        'comment' => 'SDM4 footpod',
        'name' => 'sdm4',
        'value' => 10007
      },
      '1011' => {
        'name' => 'dsi_alf01',
        'value' => 1011
      },
      '1018' => {
        'comment' => 'Forerunner 310',
        'name' => 'fr310xt',
        'value' => 1018
      },
      '1036' => {
        'name' => 'edge500',
        'value' => 1036
      },
      '1124' => {
        'comment' => 'Forerunner 110',
        'name' => 'fr110',
        'value' => 1124
      },
      '1169' => {
        'name' => 'edge800',
        'value' => 1169
      },
      '1253' => {
        'name' => 'chirp',
        'value' => 1253
      },
      '2' => {
        'comment' => 'AXH01 HRM chipset',
        'name' => 'axh01',
        'value' => 2
      },
      '20119' => {
        'name' => 'training_center',
        'value' => 20119
      },
      '3' => {
        'name' => 'axb01',
        'value' => 3
      },
      '4' => {
        'name' => 'axb02',
        'value' => 4
      },
      '5' => {
        'name' => 'hrm2ss',
        'value' => 5
      },
      '6' => {
        'name' => 'dsi_alf02',
        'value' => 6
      },
      '65534' => {
        'comment' => 'Garmin Connect website',
        'name' => 'connect',
        'value' => 65534
      },
      '717' => {
        'comment' => 'Forerunner 405',
        'name' => 'fr405',
        'value' => 717
      },
      '782' => {
        'comment' => 'Forerunner 50',
        'name' => 'fr50',
        'value' => 782
      },
      '988' => {
        'comment' => 'Forerunner 60',
        'name' => 'fr60',
        'value' => 988
      },
      'axb01' => {},
      'axb02' => {},
      'axh01' => {},
      'chirp' => {},
      'connect' => {},
      'dsi_alf01' => {},
      'dsi_alf02' => {},
      'edge500' => {},
      'edge800' => {},
      'fr110' => {},
      'fr310xt' => {},
      'fr405' => {},
      'fr50' => {},
      'fr60' => {},
      'hrm1' => {},
      'hrm2ss' => {},
      'sdm4' => {},
      'training_center' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'gender' => bless( {
    'base_type' => {},
    'name' => 'gender',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'female',
        'value' => 0
      },
      '1' => {
        'name' => 'male',
        'value' => 1
      },
      'female' => {},
      'male' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'goal' => bless( {
    'base_type' => {},
    'name' => 'goal',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'time',
        'value' => 0
      },
      '1' => {
        'name' => 'distance',
        'value' => 1
      },
      '2' => {
        'name' => 'calories',
        'value' => 2
      },
      '3' => {
        'name' => 'frequency',
        'value' => 3
      },
      '4' => {
        'name' => 'steps',
        'value' => 4
      },
      'calories' => {},
      'distance' => {},
      'frequency' => {},
      'steps' => {},
      'time' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'goal_recurrence' => bless( {
    'base_type' => {},
    'name' => 'goal_recurrence',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'off',
        'value' => 0
      },
      '1' => {
        'name' => 'daily',
        'value' => 1
      },
      '2' => {
        'name' => 'weekly',
        'value' => 2
      },
      '3' => {
        'name' => 'monthly',
        'value' => 3
      },
      '4' => {
        'name' => 'yearly',
        'value' => 4
      },
      '5' => {
        'name' => 'custom',
        'value' => 5
      },
      'custom' => {},
      'daily' => {},
      'monthly' => {},
      'off' => {},
      'weekly' => {},
      'yearly' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'hr_type' => bless( {
    'base_type' => {},
    'name' => 'hr_type',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'normal',
        'value' => 0
      },
      '1' => {
        'name' => 'irregular',
        'value' => 1
      },
      'irregular' => {},
      'normal' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'hr_zone_calc' => bless( {
    'base_type' => {},
    'name' => 'hr_zone_calc',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'custom',
        'value' => 0
      },
      '1' => {
        'name' => 'percent_max_hr',
        'value' => 1
      },
      '2' => {
        'name' => 'percent_hrr',
        'value' => 2
      },
      'custom' => {},
      'percent_hrr' => {},
      'percent_max_hr' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'intensity' => bless( {
    'base_type' => {},
    'name' => 'intensity',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'active',
        'value' => 0
      },
      '1' => {
        'name' => 'rest',
        'value' => 1
      },
      '2' => {
        'name' => 'warmup',
        'value' => 2
      },
      '3' => {
        'name' => 'cooldown',
        'value' => 3
      },
      'active' => {},
      'cooldown' => {},
      'rest' => {},
      'warmup' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'language' => bless( {
    'base_type' => {},
    'name' => 'language',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'english',
        'value' => 0
      },
      '1' => {
        'name' => 'french',
        'value' => 1
      },
      '10' => {
        'name' => 'greek',
        'value' => 10
      },
      '11' => {
        'name' => 'hungarian',
        'value' => 11
      },
      '12' => {
        'name' => 'norwegian',
        'value' => 12
      },
      '13' => {
        'name' => 'polish',
        'value' => 13
      },
      '14' => {
        'name' => 'portuguese',
        'value' => 14
      },
      '15' => {
        'name' => 'slovakian',
        'value' => 15
      },
      '16' => {
        'name' => 'slovenian',
        'value' => 16
      },
      '17' => {
        'name' => 'swedish',
        'value' => 17
      },
      '18' => {
        'name' => 'russian',
        'value' => 18
      },
      '19' => {
        'name' => 'turkish',
        'value' => 19
      },
      '2' => {
        'name' => 'italian',
        'value' => 2
      },
      '20' => {
        'name' => 'latvian',
        'value' => 20
      },
      '21' => {
        'name' => 'ukrainian',
        'value' => 21
      },
      '22' => {
        'name' => 'arabic',
        'value' => 22
      },
      '23' => {
        'name' => 'farsi',
        'value' => 23
      },
      '24' => {
        'name' => 'bulgarian',
        'value' => 24
      },
      '25' => {
        'name' => 'romanian',
        'value' => 25
      },
      '254' => {
        'name' => 'custom',
        'value' => 254
      },
      '3' => {
        'name' => 'german',
        'value' => 3
      },
      '4' => {
        'name' => 'spanish',
        'value' => 4
      },
      '5' => {
        'name' => 'croatian',
        'value' => 5
      },
      '6' => {
        'name' => 'czech',
        'value' => 6
      },
      '7' => {
        'name' => 'danish',
        'value' => 7
      },
      '8' => {
        'name' => 'dutch',
        'value' => 8
      },
      '9' => {
        'name' => 'finnish',
        'value' => 9
      },
      'arabic' => {},
      'bulgarian' => {},
      'croatian' => {},
      'custom' => {},
      'czech' => {},
      'danish' => {},
      'dutch' => {},
      'english' => {},
      'farsi' => {},
      'finnish' => {},
      'french' => {},
      'german' => {},
      'greek' => {},
      'hungarian' => {},
      'italian' => {},
      'latvian' => {},
      'norwegian' => {},
      'polish' => {},
      'portuguese' => {},
      'romanian' => {},
      'russian' => {},
      'slovakian' => {},
      'slovenian' => {},
      'spanish' => {},
      'swedish' => {},
      'turkish' => {},
      'ukrainian' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'lap_trigger' => bless( {
    'base_type' => {},
    'name' => 'lap_trigger',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'manual',
        'value' => 0
      },
      '1' => {
        'name' => 'time',
        'value' => 1
      },
      '2' => {
        'name' => 'distance',
        'value' => 2
      },
      '3' => {
        'name' => 'position_start',
        'value' => 3
      },
      '4' => {
        'name' => 'position_lap',
        'value' => 4
      },
      '5' => {
        'name' => 'position_waypoint',
        'value' => 5
      },
      '6' => {
        'name' => 'position_marked',
        'value' => 6
      },
      '7' => {
        'name' => 'session_end',
        'value' => 7
      },
      '8' => {
        'name' => 'fitness_equipment',
        'value' => 8
      },
      'distance' => {},
      'fitness_equipment' => {},
      'manual' => {},
      'position_lap' => {},
      'position_marked' => {},
      'position_start' => {},
      'position_waypoint' => {},
      'session_end' => {},
      'time' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'local_date_time' => bless( {
    'base_type' => {},
    'comment' => 'seconds since 00:00 Dec 31 1989 in local time zone',
    'name' => 'local_date_time',
    'size' => 4
  }, 'Garmin::FIT::Streamer::Type::LocalDateTime' ),
  'manufacturer' => bless( {
    'base_type' => {},
    'name' => 'manufacturer',
    'size' => 2,
    'values' => {
      '1' => {
        'name' => 'garmin',
        'value' => 1
      },
      '10' => {
        'name' => 'spark_hk',
        'value' => 10
      },
      '11' => {
        'name' => 'tanita',
        'value' => 11
      },
      '12' => {
        'name' => 'echowell',
        'value' => 12
      },
      '13' => {
        'name' => 'dynastream_oem',
        'value' => 13
      },
      '14' => {
        'name' => 'nautilus',
        'value' => 14
      },
      '15' => {
        'name' => 'dynastream',
        'value' => 15
      },
      '16' => {
        'name' => 'timex',
        'value' => 16
      },
      '17' => {
        'name' => 'metrigear',
        'value' => 17
      },
      '18' => {
        'name' => 'xelic',
        'value' => 18
      },
      '19' => {
        'name' => 'beurer',
        'value' => 19
      },
      '2' => {
        'comment' => 'Do not use.  Used by FR405 for ANTFS man id.',
        'name' => 'garmin_fr405_antfs',
        'value' => 2
      },
      '20' => {
        'name' => 'cardiosport',
        'value' => 20
      },
      '21' => {
        'name' => 'a_and_d',
        'value' => 21
      },
      '22' => {
        'name' => 'hmm',
        'value' => 22
      },
      '23' => {
        'name' => 'suunto',
        'value' => 23
      },
      '24' => {
        'name' => 'thita_elektronik',
        'value' => 24
      },
      '25' => {
        'name' => 'gpulse',
        'value' => 25
      },
      '26' => {
        'name' => 'clean_mobile',
        'value' => 26
      },
      '27' => {
        'name' => 'pedal_brain',
        'value' => 27
      },
      '28' => {
        'name' => 'peaksware',
        'value' => 28
      },
      '29' => {
        'name' => 'saxonar',
        'value' => 29
      },
      '3' => {
        'name' => 'zephyr',
        'value' => 3
      },
      '30' => {
        'name' => 'lemond_fitness',
        'value' => 30
      },
      '31' => {
        'name' => 'dexcom',
        'value' => 31
      },
      '32' => {
        'name' => 'wahoo_fitness',
        'value' => 32
      },
      '33' => {
        'name' => 'octane_fitness',
        'value' => 33
      },
      '4' => {
        'name' => 'dayton',
        'value' => 4
      },
      '5' => {
        'name' => 'idt',
        'value' => 5
      },
      '6' => {
        'name' => 'srm',
        'value' => 6
      },
      '7' => {
        'name' => 'quarq',
        'value' => 7
      },
      '8' => {
        'name' => 'ibike',
        'value' => 8
      },
      '9' => {
        'name' => 'saris',
        'value' => 9
      },
      'a_and_d' => {},
      'beurer' => {},
      'cardiosport' => {},
      'clean_mobile' => {},
      'dayton' => {},
      'dexcom' => {},
      'dynastream' => {},
      'dynastream_oem' => {},
      'echowell' => {},
      'garmin' => {},
      'garmin_fr405_antfs' => {},
      'gpulse' => {},
      'hmm' => {},
      'ibike' => {},
      'idt' => {},
      'lemond_fitness' => {},
      'metrigear' => {},
      'nautilus' => {},
      'octane_fitness' => {},
      'peaksware' => {},
      'pedal_brain' => {},
      'quarq' => {},
      'saris' => {},
      'saxonar' => {},
      'spark_hk' => {},
      'srm' => {},
      'suunto' => {},
      'tanita' => {},
      'thita_elektronik' => {},
      'timex' => {},
      'wahoo_fitness' => {},
      'xelic' => {},
      'zephyr' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'mesg_count' => bless( {
    'base_type' => {},
    'name' => 'mesg_count',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'num_per_file',
        'value' => 0
      },
      '1' => {
        'name' => 'max_per_file',
        'value' => 1
      },
      '2' => {
        'name' => 'max_per_file_type',
        'value' => 2
      },
      'max_per_file' => {},
      'max_per_file_type' => {},
      'num_per_file' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'mesg_num' => bless( {
    'base_type' => {},
    'name' => 'mesg_num',
    'size' => 2,
    'values' => {
      '0' => {
        'name' => 'file_id',
        'value' => 0
      },
      '1' => {
        'name' => 'capabilities',
        'value' => 1
      },
      '10' => {
        'name' => 'met_zone',
        'value' => 10
      },
      '12' => {
        'name' => 'sport',
        'value' => 12
      },
      '15' => {
        'name' => 'goal',
        'value' => 15
      },
      '18' => {
        'name' => 'session',
        'value' => 18
      },
      '19' => {
        'name' => 'lap',
        'value' => 19
      },
      '2' => {
        'name' => 'device_settings',
        'value' => 2
      },
      '20' => {
        'name' => 'record',
        'value' => 20
      },
      '21' => {
        'name' => 'event',
        'value' => 21
      },
      '23' => {
        'name' => 'device_info',
        'value' => 23
      },
      '26' => {
        'name' => 'workout',
        'value' => 26
      },
      '27' => {
        'name' => 'workout_step',
        'value' => 27
      },
      '3' => {
        'name' => 'user_profile',
        'value' => 3
      },
      '30' => {
        'name' => 'weight_scale',
        'value' => 30
      },
      '31' => {
        'name' => 'course',
        'value' => 31
      },
      '32' => {
        'name' => 'course_point',
        'value' => 32
      },
      '33' => {
        'name' => 'totals',
        'value' => 33
      },
      '34' => {
        'name' => 'activity',
        'value' => 34
      },
      '35' => {
        'name' => 'software',
        'value' => 35
      },
      '37' => {
        'name' => 'file_capabilities',
        'value' => 37
      },
      '38' => {
        'name' => 'mesg_capabilities',
        'value' => 38
      },
      '39' => {
        'name' => 'field_capabilities',
        'value' => 39
      },
      '4' => {
        'name' => 'hrm_profile',
        'value' => 4
      },
      '49' => {
        'name' => 'file_creator',
        'value' => 49
      },
      '5' => {
        'name' => 'sdm_profile',
        'value' => 5
      },
      '51' => {
        'name' => 'blood_pressure',
        'value' => 51
      },
      '6' => {
        'name' => 'bike_profile',
        'value' => 6
      },
      '65280' => {
        'comment' => '0xFF00 - 0xFFFE reserved for manufacturer specific messages',
        'name' => 'mfg_range_min',
        'value' => 65280
      },
      '65534' => {
        'comment' => '0xFF00 - 0xFFFE reserved for manufacturer specific messages',
        'name' => 'mfg_range_max',
        'value' => 65534
      },
      '7' => {
        'name' => 'zones_target',
        'value' => 7
      },
      '8' => {
        'name' => 'hr_zone',
        'value' => 8
      },
      '9' => {
        'name' => 'power_zone',
        'value' => 9
      },
      'activity' => {},
      'bike_profile' => {},
      'blood_pressure' => {},
      'capabilities' => {},
      'course' => {},
      'course_point' => {},
      'device_info' => {},
      'device_settings' => {},
      'event' => {},
      'field_capabilities' => {},
      'file_capabilities' => {},
      'file_creator' => {},
      'file_id' => {},
      'goal' => {},
      'hr_zone' => {},
      'hrm_profile' => {},
      'lap' => {},
      'mesg_capabilities' => {},
      'met_zone' => {},
      'mfg_range_max' => {},
      'mfg_range_min' => {},
      'power_zone' => {},
      'record' => {},
      'sdm_profile' => {},
      'session' => {},
      'software' => {},
      'sport' => {},
      'totals' => {},
      'user_profile' => {},
      'weight_scale' => {},
      'workout' => {},
      'workout_step' => {},
      'zones_target' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'message_index' => bless( {
    'base_type' => {},
    'name' => 'message_index',
    'size' => 2,
    'values' => {
      '28672' => {
        'comment' => 'reserved (default 0)',
        'name' => 'reserved',
        'value' => 28672
      },
      '32768' => {
        'comment' => 'message is selected if set',
        'name' => 'selected',
        'value' => 32768
      },
      '4095' => {
        'comment' => 'index',
        'name' => 'mask',
        'value' => 4095
      },
      'mask' => {},
      'reserved' => {},
      'selected' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'pwr_zone_calc' => bless( {
    'base_type' => {},
    'name' => 'pwr_zone_calc',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'custom',
        'value' => 0
      },
      '1' => {
        'name' => 'percent_ftp',
        'value' => 1
      },
      'custom' => {},
      'percent_ftp' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'session_trigger' => bless( {
    'base_type' => {},
    'name' => 'session_trigger',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'activity_end',
        'value' => 0
      },
      '1' => {
        'comment' => 'User changed sport.',
        'name' => 'manual',
        'value' => 1
      },
      '2' => {
        'comment' => 'Auto multi-sport feature is enabled and user pressed lap button to advance session.',
        'name' => 'auto_multi_sport',
        'value' => 2
      },
      '3' => {
        'comment' => 'Auto sport change caused by user linking to fitness equipment.',
        'name' => 'fitness_equipment',
        'value' => 3
      },
      'activity_end' => {},
      'auto_multi_sport' => {},
      'fitness_equipment' => {},
      'manual' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'sint16' => bless( {
    'base_type' => {},
    'name' => 'sint16',
    'size' => 2
  }, 'Garmin::FIT::Streamer::Type' ),
  'sint32' => bless( {
    'base_type' => {},
    'name' => 'sint32',
    'size' => 4
  }, 'Garmin::FIT::Streamer::Type' ),
  'sint8' => bless( {
    'base_type' => {},
    'name' => 'sint8',
    'size' => 1
  }, 'Garmin::FIT::Streamer::Type' ),
  'sport' => bless( {
    'base_type' => {},
    'name' => 'sport',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'generic',
        'value' => 0
      },
      '1' => {
        'name' => 'running',
        'value' => 1
      },
      '2' => {
        'name' => 'cycling',
        'value' => 2
      },
      '254' => {
        'comment' => 'All is for goals only to include all sports.',
        'name' => 'all',
        'value' => 254
      },
      '3' => {
        'comment' => 'Mulitsport transition',
        'name' => 'transition',
        'value' => 3
      },
      '4' => {
        'name' => 'fitness_equipment',
        'value' => 4
      },
      '5' => {
        'name' => 'swimming',
        'value' => 5
      },
      'all' => {},
      'cycling' => {},
      'fitness_equipment' => {},
      'generic' => {},
      'running' => {},
      'swimming' => {},
      'transition' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'sport_bits_0' => bless( {
    'base_type' => {},
    'comment' => 'Bit field corresponding to sport enum type (1 << sport).',
    'name' => 'sport_bits_0',
    'size' => 1,
    'values' => {
      '1' => {
        'name' => 'generic',
        'value' => 1
      },
      '16' => {
        'name' => 'fitness_equipment',
        'value' => 16
      },
      '2' => {
        'name' => 'running',
        'value' => 2
      },
      '32' => {
        'name' => 'swimming',
        'value' => 32
      },
      '4' => {
        'name' => 'cycling',
        'value' => 4
      },
      '8' => {
        'comment' => 'Mulitsport transition',
        'name' => 'transition',
        'value' => 8
      },
      'cycling' => {},
      'fitness_equipment' => {},
      'generic' => {},
      'running' => {},
      'swimming' => {},
      'transition' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'string' => bless( {
    'base_type' => {},
    'name' => 'string',
    'size' => 0
  }, 'Garmin::FIT::Streamer::Type' ),
  'sub_sport' => bless( {
    'base_type' => {},
    'name' => 'sub_sport',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'generic',
        'value' => 0
      },
      '1' => {
        'comment' => 'Run',
        'name' => 'treadmill',
        'value' => 1
      },
      '10' => {
        'comment' => 'Cycling',
        'name' => 'recumbent',
        'value' => 10
      },
      '11' => {
        'comment' => 'Cycling',
        'name' => 'cyclocross',
        'value' => 11
      },
      '12' => {
        'comment' => 'Cycling',
        'name' => 'hand_cycling',
        'value' => 12
      },
      '13' => {
        'comment' => 'Cycling',
        'name' => 'track_cycling',
        'value' => 13
      },
      '14' => {
        'comment' => 'Fitness Equipment',
        'name' => 'indoor_rowing',
        'value' => 14
      },
      '15' => {
        'comment' => 'Fitness Equipment',
        'name' => 'elliptical',
        'value' => 15
      },
      '16' => {
        'comment' => 'Fitness Equipment',
        'name' => 'stair_climbing',
        'value' => 16
      },
      '17' => {
        'comment' => 'Swimming',
        'name' => 'lap_swimming',
        'value' => 17
      },
      '18' => {
        'comment' => 'Swimming',
        'name' => 'open_water',
        'value' => 18
      },
      '2' => {
        'comment' => 'Run',
        'name' => 'street',
        'value' => 2
      },
      '254' => {
        'name' => 'all',
        'value' => 254
      },
      '3' => {
        'comment' => 'Run',
        'name' => 'trail',
        'value' => 3
      },
      '4' => {
        'comment' => 'Run',
        'name' => 'track',
        'value' => 4
      },
      '5' => {
        'comment' => 'Cycling',
        'name' => 'spin',
        'value' => 5
      },
      '6' => {
        'comment' => 'Cycling',
        'name' => 'indoor_cycling',
        'value' => 6
      },
      '7' => {
        'comment' => 'Cycling',
        'name' => 'road',
        'value' => 7
      },
      '8' => {
        'comment' => 'Cycling',
        'name' => 'mountain',
        'value' => 8
      },
      '9' => {
        'comment' => 'Cycling',
        'name' => 'downhill',
        'value' => 9
      },
      'all' => {},
      'cyclocross' => {},
      'downhill' => {},
      'elliptical' => {},
      'generic' => {},
      'hand_cycling' => {},
      'indoor_cycling' => {},
      'indoor_rowing' => {},
      'lap_swimming' => {},
      'mountain' => {},
      'open_water' => {},
      'recumbent' => {},
      'road' => {},
      'spin' => {},
      'stair_climbing' => {},
      'street' => {},
      'track' => {},
      'track_cycling' => {},
      'trail' => {},
      'treadmill' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'timer_trigger' => bless( {
    'base_type' => {},
    'comment' => 'timer event data',
    'name' => 'timer_trigger',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'manual',
        'value' => 0
      },
      '1' => {
        'name' => 'auto',
        'value' => 1
      },
      '2' => {
        'name' => 'fitness_equipment',
        'value' => 2
      },
      'auto' => {},
      'fitness_equipment' => {},
      'manual' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'uint16' => bless( {
    'base_type' => {},
    'name' => 'uint16',
    'size' => 2
  }, 'Garmin::FIT::Streamer::Type' ),
  'uint16z' => bless( {
    'base_type' => {},
    'name' => 'uint16z',
    'size' => 2
  }, 'Garmin::FIT::Streamer::Type' ),
  'uint32' => bless( {
    'base_type' => {},
    'name' => 'uint32',
    'size' => 4
  }, 'Garmin::FIT::Streamer::Type' ),
  'uint32z' => bless( {
    'base_type' => {},
    'name' => 'uint32z',
    'size' => 4
  }, 'Garmin::FIT::Streamer::Type' ),
  'uint8' => bless( {
    'base_type' => {},
    'name' => 'uint8',
    'size' => 1
  }, 'Garmin::FIT::Streamer::Type' ),
  'uint8z' => bless( {
    'base_type' => {},
    'name' => 'uint8z',
    'size' => 1
  }, 'Garmin::FIT::Streamer::Type' ),
  'user_local_id' => bless( {
    'base_type' => {},
    'name' => 'user_local_id',
    'size' => 2,
    'values' => {
      '1' => {
        'name' => 'local_min',
        'value' => 1
      },
      '15' => {
        'name' => 'local_max',
        'value' => 15
      },
      '16' => {
        'name' => 'stationary_min',
        'value' => 16
      },
      '255' => {
        'name' => 'stationary_max',
        'value' => 255
      },
      '256' => {
        'name' => 'portable_min',
        'value' => 256
      },
      '65534' => {
        'name' => 'portable_max',
        'value' => 65534
      },
      'local_max' => {},
      'local_min' => {},
      'portable_max' => {},
      'portable_min' => {},
      'stationary_max' => {},
      'stationary_min' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'weight' => bless( {
    'base_type' => {},
    'name' => 'weight',
    'size' => 2,
    'values' => {
      '65534' => {
        'name' => 'calculating',
        'value' => 65534
      },
      'calculating' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'wkt_step_duration' => bless( {
    'base_type' => {},
    'name' => 'wkt_step_duration',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'time',
        'value' => 0
      },
      '1' => {
        'name' => 'distance',
        'value' => 1
      },
      '10' => {
        'name' => 'repeat_until_hr_less_than',
        'value' => 10
      },
      '11' => {
        'name' => 'repeat_until_hr_greater_than',
        'value' => 11
      },
      '12' => {
        'name' => 'repeat_until_power_less_than',
        'value' => 12
      },
      '13' => {
        'name' => 'repeat_until_power_greater_than',
        'value' => 13
      },
      '14' => {
        'name' => 'power_less_than',
        'value' => 14
      },
      '15' => {
        'name' => 'power_greater_than',
        'value' => 15
      },
      '2' => {
        'name' => 'hr_less_than',
        'value' => 2
      },
      '3' => {
        'name' => 'hr_greater_than',
        'value' => 3
      },
      '4' => {
        'name' => 'calories',
        'value' => 4
      },
      '5' => {
        'name' => 'open',
        'value' => 5
      },
      '6' => {
        'name' => 'repeat_until_steps_cmplt',
        'value' => 6
      },
      '7' => {
        'name' => 'repeat_until_time',
        'value' => 7
      },
      '8' => {
        'name' => 'repeat_until_distance',
        'value' => 8
      },
      '9' => {
        'name' => 'repeat_until_calories',
        'value' => 9
      },
      'calories' => {},
      'distance' => {},
      'hr_greater_than' => {},
      'hr_less_than' => {},
      'open' => {},
      'power_greater_than' => {},
      'power_less_than' => {},
      'repeat_until_calories' => {},
      'repeat_until_distance' => {},
      'repeat_until_hr_greater_than' => {},
      'repeat_until_hr_less_than' => {},
      'repeat_until_power_greater_than' => {},
      'repeat_until_power_less_than' => {},
      'repeat_until_steps_cmplt' => {},
      'repeat_until_time' => {},
      'time' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'wkt_step_target' => bless( {
    'base_type' => {},
    'name' => 'wkt_step_target',
    'size' => 1,
    'values' => {
      '0' => {
        'name' => 'speed',
        'value' => 0
      },
      '1' => {
        'name' => 'heart_rate',
        'value' => 1
      },
      '2' => {
        'name' => 'open',
        'value' => 2
      },
      '3' => {
        'name' => 'cadence',
        'value' => 3
      },
      '4' => {
        'name' => 'power',
        'value' => 4
      },
      '5' => {
        'name' => 'grade',
        'value' => 5
      },
      '6' => {
        'name' => 'resistance',
        'value' => 6
      },
      'cadence' => {},
      'grade' => {},
      'heart_rate' => {},
      'open' => {},
      'power' => {},
      'resistance' => {},
      'speed' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'workout_capabilities' => bless( {
    'base_type' => {},
    'name' => 'workout_capabilities',
    'size' => 4,
    'values' => {
      '1' => {
        'name' => 'interval',
        'value' => 1
      },
      '1024' => {
        'comment' => 'Cadence source required for workout step.',
        'name' => 'cadence',
        'value' => 1024
      },
      '128' => {
        'comment' => 'Speed source required for workout step.',
        'name' => 'speed',
        'value' => 128
      },
      '16' => {
        'name' => 'new_leaf',
        'value' => 16
      },
      '16384' => {
        'name' => 'protected',
        'value' => 16384
      },
      '2' => {
        'name' => 'custom',
        'value' => 2
      },
      '2048' => {
        'comment' => 'Power source required for workout step.',
        'name' => 'power',
        'value' => 2048
      },
      '256' => {
        'comment' => 'Heart rate source required for workout step.',
        'name' => 'heart_rate',
        'value' => 256
      },
      '32' => {
        'comment' => 'For backwards compatibility.  Watch should add missing id fields then clear flag.',
        'name' => 'tcx',
        'value' => 32
      },
      '4' => {
        'name' => 'fitness_equipment',
        'value' => 4
      },
      '4096' => {
        'comment' => 'Grade source required for workout step.',
        'name' => 'grade',
        'value' => 4096
      },
      '512' => {
        'comment' => 'Distance source required for workout step.',
        'name' => 'distance',
        'value' => 512
      },
      '8' => {
        'name' => 'firstbeat',
        'value' => 8
      },
      '8192' => {
        'comment' => 'Resistance source required for workout step.',
        'name' => 'resistance',
        'value' => 8192
      },
      'cadence' => {},
      'custom' => {},
      'distance' => {},
      'firstbeat' => {},
      'fitness_equipment' => {},
      'grade' => {},
      'heart_rate' => {},
      'interval' => {},
      'new_leaf' => {},
      'power' => {},
      'protected' => {},
      'resistance' => {},
      'speed' => {},
      'tcx' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'workout_hr' => bless( {
    'base_type' => {},
    'comment' => '0 - 100 indicates% of maz hr; >100 indicates bpm (255 max) plus 100',
    'name' => 'workout_hr',
    'size' => 4,
    'values' => {
      '100' => {
        'name' => 'bpm_offset',
        'value' => 100
      },
      'bpm_offset' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' ),
  'workout_power' => bless( {
    'base_type' => {},
    'comment' => '0 - 1000 indicates % of functional threshold power; >1000 indicates watts plus 1000.',
    'name' => 'workout_power',
    'size' => 4,
    'values' => {
      '1000' => {
        'name' => 'watts_offset',
        'value' => 1000
      },
      'watts_offset' => {}
    }
  }, 'Garmin::FIT::Streamer::Type' )
};
$types->{'activity'}{'base_type'} = $base_types->{'0'};
$types->{'activity'}{'values'}{'auto_multi_sport'} = $types->{'activity'}{'values'}{'1'};
$types->{'activity'}{'values'}{'manual'} = $types->{'activity'}{'values'}{'0'};
$types->{'activity_class'}{'base_type'} = $base_types->{'0'};
$types->{'activity_class'}{'values'}{'athlete'} = $types->{'activity_class'}{'values'}{'128'};
$types->{'activity_class'}{'values'}{'level'} = $types->{'activity_class'}{'values'}{'127'};
$types->{'activity_class'}{'values'}{'level_max'} = $types->{'activity_class'}{'values'}{'100'};
$types->{'autolap_trigger'}{'base_type'} = $base_types->{'0'};
$types->{'autolap_trigger'}{'values'}{'distance'} = $types->{'autolap_trigger'}{'values'}{'1'};
$types->{'autolap_trigger'}{'values'}{'off'} = $types->{'autolap_trigger'}{'values'}{'6'};
$types->{'autolap_trigger'}{'values'}{'position_lap'} = $types->{'autolap_trigger'}{'values'}{'3'};
$types->{'autolap_trigger'}{'values'}{'position_marked'} = $types->{'autolap_trigger'}{'values'}{'5'};
$types->{'autolap_trigger'}{'values'}{'position_start'} = $types->{'autolap_trigger'}{'values'}{'2'};
$types->{'autolap_trigger'}{'values'}{'position_waypoint'} = $types->{'autolap_trigger'}{'values'}{'4'};
$types->{'autolap_trigger'}{'values'}{'time'} = $types->{'autolap_trigger'}{'values'}{'0'};
$types->{'battery_status'}{'base_type'} = $base_types->{'2'};
$types->{'battery_status'}{'values'}{'critical'} = $types->{'battery_status'}{'values'}{'5'};
$types->{'battery_status'}{'values'}{'good'} = $types->{'battery_status'}{'values'}{'2'};
$types->{'battery_status'}{'values'}{'low'} = $types->{'battery_status'}{'values'}{'4'};
$types->{'battery_status'}{'values'}{'new'} = $types->{'battery_status'}{'values'}{'1'};
$types->{'battery_status'}{'values'}{'ok'} = $types->{'battery_status'}{'values'}{'3'};
$types->{'bool'}{'base_type'} = $base_types->{'0'};
$types->{'bool'}{'values'}{'no'} = $types->{'bool'}{'values'}{'0'};
$types->{'bool'}{'values'}{'yes'} = $types->{'bool'}{'values'}{'1'};
$types->{'bp_status'}{'base_type'} = $base_types->{'0'};
$types->{'bp_status'}{'values'}{'error_data_out_of_range'} = $types->{'bp_status'}{'values'}{'3'};
$types->{'bp_status'}{'values'}{'error_incomplete_data'} = $types->{'bp_status'}{'values'}{'1'};
$types->{'bp_status'}{'values'}{'error_irregular_heart_rate'} = $types->{'bp_status'}{'values'}{'4'};
$types->{'bp_status'}{'values'}{'error_no_measurement'} = $types->{'bp_status'}{'values'}{'2'};
$types->{'bp_status'}{'values'}{'no_error'} = $types->{'bp_status'}{'values'}{'0'};
$types->{'byte'}{'base_type'} = $base_types->{'13'};
$types->{'course_capabilities'}{'base_type'} = $base_types->{'140'};
$types->{'course_capabilities'}{'values'}{'cadence'} = $types->{'course_capabilities'}{'values'}{'128'};
$types->{'course_capabilities'}{'values'}{'distance'} = $types->{'course_capabilities'}{'values'}{'8'};
$types->{'course_capabilities'}{'values'}{'heart_rate'} = $types->{'course_capabilities'}{'values'}{'32'};
$types->{'course_capabilities'}{'values'}{'navigation'} = $types->{'course_capabilities'}{'values'}{'512'};
$types->{'course_capabilities'}{'values'}{'position'} = $types->{'course_capabilities'}{'values'}{'16'};
$types->{'course_capabilities'}{'values'}{'power'} = $types->{'course_capabilities'}{'values'}{'64'};
$types->{'course_capabilities'}{'values'}{'processed'} = $types->{'course_capabilities'}{'values'}{'1'};
$types->{'course_capabilities'}{'values'}{'time'} = $types->{'course_capabilities'}{'values'}{'4'};
$types->{'course_capabilities'}{'values'}{'training'} = $types->{'course_capabilities'}{'values'}{'256'};
$types->{'course_capabilities'}{'values'}{'valid'} = $types->{'course_capabilities'}{'values'}{'2'};
$types->{'course_point'}{'base_type'} = $base_types->{'0'};
$types->{'course_point'}{'values'}{'danger'} = $types->{'course_point'}{'values'}{'5'};
$types->{'course_point'}{'values'}{'first_aid'} = $types->{'course_point'}{'values'}{'9'};
$types->{'course_point'}{'values'}{'first_category'} = $types->{'course_point'}{'values'}{'13'};
$types->{'course_point'}{'values'}{'food'} = $types->{'course_point'}{'values'}{'4'};
$types->{'course_point'}{'values'}{'fourth_category'} = $types->{'course_point'}{'values'}{'10'};
$types->{'course_point'}{'values'}{'generic'} = $types->{'course_point'}{'values'}{'0'};
$types->{'course_point'}{'values'}{'hors_category'} = $types->{'course_point'}{'values'}{'14'};
$types->{'course_point'}{'values'}{'left'} = $types->{'course_point'}{'values'}{'6'};
$types->{'course_point'}{'values'}{'left_fork'} = $types->{'course_point'}{'values'}{'16'};
$types->{'course_point'}{'values'}{'middle_fork'} = $types->{'course_point'}{'values'}{'18'};
$types->{'course_point'}{'values'}{'right'} = $types->{'course_point'}{'values'}{'7'};
$types->{'course_point'}{'values'}{'right_fork'} = $types->{'course_point'}{'values'}{'17'};
$types->{'course_point'}{'values'}{'second_category'} = $types->{'course_point'}{'values'}{'12'};
$types->{'course_point'}{'values'}{'sprint'} = $types->{'course_point'}{'values'}{'15'};
$types->{'course_point'}{'values'}{'straight'} = $types->{'course_point'}{'values'}{'8'};
$types->{'course_point'}{'values'}{'summit'} = $types->{'course_point'}{'values'}{'1'};
$types->{'course_point'}{'values'}{'third_category'} = $types->{'course_point'}{'values'}{'11'};
$types->{'course_point'}{'values'}{'valley'} = $types->{'course_point'}{'values'}{'2'};
$types->{'course_point'}{'values'}{'water'} = $types->{'course_point'}{'values'}{'3'};
$types->{'date_time'}{'base_type'} = $base_types->{'134'};
$types->{'date_time'}{'values'}{'min'} = $types->{'date_time'}{'values'}{'268435456'};
$types->{'device_index'}{'base_type'} = $base_types->{'2'};
$types->{'device_index'}{'values'}{'creator'} = $types->{'device_index'}{'values'}{'0'};
$types->{'device_type'}{'base_type'} = $base_types->{'2'};
$types->{'device_type'}{'values'}{'antfs'} = $types->{'device_type'}{'values'}{'1'};
$types->{'device_type'}{'values'}{'bike_cadence'} = $types->{'device_type'}{'values'}{'122'};
$types->{'device_type'}{'values'}{'bike_power'} = $types->{'device_type'}{'values'}{'11'};
$types->{'device_type'}{'values'}{'bike_speed'} = $types->{'device_type'}{'values'}{'123'};
$types->{'device_type'}{'values'}{'bike_speed_cadence'} = $types->{'device_type'}{'values'}{'121'};
$types->{'device_type'}{'values'}{'blood_pressure'} = $types->{'device_type'}{'values'}{'18'};
$types->{'device_type'}{'values'}{'environment_sensor'} = $types->{'device_type'}{'values'}{'12'};
$types->{'device_type'}{'values'}{'fitness_equipment'} = $types->{'device_type'}{'values'}{'17'};
$types->{'device_type'}{'values'}{'heart_rate'} = $types->{'device_type'}{'values'}{'120'};
$types->{'device_type'}{'values'}{'multi_sport_speed_distance'} = $types->{'device_type'}{'values'}{'15'};
$types->{'device_type'}{'values'}{'stride_speed_distance'} = $types->{'device_type'}{'values'}{'124'};
$types->{'device_type'}{'values'}{'weight_scale'} = $types->{'device_type'}{'values'}{'119'};
$types->{'display_heart'}{'base_type'} = $base_types->{'0'};
$types->{'display_heart'}{'values'}{'bpm'} = $types->{'display_heart'}{'values'}{'0'};
$types->{'display_heart'}{'values'}{'max'} = $types->{'display_heart'}{'values'}{'1'};
$types->{'display_heart'}{'values'}{'reserve'} = $types->{'display_heart'}{'values'}{'2'};
$types->{'display_measure'}{'base_type'} = $base_types->{'0'};
$types->{'display_measure'}{'values'}{'metric'} = $types->{'display_measure'}{'values'}{'0'};
$types->{'display_measure'}{'values'}{'statute'} = $types->{'display_measure'}{'values'}{'1'};
$types->{'display_position'}{'base_type'} = $base_types->{'0'};
$types->{'display_position'}{'values'}{'austrian_grid'} = $types->{'display_position'}{'values'}{'3'};
$types->{'display_position'}{'values'}{'borneo_rso'} = $types->{'display_position'}{'values'}{'38'};
$types->{'display_position'}{'values'}{'british_grid'} = $types->{'display_position'}{'values'}{'4'};
$types->{'display_position'}{'values'}{'degree'} = $types->{'display_position'}{'values'}{'0'};
$types->{'display_position'}{'values'}{'degree_minute'} = $types->{'display_position'}{'values'}{'1'};
$types->{'display_position'}{'values'}{'degree_minute_second'} = $types->{'display_position'}{'values'}{'2'};
$types->{'display_position'}{'values'}{'dutch_grid'} = $types->{'display_position'}{'values'}{'5'};
$types->{'display_position'}{'values'}{'estonian_grid'} = $types->{'display_position'}{'values'}{'39'};
$types->{'display_position'}{'values'}{'finnish_grid'} = $types->{'display_position'}{'values'}{'7'};
$types->{'display_position'}{'values'}{'german_grid'} = $types->{'display_position'}{'values'}{'8'};
$types->{'display_position'}{'values'}{'hungarian_grid'} = $types->{'display_position'}{'values'}{'6'};
$types->{'display_position'}{'values'}{'icelandic_grid'} = $types->{'display_position'}{'values'}{'9'};
$types->{'display_position'}{'values'}{'india_zone_0'} = $types->{'display_position'}{'values'}{'13'};
$types->{'display_position'}{'values'}{'india_zone_ia'} = $types->{'display_position'}{'values'}{'14'};
$types->{'display_position'}{'values'}{'india_zone_ib'} = $types->{'display_position'}{'values'}{'15'};
$types->{'display_position'}{'values'}{'india_zone_iia'} = $types->{'display_position'}{'values'}{'16'};
$types->{'display_position'}{'values'}{'india_zone_iib'} = $types->{'display_position'}{'values'}{'17'};
$types->{'display_position'}{'values'}{'india_zone_iiia'} = $types->{'display_position'}{'values'}{'18'};
$types->{'display_position'}{'values'}{'india_zone_iiib'} = $types->{'display_position'}{'values'}{'19'};
$types->{'display_position'}{'values'}{'india_zone_iva'} = $types->{'display_position'}{'values'}{'20'};
$types->{'display_position'}{'values'}{'india_zone_ivb'} = $types->{'display_position'}{'values'}{'21'};
$types->{'display_position'}{'values'}{'indonesian_equatorial'} = $types->{'display_position'}{'values'}{'10'};
$types->{'display_position'}{'values'}{'indonesian_irian'} = $types->{'display_position'}{'values'}{'11'};
$types->{'display_position'}{'values'}{'indonesian_southern'} = $types->{'display_position'}{'values'}{'12'};
$types->{'display_position'}{'values'}{'irish_grid'} = $types->{'display_position'}{'values'}{'23'};
$types->{'display_position'}{'values'}{'irish_transverse'} = $types->{'display_position'}{'values'}{'22'};
$types->{'display_position'}{'values'}{'latvian_grid'} = $types->{'display_position'}{'values'}{'40'};
$types->{'display_position'}{'values'}{'loran'} = $types->{'display_position'}{'values'}{'24'};
$types->{'display_position'}{'values'}{'maidenhead_grid'} = $types->{'display_position'}{'values'}{'25'};
$types->{'display_position'}{'values'}{'mgrs_grid'} = $types->{'display_position'}{'values'}{'26'};
$types->{'display_position'}{'values'}{'modified_swedish_grid'} = $types->{'display_position'}{'values'}{'30'};
$types->{'display_position'}{'values'}{'new_zealand_grid'} = $types->{'display_position'}{'values'}{'27'};
$types->{'display_position'}{'values'}{'new_zealand_transverse'} = $types->{'display_position'}{'values'}{'28'};
$types->{'display_position'}{'values'}{'qatar_grid'} = $types->{'display_position'}{'values'}{'29'};
$types->{'display_position'}{'values'}{'south_african_grid'} = $types->{'display_position'}{'values'}{'32'};
$types->{'display_position'}{'values'}{'swedish_grid'} = $types->{'display_position'}{'values'}{'31'};
$types->{'display_position'}{'values'}{'swedish_ref_99_grid'} = $types->{'display_position'}{'values'}{'41'};
$types->{'display_position'}{'values'}{'swiss_grid'} = $types->{'display_position'}{'values'}{'33'};
$types->{'display_position'}{'values'}{'taiwan_grid'} = $types->{'display_position'}{'values'}{'34'};
$types->{'display_position'}{'values'}{'united_states_grid'} = $types->{'display_position'}{'values'}{'35'};
$types->{'display_position'}{'values'}{'utm_ups_grid'} = $types->{'display_position'}{'values'}{'36'};
$types->{'display_position'}{'values'}{'west_malayan'} = $types->{'display_position'}{'values'}{'37'};
$types->{'display_power'}{'base_type'} = $base_types->{'0'};
$types->{'display_power'}{'values'}{'percent_ftp'} = $types->{'display_power'}{'values'}{'1'};
$types->{'display_power'}{'values'}{'watts'} = $types->{'display_power'}{'values'}{'0'};
$types->{'enum'}{'base_type'} = $base_types->{'0'};
$types->{'event'}{'base_type'} = $base_types->{'0'};
$types->{'event'}{'values'}{'activity'} = $types->{'event'}{'values'}{'26'};
$types->{'event'}{'values'}{'battery'} = $types->{'event'}{'values'}{'11'};
$types->{'event'}{'values'}{'battery_low'} = $types->{'event'}{'values'}{'22'};
$types->{'event'}{'values'}{'cad_high_alert'} = $types->{'event'}{'values'}{'17'};
$types->{'event'}{'values'}{'cad_low_alert'} = $types->{'event'}{'values'}{'18'};
$types->{'event'}{'values'}{'calorie_duration_alert'} = $types->{'event'}{'values'}{'25'};
$types->{'event'}{'values'}{'course_point'} = $types->{'event'}{'values'}{'10'};
$types->{'event'}{'values'}{'distance_duration_alert'} = $types->{'event'}{'values'}{'24'};
$types->{'event'}{'values'}{'fitness_equipment'} = $types->{'event'}{'values'}{'27'};
$types->{'event'}{'values'}{'hr_high_alert'} = $types->{'event'}{'values'}{'13'};
$types->{'event'}{'values'}{'hr_low_alert'} = $types->{'event'}{'values'}{'14'};
$types->{'event'}{'values'}{'lap'} = $types->{'event'}{'values'}{'9'};
$types->{'event'}{'values'}{'off_course'} = $types->{'event'}{'values'}{'7'};
$types->{'event'}{'values'}{'power_down'} = $types->{'event'}{'values'}{'5'};
$types->{'event'}{'values'}{'power_high_alert'} = $types->{'event'}{'values'}{'19'};
$types->{'event'}{'values'}{'power_low_alert'} = $types->{'event'}{'values'}{'20'};
$types->{'event'}{'values'}{'power_up'} = $types->{'event'}{'values'}{'6'};
$types->{'event'}{'values'}{'recovery_hr'} = $types->{'event'}{'values'}{'21'};
$types->{'event'}{'values'}{'session'} = $types->{'event'}{'values'}{'8'};
$types->{'event'}{'values'}{'speed_high_alert'} = $types->{'event'}{'values'}{'15'};
$types->{'event'}{'values'}{'speed_low_alert'} = $types->{'event'}{'values'}{'16'};
$types->{'event'}{'values'}{'time_duration_alert'} = $types->{'event'}{'values'}{'23'};
$types->{'event'}{'values'}{'timer'} = $types->{'event'}{'values'}{'0'};
$types->{'event'}{'values'}{'virtual_partner_pace'} = $types->{'event'}{'values'}{'12'};
$types->{'event'}{'values'}{'workout'} = $types->{'event'}{'values'}{'3'};
$types->{'event'}{'values'}{'workout_step'} = $types->{'event'}{'values'}{'4'};
$types->{'event_type'}{'base_type'} = $base_types->{'0'};
$types->{'event_type'}{'values'}{'begin_depreciated'} = $types->{'event_type'}{'values'}{'5'};
$types->{'event_type'}{'values'}{'consecutive_depreciated'} = $types->{'event_type'}{'values'}{'2'};
$types->{'event_type'}{'values'}{'end_all_depreciated'} = $types->{'event_type'}{'values'}{'7'};
$types->{'event_type'}{'values'}{'end_depreciated'} = $types->{'event_type'}{'values'}{'6'};
$types->{'event_type'}{'values'}{'marker'} = $types->{'event_type'}{'values'}{'3'};
$types->{'event_type'}{'values'}{'start'} = $types->{'event_type'}{'values'}{'0'};
$types->{'event_type'}{'values'}{'stop'} = $types->{'event_type'}{'values'}{'1'};
$types->{'event_type'}{'values'}{'stop_all'} = $types->{'event_type'}{'values'}{'4'};
$types->{'event_type'}{'values'}{'stop_disable'} = $types->{'event_type'}{'values'}{'8'};
$types->{'event_type'}{'values'}{'stop_disable_all'} = $types->{'event_type'}{'values'}{'9'};
$types->{'file'}{'base_type'} = $base_types->{'0'};
$types->{'file'}{'values'}{'activity'} = $types->{'file'}{'values'}{'4'};
$types->{'file'}{'values'}{'activity_summary'} = $types->{'file'}{'values'}{'20'};
$types->{'file'}{'values'}{'blood_pressure'} = $types->{'file'}{'values'}{'14'};
$types->{'file'}{'values'}{'course'} = $types->{'file'}{'values'}{'6'};
$types->{'file'}{'values'}{'device'} = $types->{'file'}{'values'}{'1'};
$types->{'file'}{'values'}{'goals'} = $types->{'file'}{'values'}{'11'};
$types->{'file'}{'values'}{'settings'} = $types->{'file'}{'values'}{'2'};
$types->{'file'}{'values'}{'sport'} = $types->{'file'}{'values'}{'3'};
$types->{'file'}{'values'}{'totals'} = $types->{'file'}{'values'}{'10'};
$types->{'file'}{'values'}{'weight'} = $types->{'file'}{'values'}{'9'};
$types->{'file'}{'values'}{'workout'} = $types->{'file'}{'values'}{'5'};
$types->{'file_flags'}{'base_type'} = $base_types->{'10'};
$types->{'file_flags'}{'values'}{'erase'} = $types->{'file_flags'}{'values'}{'8'};
$types->{'file_flags'}{'values'}{'read'} = $types->{'file_flags'}{'values'}{'2'};
$types->{'file_flags'}{'values'}{'write'} = $types->{'file_flags'}{'values'}{'4'};
$types->{'fitness_equipment_state'}{'base_type'} = $base_types->{'0'};
$types->{'fitness_equipment_state'}{'values'}{'in_use'} = $types->{'fitness_equipment_state'}{'values'}{'1'};
$types->{'fitness_equipment_state'}{'values'}{'paused'} = $types->{'fitness_equipment_state'}{'values'}{'2'};
$types->{'fitness_equipment_state'}{'values'}{'ready'} = $types->{'fitness_equipment_state'}{'values'}{'0'};
$types->{'fitness_equipment_state'}{'values'}{'unknown'} = $types->{'fitness_equipment_state'}{'values'}{'3'};
$types->{'float32'}{'base_type'} = $base_types->{'136'};
$types->{'float64'}{'base_type'} = $base_types->{'137'};
$types->{'garmin_product'}{'base_type'} = $base_types->{'132'};
$types->{'garmin_product'}{'values'}{'axb01'} = $types->{'garmin_product'}{'values'}{'3'};
$types->{'garmin_product'}{'values'}{'axb02'} = $types->{'garmin_product'}{'values'}{'4'};
$types->{'garmin_product'}{'values'}{'axh01'} = $types->{'garmin_product'}{'values'}{'2'};
$types->{'garmin_product'}{'values'}{'chirp'} = $types->{'garmin_product'}{'values'}{'1253'};
$types->{'garmin_product'}{'values'}{'connect'} = $types->{'garmin_product'}{'values'}{'65534'};
$types->{'garmin_product'}{'values'}{'dsi_alf01'} = $types->{'garmin_product'}{'values'}{'1011'};
$types->{'garmin_product'}{'values'}{'dsi_alf02'} = $types->{'garmin_product'}{'values'}{'6'};
$types->{'garmin_product'}{'values'}{'edge500'} = $types->{'garmin_product'}{'values'}{'1036'};
$types->{'garmin_product'}{'values'}{'edge800'} = $types->{'garmin_product'}{'values'}{'1169'};
$types->{'garmin_product'}{'values'}{'fr110'} = $types->{'garmin_product'}{'values'}{'1124'};
$types->{'garmin_product'}{'values'}{'fr310xt'} = $types->{'garmin_product'}{'values'}{'1018'};
$types->{'garmin_product'}{'values'}{'fr405'} = $types->{'garmin_product'}{'values'}{'717'};
$types->{'garmin_product'}{'values'}{'fr50'} = $types->{'garmin_product'}{'values'}{'782'};
$types->{'garmin_product'}{'values'}{'fr60'} = $types->{'garmin_product'}{'values'}{'988'};
$types->{'garmin_product'}{'values'}{'hrm1'} = $types->{'garmin_product'}{'values'}{'1'};
$types->{'garmin_product'}{'values'}{'hrm2ss'} = $types->{'garmin_product'}{'values'}{'5'};
$types->{'garmin_product'}{'values'}{'sdm4'} = $types->{'garmin_product'}{'values'}{'10007'};
$types->{'garmin_product'}{'values'}{'training_center'} = $types->{'garmin_product'}{'values'}{'20119'};
$types->{'gender'}{'base_type'} = $base_types->{'0'};
$types->{'gender'}{'values'}{'female'} = $types->{'gender'}{'values'}{'0'};
$types->{'gender'}{'values'}{'male'} = $types->{'gender'}{'values'}{'1'};
$types->{'goal'}{'base_type'} = $base_types->{'0'};
$types->{'goal'}{'values'}{'calories'} = $types->{'goal'}{'values'}{'2'};
$types->{'goal'}{'values'}{'distance'} = $types->{'goal'}{'values'}{'1'};
$types->{'goal'}{'values'}{'frequency'} = $types->{'goal'}{'values'}{'3'};
$types->{'goal'}{'values'}{'steps'} = $types->{'goal'}{'values'}{'4'};
$types->{'goal'}{'values'}{'time'} = $types->{'goal'}{'values'}{'0'};
$types->{'goal_recurrence'}{'base_type'} = $base_types->{'0'};
$types->{'goal_recurrence'}{'values'}{'custom'} = $types->{'goal_recurrence'}{'values'}{'5'};
$types->{'goal_recurrence'}{'values'}{'daily'} = $types->{'goal_recurrence'}{'values'}{'1'};
$types->{'goal_recurrence'}{'values'}{'monthly'} = $types->{'goal_recurrence'}{'values'}{'3'};
$types->{'goal_recurrence'}{'values'}{'off'} = $types->{'goal_recurrence'}{'values'}{'0'};
$types->{'goal_recurrence'}{'values'}{'weekly'} = $types->{'goal_recurrence'}{'values'}{'2'};
$types->{'goal_recurrence'}{'values'}{'yearly'} = $types->{'goal_recurrence'}{'values'}{'4'};
$types->{'hr_type'}{'base_type'} = $base_types->{'0'};
$types->{'hr_type'}{'values'}{'irregular'} = $types->{'hr_type'}{'values'}{'1'};
$types->{'hr_type'}{'values'}{'normal'} = $types->{'hr_type'}{'values'}{'0'};
$types->{'hr_zone_calc'}{'base_type'} = $base_types->{'0'};
$types->{'hr_zone_calc'}{'values'}{'custom'} = $types->{'hr_zone_calc'}{'values'}{'0'};
$types->{'hr_zone_calc'}{'values'}{'percent_hrr'} = $types->{'hr_zone_calc'}{'values'}{'2'};
$types->{'hr_zone_calc'}{'values'}{'percent_max_hr'} = $types->{'hr_zone_calc'}{'values'}{'1'};
$types->{'intensity'}{'base_type'} = $base_types->{'0'};
$types->{'intensity'}{'values'}{'active'} = $types->{'intensity'}{'values'}{'0'};
$types->{'intensity'}{'values'}{'cooldown'} = $types->{'intensity'}{'values'}{'3'};
$types->{'intensity'}{'values'}{'rest'} = $types->{'intensity'}{'values'}{'1'};
$types->{'intensity'}{'values'}{'warmup'} = $types->{'intensity'}{'values'}{'2'};
$types->{'language'}{'base_type'} = $base_types->{'0'};
$types->{'language'}{'values'}{'arabic'} = $types->{'language'}{'values'}{'22'};
$types->{'language'}{'values'}{'bulgarian'} = $types->{'language'}{'values'}{'24'};
$types->{'language'}{'values'}{'croatian'} = $types->{'language'}{'values'}{'5'};
$types->{'language'}{'values'}{'custom'} = $types->{'language'}{'values'}{'254'};
$types->{'language'}{'values'}{'czech'} = $types->{'language'}{'values'}{'6'};
$types->{'language'}{'values'}{'danish'} = $types->{'language'}{'values'}{'7'};
$types->{'language'}{'values'}{'dutch'} = $types->{'language'}{'values'}{'8'};
$types->{'language'}{'values'}{'english'} = $types->{'language'}{'values'}{'0'};
$types->{'language'}{'values'}{'farsi'} = $types->{'language'}{'values'}{'23'};
$types->{'language'}{'values'}{'finnish'} = $types->{'language'}{'values'}{'9'};
$types->{'language'}{'values'}{'french'} = $types->{'language'}{'values'}{'1'};
$types->{'language'}{'values'}{'german'} = $types->{'language'}{'values'}{'3'};
$types->{'language'}{'values'}{'greek'} = $types->{'language'}{'values'}{'10'};
$types->{'language'}{'values'}{'hungarian'} = $types->{'language'}{'values'}{'11'};
$types->{'language'}{'values'}{'italian'} = $types->{'language'}{'values'}{'2'};
$types->{'language'}{'values'}{'latvian'} = $types->{'language'}{'values'}{'20'};
$types->{'language'}{'values'}{'norwegian'} = $types->{'language'}{'values'}{'12'};
$types->{'language'}{'values'}{'polish'} = $types->{'language'}{'values'}{'13'};
$types->{'language'}{'values'}{'portuguese'} = $types->{'language'}{'values'}{'14'};
$types->{'language'}{'values'}{'romanian'} = $types->{'language'}{'values'}{'25'};
$types->{'language'}{'values'}{'russian'} = $types->{'language'}{'values'}{'18'};
$types->{'language'}{'values'}{'slovakian'} = $types->{'language'}{'values'}{'15'};
$types->{'language'}{'values'}{'slovenian'} = $types->{'language'}{'values'}{'16'};
$types->{'language'}{'values'}{'spanish'} = $types->{'language'}{'values'}{'4'};
$types->{'language'}{'values'}{'swedish'} = $types->{'language'}{'values'}{'17'};
$types->{'language'}{'values'}{'turkish'} = $types->{'language'}{'values'}{'19'};
$types->{'language'}{'values'}{'ukrainian'} = $types->{'language'}{'values'}{'21'};
$types->{'lap_trigger'}{'base_type'} = $base_types->{'0'};
$types->{'lap_trigger'}{'values'}{'distance'} = $types->{'lap_trigger'}{'values'}{'2'};
$types->{'lap_trigger'}{'values'}{'fitness_equipment'} = $types->{'lap_trigger'}{'values'}{'8'};
$types->{'lap_trigger'}{'values'}{'manual'} = $types->{'lap_trigger'}{'values'}{'0'};
$types->{'lap_trigger'}{'values'}{'position_lap'} = $types->{'lap_trigger'}{'values'}{'4'};
$types->{'lap_trigger'}{'values'}{'position_marked'} = $types->{'lap_trigger'}{'values'}{'6'};
$types->{'lap_trigger'}{'values'}{'position_start'} = $types->{'lap_trigger'}{'values'}{'3'};
$types->{'lap_trigger'}{'values'}{'position_waypoint'} = $types->{'lap_trigger'}{'values'}{'5'};
$types->{'lap_trigger'}{'values'}{'session_end'} = $types->{'lap_trigger'}{'values'}{'7'};
$types->{'lap_trigger'}{'values'}{'time'} = $types->{'lap_trigger'}{'values'}{'1'};
$types->{'local_date_time'}{'base_type'} = $base_types->{'134'};
$types->{'manufacturer'}{'base_type'} = $base_types->{'132'};
$types->{'manufacturer'}{'values'}{'a_and_d'} = $types->{'manufacturer'}{'values'}{'21'};
$types->{'manufacturer'}{'values'}{'beurer'} = $types->{'manufacturer'}{'values'}{'19'};
$types->{'manufacturer'}{'values'}{'cardiosport'} = $types->{'manufacturer'}{'values'}{'20'};
$types->{'manufacturer'}{'values'}{'clean_mobile'} = $types->{'manufacturer'}{'values'}{'26'};
$types->{'manufacturer'}{'values'}{'dayton'} = $types->{'manufacturer'}{'values'}{'4'};
$types->{'manufacturer'}{'values'}{'dexcom'} = $types->{'manufacturer'}{'values'}{'31'};
$types->{'manufacturer'}{'values'}{'dynastream'} = $types->{'manufacturer'}{'values'}{'15'};
$types->{'manufacturer'}{'values'}{'dynastream_oem'} = $types->{'manufacturer'}{'values'}{'13'};
$types->{'manufacturer'}{'values'}{'echowell'} = $types->{'manufacturer'}{'values'}{'12'};
$types->{'manufacturer'}{'values'}{'garmin'} = $types->{'manufacturer'}{'values'}{'1'};
$types->{'manufacturer'}{'values'}{'garmin_fr405_antfs'} = $types->{'manufacturer'}{'values'}{'2'};
$types->{'manufacturer'}{'values'}{'gpulse'} = $types->{'manufacturer'}{'values'}{'25'};
$types->{'manufacturer'}{'values'}{'hmm'} = $types->{'manufacturer'}{'values'}{'22'};
$types->{'manufacturer'}{'values'}{'ibike'} = $types->{'manufacturer'}{'values'}{'8'};
$types->{'manufacturer'}{'values'}{'idt'} = $types->{'manufacturer'}{'values'}{'5'};
$types->{'manufacturer'}{'values'}{'lemond_fitness'} = $types->{'manufacturer'}{'values'}{'30'};
$types->{'manufacturer'}{'values'}{'metrigear'} = $types->{'manufacturer'}{'values'}{'17'};
$types->{'manufacturer'}{'values'}{'nautilus'} = $types->{'manufacturer'}{'values'}{'14'};
$types->{'manufacturer'}{'values'}{'octane_fitness'} = $types->{'manufacturer'}{'values'}{'33'};
$types->{'manufacturer'}{'values'}{'peaksware'} = $types->{'manufacturer'}{'values'}{'28'};
$types->{'manufacturer'}{'values'}{'pedal_brain'} = $types->{'manufacturer'}{'values'}{'27'};
$types->{'manufacturer'}{'values'}{'quarq'} = $types->{'manufacturer'}{'values'}{'7'};
$types->{'manufacturer'}{'values'}{'saris'} = $types->{'manufacturer'}{'values'}{'9'};
$types->{'manufacturer'}{'values'}{'saxonar'} = $types->{'manufacturer'}{'values'}{'29'};
$types->{'manufacturer'}{'values'}{'spark_hk'} = $types->{'manufacturer'}{'values'}{'10'};
$types->{'manufacturer'}{'values'}{'srm'} = $types->{'manufacturer'}{'values'}{'6'};
$types->{'manufacturer'}{'values'}{'suunto'} = $types->{'manufacturer'}{'values'}{'23'};
$types->{'manufacturer'}{'values'}{'tanita'} = $types->{'manufacturer'}{'values'}{'11'};
$types->{'manufacturer'}{'values'}{'thita_elektronik'} = $types->{'manufacturer'}{'values'}{'24'};
$types->{'manufacturer'}{'values'}{'timex'} = $types->{'manufacturer'}{'values'}{'16'};
$types->{'manufacturer'}{'values'}{'wahoo_fitness'} = $types->{'manufacturer'}{'values'}{'32'};
$types->{'manufacturer'}{'values'}{'xelic'} = $types->{'manufacturer'}{'values'}{'18'};
$types->{'manufacturer'}{'values'}{'zephyr'} = $types->{'manufacturer'}{'values'}{'3'};
$types->{'mesg_count'}{'base_type'} = $base_types->{'0'};
$types->{'mesg_count'}{'values'}{'max_per_file'} = $types->{'mesg_count'}{'values'}{'1'};
$types->{'mesg_count'}{'values'}{'max_per_file_type'} = $types->{'mesg_count'}{'values'}{'2'};
$types->{'mesg_count'}{'values'}{'num_per_file'} = $types->{'mesg_count'}{'values'}{'0'};
$types->{'mesg_num'}{'base_type'} = $base_types->{'132'};
$types->{'mesg_num'}{'values'}{'activity'} = $types->{'mesg_num'}{'values'}{'34'};
$types->{'mesg_num'}{'values'}{'bike_profile'} = $types->{'mesg_num'}{'values'}{'6'};
$types->{'mesg_num'}{'values'}{'blood_pressure'} = $types->{'mesg_num'}{'values'}{'51'};
$types->{'mesg_num'}{'values'}{'capabilities'} = $types->{'mesg_num'}{'values'}{'1'};
$types->{'mesg_num'}{'values'}{'course'} = $types->{'mesg_num'}{'values'}{'31'};
$types->{'mesg_num'}{'values'}{'course_point'} = $types->{'mesg_num'}{'values'}{'32'};
$types->{'mesg_num'}{'values'}{'device_info'} = $types->{'mesg_num'}{'values'}{'23'};
$types->{'mesg_num'}{'values'}{'device_settings'} = $types->{'mesg_num'}{'values'}{'2'};
$types->{'mesg_num'}{'values'}{'event'} = $types->{'mesg_num'}{'values'}{'21'};
$types->{'mesg_num'}{'values'}{'field_capabilities'} = $types->{'mesg_num'}{'values'}{'39'};
$types->{'mesg_num'}{'values'}{'file_capabilities'} = $types->{'mesg_num'}{'values'}{'37'};
$types->{'mesg_num'}{'values'}{'file_creator'} = $types->{'mesg_num'}{'values'}{'49'};
$types->{'mesg_num'}{'values'}{'file_id'} = $types->{'mesg_num'}{'values'}{'0'};
$types->{'mesg_num'}{'values'}{'goal'} = $types->{'mesg_num'}{'values'}{'15'};
$types->{'mesg_num'}{'values'}{'hr_zone'} = $types->{'mesg_num'}{'values'}{'8'};
$types->{'mesg_num'}{'values'}{'hrm_profile'} = $types->{'mesg_num'}{'values'}{'4'};
$types->{'mesg_num'}{'values'}{'lap'} = $types->{'mesg_num'}{'values'}{'19'};
$types->{'mesg_num'}{'values'}{'mesg_capabilities'} = $types->{'mesg_num'}{'values'}{'38'};
$types->{'mesg_num'}{'values'}{'met_zone'} = $types->{'mesg_num'}{'values'}{'10'};
$types->{'mesg_num'}{'values'}{'mfg_range_max'} = $types->{'mesg_num'}{'values'}{'65534'};
$types->{'mesg_num'}{'values'}{'mfg_range_min'} = $types->{'mesg_num'}{'values'}{'65280'};
$types->{'mesg_num'}{'values'}{'power_zone'} = $types->{'mesg_num'}{'values'}{'9'};
$types->{'mesg_num'}{'values'}{'record'} = $types->{'mesg_num'}{'values'}{'20'};
$types->{'mesg_num'}{'values'}{'sdm_profile'} = $types->{'mesg_num'}{'values'}{'5'};
$types->{'mesg_num'}{'values'}{'session'} = $types->{'mesg_num'}{'values'}{'18'};
$types->{'mesg_num'}{'values'}{'software'} = $types->{'mesg_num'}{'values'}{'35'};
$types->{'mesg_num'}{'values'}{'sport'} = $types->{'mesg_num'}{'values'}{'12'};
$types->{'mesg_num'}{'values'}{'totals'} = $types->{'mesg_num'}{'values'}{'33'};
$types->{'mesg_num'}{'values'}{'user_profile'} = $types->{'mesg_num'}{'values'}{'3'};
$types->{'mesg_num'}{'values'}{'weight_scale'} = $types->{'mesg_num'}{'values'}{'30'};
$types->{'mesg_num'}{'values'}{'workout'} = $types->{'mesg_num'}{'values'}{'26'};
$types->{'mesg_num'}{'values'}{'workout_step'} = $types->{'mesg_num'}{'values'}{'27'};
$types->{'mesg_num'}{'values'}{'zones_target'} = $types->{'mesg_num'}{'values'}{'7'};
$types->{'message_index'}{'base_type'} = $base_types->{'132'};
$types->{'message_index'}{'values'}{'mask'} = $types->{'message_index'}{'values'}{'4095'};
$types->{'message_index'}{'values'}{'reserved'} = $types->{'message_index'}{'values'}{'28672'};
$types->{'message_index'}{'values'}{'selected'} = $types->{'message_index'}{'values'}{'32768'};
$types->{'pwr_zone_calc'}{'base_type'} = $base_types->{'0'};
$types->{'pwr_zone_calc'}{'values'}{'custom'} = $types->{'pwr_zone_calc'}{'values'}{'0'};
$types->{'pwr_zone_calc'}{'values'}{'percent_ftp'} = $types->{'pwr_zone_calc'}{'values'}{'1'};
$types->{'session_trigger'}{'base_type'} = $base_types->{'0'};
$types->{'session_trigger'}{'values'}{'activity_end'} = $types->{'session_trigger'}{'values'}{'0'};
$types->{'session_trigger'}{'values'}{'auto_multi_sport'} = $types->{'session_trigger'}{'values'}{'2'};
$types->{'session_trigger'}{'values'}{'fitness_equipment'} = $types->{'session_trigger'}{'values'}{'3'};
$types->{'session_trigger'}{'values'}{'manual'} = $types->{'session_trigger'}{'values'}{'1'};
$types->{'sint16'}{'base_type'} = $base_types->{'131'};
$types->{'sint32'}{'base_type'} = $base_types->{'133'};
$types->{'sint8'}{'base_type'} = $base_types->{'1'};
$types->{'sport'}{'base_type'} = $base_types->{'0'};
$types->{'sport'}{'values'}{'all'} = $types->{'sport'}{'values'}{'254'};
$types->{'sport'}{'values'}{'cycling'} = $types->{'sport'}{'values'}{'2'};
$types->{'sport'}{'values'}{'fitness_equipment'} = $types->{'sport'}{'values'}{'4'};
$types->{'sport'}{'values'}{'generic'} = $types->{'sport'}{'values'}{'0'};
$types->{'sport'}{'values'}{'running'} = $types->{'sport'}{'values'}{'1'};
$types->{'sport'}{'values'}{'swimming'} = $types->{'sport'}{'values'}{'5'};
$types->{'sport'}{'values'}{'transition'} = $types->{'sport'}{'values'}{'3'};
$types->{'sport_bits_0'}{'base_type'} = $base_types->{'10'};
$types->{'sport_bits_0'}{'values'}{'cycling'} = $types->{'sport_bits_0'}{'values'}{'4'};
$types->{'sport_bits_0'}{'values'}{'fitness_equipment'} = $types->{'sport_bits_0'}{'values'}{'16'};
$types->{'sport_bits_0'}{'values'}{'generic'} = $types->{'sport_bits_0'}{'values'}{'1'};
$types->{'sport_bits_0'}{'values'}{'running'} = $types->{'sport_bits_0'}{'values'}{'2'};
$types->{'sport_bits_0'}{'values'}{'swimming'} = $types->{'sport_bits_0'}{'values'}{'32'};
$types->{'sport_bits_0'}{'values'}{'transition'} = $types->{'sport_bits_0'}{'values'}{'8'};
$types->{'string'}{'base_type'} = $base_types->{'7'};
$types->{'sub_sport'}{'base_type'} = $base_types->{'0'};
$types->{'sub_sport'}{'values'}{'all'} = $types->{'sub_sport'}{'values'}{'254'};
$types->{'sub_sport'}{'values'}{'cyclocross'} = $types->{'sub_sport'}{'values'}{'11'};
$types->{'sub_sport'}{'values'}{'downhill'} = $types->{'sub_sport'}{'values'}{'9'};
$types->{'sub_sport'}{'values'}{'elliptical'} = $types->{'sub_sport'}{'values'}{'15'};
$types->{'sub_sport'}{'values'}{'generic'} = $types->{'sub_sport'}{'values'}{'0'};
$types->{'sub_sport'}{'values'}{'hand_cycling'} = $types->{'sub_sport'}{'values'}{'12'};
$types->{'sub_sport'}{'values'}{'indoor_cycling'} = $types->{'sub_sport'}{'values'}{'6'};
$types->{'sub_sport'}{'values'}{'indoor_rowing'} = $types->{'sub_sport'}{'values'}{'14'};
$types->{'sub_sport'}{'values'}{'lap_swimming'} = $types->{'sub_sport'}{'values'}{'17'};
$types->{'sub_sport'}{'values'}{'mountain'} = $types->{'sub_sport'}{'values'}{'8'};
$types->{'sub_sport'}{'values'}{'open_water'} = $types->{'sub_sport'}{'values'}{'18'};
$types->{'sub_sport'}{'values'}{'recumbent'} = $types->{'sub_sport'}{'values'}{'10'};
$types->{'sub_sport'}{'values'}{'road'} = $types->{'sub_sport'}{'values'}{'7'};
$types->{'sub_sport'}{'values'}{'spin'} = $types->{'sub_sport'}{'values'}{'5'};
$types->{'sub_sport'}{'values'}{'stair_climbing'} = $types->{'sub_sport'}{'values'}{'16'};
$types->{'sub_sport'}{'values'}{'street'} = $types->{'sub_sport'}{'values'}{'2'};
$types->{'sub_sport'}{'values'}{'track'} = $types->{'sub_sport'}{'values'}{'4'};
$types->{'sub_sport'}{'values'}{'track_cycling'} = $types->{'sub_sport'}{'values'}{'13'};
$types->{'sub_sport'}{'values'}{'trail'} = $types->{'sub_sport'}{'values'}{'3'};
$types->{'sub_sport'}{'values'}{'treadmill'} = $types->{'sub_sport'}{'values'}{'1'};
$types->{'timer_trigger'}{'base_type'} = $base_types->{'0'};
$types->{'timer_trigger'}{'values'}{'auto'} = $types->{'timer_trigger'}{'values'}{'1'};
$types->{'timer_trigger'}{'values'}{'fitness_equipment'} = $types->{'timer_trigger'}{'values'}{'2'};
$types->{'timer_trigger'}{'values'}{'manual'} = $types->{'timer_trigger'}{'values'}{'0'};
$types->{'uint16'}{'base_type'} = $base_types->{'132'};
$types->{'uint16z'}{'base_type'} = $base_types->{'139'};
$types->{'uint32'}{'base_type'} = $base_types->{'134'};
$types->{'uint32z'}{'base_type'} = $base_types->{'140'};
$types->{'uint8'}{'base_type'} = $base_types->{'2'};
$types->{'uint8z'}{'base_type'} = $base_types->{'10'};
$types->{'user_local_id'}{'base_type'} = $base_types->{'132'};
$types->{'user_local_id'}{'values'}{'local_max'} = $types->{'user_local_id'}{'values'}{'15'};
$types->{'user_local_id'}{'values'}{'local_min'} = $types->{'user_local_id'}{'values'}{'1'};
$types->{'user_local_id'}{'values'}{'portable_max'} = $types->{'user_local_id'}{'values'}{'65534'};
$types->{'user_local_id'}{'values'}{'portable_min'} = $types->{'user_local_id'}{'values'}{'256'};
$types->{'user_local_id'}{'values'}{'stationary_max'} = $types->{'user_local_id'}{'values'}{'255'};
$types->{'user_local_id'}{'values'}{'stationary_min'} = $types->{'user_local_id'}{'values'}{'16'};
$types->{'weight'}{'base_type'} = $base_types->{'132'};
$types->{'weight'}{'values'}{'calculating'} = $types->{'weight'}{'values'}{'65534'};
$types->{'wkt_step_duration'}{'base_type'} = $base_types->{'0'};
$types->{'wkt_step_duration'}{'values'}{'calories'} = $types->{'wkt_step_duration'}{'values'}{'4'};
$types->{'wkt_step_duration'}{'values'}{'distance'} = $types->{'wkt_step_duration'}{'values'}{'1'};
$types->{'wkt_step_duration'}{'values'}{'hr_greater_than'} = $types->{'wkt_step_duration'}{'values'}{'3'};
$types->{'wkt_step_duration'}{'values'}{'hr_less_than'} = $types->{'wkt_step_duration'}{'values'}{'2'};
$types->{'wkt_step_duration'}{'values'}{'open'} = $types->{'wkt_step_duration'}{'values'}{'5'};
$types->{'wkt_step_duration'}{'values'}{'power_greater_than'} = $types->{'wkt_step_duration'}{'values'}{'15'};
$types->{'wkt_step_duration'}{'values'}{'power_less_than'} = $types->{'wkt_step_duration'}{'values'}{'14'};
$types->{'wkt_step_duration'}{'values'}{'repeat_until_calories'} = $types->{'wkt_step_duration'}{'values'}{'9'};
$types->{'wkt_step_duration'}{'values'}{'repeat_until_distance'} = $types->{'wkt_step_duration'}{'values'}{'8'};
$types->{'wkt_step_duration'}{'values'}{'repeat_until_hr_greater_than'} = $types->{'wkt_step_duration'}{'values'}{'11'};
$types->{'wkt_step_duration'}{'values'}{'repeat_until_hr_less_than'} = $types->{'wkt_step_duration'}{'values'}{'10'};
$types->{'wkt_step_duration'}{'values'}{'repeat_until_power_greater_than'} = $types->{'wkt_step_duration'}{'values'}{'13'};
$types->{'wkt_step_duration'}{'values'}{'repeat_until_power_less_than'} = $types->{'wkt_step_duration'}{'values'}{'12'};
$types->{'wkt_step_duration'}{'values'}{'repeat_until_steps_cmplt'} = $types->{'wkt_step_duration'}{'values'}{'6'};
$types->{'wkt_step_duration'}{'values'}{'repeat_until_time'} = $types->{'wkt_step_duration'}{'values'}{'7'};
$types->{'wkt_step_duration'}{'values'}{'time'} = $types->{'wkt_step_duration'}{'values'}{'0'};
$types->{'wkt_step_target'}{'base_type'} = $base_types->{'0'};
$types->{'wkt_step_target'}{'values'}{'cadence'} = $types->{'wkt_step_target'}{'values'}{'3'};
$types->{'wkt_step_target'}{'values'}{'grade'} = $types->{'wkt_step_target'}{'values'}{'5'};
$types->{'wkt_step_target'}{'values'}{'heart_rate'} = $types->{'wkt_step_target'}{'values'}{'1'};
$types->{'wkt_step_target'}{'values'}{'open'} = $types->{'wkt_step_target'}{'values'}{'2'};
$types->{'wkt_step_target'}{'values'}{'power'} = $types->{'wkt_step_target'}{'values'}{'4'};
$types->{'wkt_step_target'}{'values'}{'resistance'} = $types->{'wkt_step_target'}{'values'}{'6'};
$types->{'wkt_step_target'}{'values'}{'speed'} = $types->{'wkt_step_target'}{'values'}{'0'};
$types->{'workout_capabilities'}{'base_type'} = $base_types->{'140'};
$types->{'workout_capabilities'}{'values'}{'cadence'} = $types->{'workout_capabilities'}{'values'}{'1024'};
$types->{'workout_capabilities'}{'values'}{'custom'} = $types->{'workout_capabilities'}{'values'}{'2'};
$types->{'workout_capabilities'}{'values'}{'distance'} = $types->{'workout_capabilities'}{'values'}{'512'};
$types->{'workout_capabilities'}{'values'}{'firstbeat'} = $types->{'workout_capabilities'}{'values'}{'8'};
$types->{'workout_capabilities'}{'values'}{'fitness_equipment'} = $types->{'workout_capabilities'}{'values'}{'4'};
$types->{'workout_capabilities'}{'values'}{'grade'} = $types->{'workout_capabilities'}{'values'}{'4096'};
$types->{'workout_capabilities'}{'values'}{'heart_rate'} = $types->{'workout_capabilities'}{'values'}{'256'};
$types->{'workout_capabilities'}{'values'}{'interval'} = $types->{'workout_capabilities'}{'values'}{'1'};
$types->{'workout_capabilities'}{'values'}{'new_leaf'} = $types->{'workout_capabilities'}{'values'}{'16'};
$types->{'workout_capabilities'}{'values'}{'power'} = $types->{'workout_capabilities'}{'values'}{'2048'};
$types->{'workout_capabilities'}{'values'}{'protected'} = $types->{'workout_capabilities'}{'values'}{'16384'};
$types->{'workout_capabilities'}{'values'}{'resistance'} = $types->{'workout_capabilities'}{'values'}{'8192'};
$types->{'workout_capabilities'}{'values'}{'speed'} = $types->{'workout_capabilities'}{'values'}{'128'};
$types->{'workout_capabilities'}{'values'}{'tcx'} = $types->{'workout_capabilities'}{'values'}{'32'};
$types->{'workout_hr'}{'base_type'} = $base_types->{'134'};
$types->{'workout_hr'}{'values'}{'bpm_offset'} = $types->{'workout_hr'}{'values'}{'100'};
$types->{'workout_power'}{'base_type'} = $base_types->{'134'};
$types->{'workout_power'}{'values'}{'watts_offset'} = $types->{'workout_power'}{'values'}{'1000'};
$profile = {
  '0' => bless( {
    'comment' => 'Must be first message in file.',
    'context' => 'COMMON MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'type',
        'name' => 'type',
        'number' => 0,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'manufacturer',
        'name' => 'manufacturer',
        'number' => 1,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'product',
        'name' => 'product',
        'number' => 2,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'serial_number',
        'name' => 'serial_number',
        'number' => 3,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'time_created',
        'name' => 'time_created',
        'number' => 4,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'number',
        'name' => 'number',
        'number' => 5,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'manufacturer' => {},
      'number' => {},
      'product' => {},
      'serial_number' => {},
      'time_created' => {},
      'type' => {}
    },
    'name' => 'file_id',
    'number' => 0
  }, 'Garmin::FIT::Streamer::Message' ),
  '1' => bless( {
    'context' => 'DEVICE FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'array' => 'N',
        'id' => 'languages',
        'name' => 'languages',
        'number' => 0,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'array' => 'N',
        'id' => 'sports',
        'name' => 'sports',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '21' => bless( {
        'id' => 'workouts_supported',
        'name' => 'workouts_supported',
        'number' => 21,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'languages' => {},
      'sports' => {},
      'workouts_supported' => {}
    },
    'name' => 'capabilities',
    'number' => 1
  }, 'Garmin::FIT::Streamer::Message' ),
  '10' => bless( {
    'context' => 'SPORT SETTINGS FILE MESSAGES',
    'fields' => {
      '1' => bless( {
        'id' => 'high_bpm',
        'name' => 'high_bpm',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'calories',
        'name' => 'calories',
        'number' => 2,
        'scale' => [
          10,	# 000a
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'kcal/min'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'fat_calories',
        'name' => 'fat_calories',
        'number' => 3,
        'scale' => [
          10,	# 000a
        ],
        'size' => 1,
        'type' => {},
        'unit' => [
          'kcal/min'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      'calories' => {},
      'fat_calories' => {},
      'high_bpm' => {},
      'message_index' => {}
    },
    'name' => 'met_zone',
    'number' => 10
  }, 'Garmin::FIT::Streamer::Message' ),
  '12' => bless( {
    'context' => 'SPORT SETTINGS FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'sport',
        'name' => 'sport',
        'number' => 0,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'sub_sport',
        'name' => 'sub_sport',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'name',
        'name' => 'name',
        'number' => 3,
        'size' => 0,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'name' => {},
      'sport' => {},
      'sub_sport' => {}
    },
    'name' => 'sport',
    'number' => 12
  }, 'Garmin::FIT::Streamer::Message' ),
  '15' => bless( {
    'context' => 'GOALS FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'sport',
        'name' => 'sport',
        'number' => 0,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'sub_sport',
        'name' => 'sub_sport',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '10' => bless( {
        'id' => 'enabled',
        'name' => 'enabled',
        'number' => 10,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'start_date',
        'name' => 'start_date',
        'number' => 2,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'end_date',
        'name' => 'end_date',
        'number' => 3,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'type',
        'name' => 'type',
        'number' => 4,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'value',
        'name' => 'value',
        'number' => 5,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '6' => bless( {
        'id' => 'repeat',
        'name' => 'repeat',
        'number' => 6,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '7' => bless( {
        'id' => 'target_value',
        'name' => 'target_value',
        'number' => 7,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '8' => bless( {
        'id' => 'recurrence',
        'name' => 'recurrence',
        'number' => 8,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '9' => bless( {
        'id' => 'recurrence_value',
        'name' => 'recurrence_value',
        'number' => 9,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'enabled' => {},
      'end_date' => {},
      'message_index' => {},
      'recurrence' => {},
      'recurrence_value' => {},
      'repeat' => {},
      'sport' => {},
      'start_date' => {},
      'sub_sport' => {},
      'target_value' => {},
      'type' => {},
      'value' => {}
    },
    'name' => 'goal',
    'number' => 15
  }, 'Garmin::FIT::Streamer::Message' ),
  '18' => bless( {
    'context' => 'ACTIVITY FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'event',
        'name' => 'event',
        'number' => 0,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'event_type',
        'name' => 'event_type',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '10' => bless( {
        'id' => 'total_cycles',
        'name' => 'total_cycles',
        'number' => 10,
        'size' => 4,
        'type' => {},
        'unit' => [
          'cycles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '11' => bless( {
        'id' => 'total_calories',
        'name' => 'total_calories',
        'number' => 11,
        'size' => 2,
        'type' => {},
        'unit' => [
          'kcal'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '13' => bless( {
        'id' => 'total_fat_calories',
        'name' => 'total_fat_calories',
        'number' => 13,
        'size' => 2,
        'type' => {},
        'unit' => [
          'kcal'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '14' => bless( {
        'id' => 'avg_speed',
        'name' => 'avg_speed',
        'number' => 14,
        'scale' => [
          1000,	# 03e8
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'm/s'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '15' => bless( {
        'id' => 'max_speed',
        'name' => 'max_speed',
        'number' => 15,
        'scale' => [
          1000,	# 03e8
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'm/s'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '16' => bless( {
        'id' => 'avg_heart_rate',
        'name' => 'avg_heart_rate',
        'number' => 16,
        'size' => 1,
        'type' => {},
        'unit' => [
          'bpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '17' => bless( {
        'id' => 'max_heart_rate',
        'name' => 'max_heart_rate',
        'number' => 17,
        'size' => 1,
        'type' => {},
        'unit' => [
          'bpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '18' => bless( {
        'id' => 'avg_cadence',
        'name' => 'avg_cadence',
        'number' => 18,
        'size' => 1,
        'type' => {},
        'unit' => [
          'rpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '19' => bless( {
        'id' => 'max_cadence',
        'name' => 'max_cadence',
        'number' => 19,
        'size' => 1,
        'type' => {},
        'unit' => [
          'rpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'start_time',
        'name' => 'start_time',
        'number' => 2,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '20' => bless( {
        'id' => 'avg_power',
        'name' => 'avg_power',
        'number' => 20,
        'size' => 2,
        'type' => {},
        'unit' => [
          'watts'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '21' => bless( {
        'id' => 'max_power',
        'name' => 'max_power',
        'number' => 21,
        'size' => 2,
        'type' => {},
        'unit' => [
          'watts'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '22' => bless( {
        'id' => 'total_ascent',
        'name' => 'total_ascent',
        'number' => 22,
        'size' => 2,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '23' => bless( {
        'id' => 'total_descent',
        'name' => 'total_descent',
        'number' => 23,
        'size' => 2,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '24' => bless( {
        'id' => 'total_training_effect',
        'name' => 'total_training_effect',
        'number' => 24,
        'scale' => [
          10,	# 000a
        ],
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '25' => bless( {
        'id' => 'first_lap_index',
        'name' => 'first_lap_index',
        'number' => 25,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '253' => bless( {
        'id' => 'timestamp',
        'name' => 'timestamp',
        'number' => 253,
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '26' => bless( {
        'id' => 'num_laps',
        'name' => 'num_laps',
        'number' => 26,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '27' => bless( {
        'id' => 'event_group',
        'name' => 'event_group',
        'number' => 27,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '28' => bless( {
        'id' => 'trigger',
        'name' => 'trigger',
        'number' => 28,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '29' => bless( {
        'id' => 'nec_lat',
        'name' => 'nec_lat',
        'number' => 29,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'start_position_lat',
        'name' => 'start_position_lat',
        'number' => 3,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '30' => bless( {
        'id' => 'nec_long',
        'name' => 'nec_long',
        'number' => 30,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '31' => bless( {
        'id' => 'swc_lat',
        'name' => 'swc_lat',
        'number' => 31,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '32' => bless( {
        'id' => 'swc_long',
        'name' => 'swc_long',
        'number' => 32,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'start_position_long',
        'name' => 'start_position_long',
        'number' => 4,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'sport',
        'name' => 'sport',
        'number' => 5,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '6' => bless( {
        'id' => 'sub_sport',
        'name' => 'sub_sport',
        'number' => 6,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '7' => bless( {
        'id' => 'total_elapsed_time',
        'name' => 'total_elapsed_time',
        'number' => 7,
        'scale' => [
          1000,	# 03e8
        ],
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '8' => bless( {
        'id' => 'total_timer_time',
        'name' => 'total_timer_time',
        'number' => 8,
        'scale' => [
          1000,	# 03e8
        ],
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '9' => bless( {
        'id' => 'total_distance',
        'name' => 'total_distance',
        'number' => 9,
        'scale' => [
          100,	# 0064
        ],
        'size' => 4,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      'avg_cadence' => {},
      'avg_heart_rate' => {},
      'avg_power' => {},
      'avg_speed' => {},
      'event' => {},
      'event_group' => {},
      'event_type' => {},
      'first_lap_index' => {},
      'max_cadence' => {},
      'max_heart_rate' => {},
      'max_power' => {},
      'max_speed' => {},
      'message_index' => {},
      'nec_lat' => {},
      'nec_long' => {},
      'num_laps' => {},
      'sport' => {},
      'start_position_lat' => {},
      'start_position_long' => {},
      'start_time' => {},
      'sub_sport' => {},
      'swc_lat' => {},
      'swc_long' => {},
      'timestamp' => {},
      'total_ascent' => {},
      'total_calories' => {},
      'total_cycles' => {},
      'total_descent' => {},
      'total_distance' => {},
      'total_elapsed_time' => {},
      'total_fat_calories' => {},
      'total_timer_time' => {},
      'total_training_effect' => {},
      'trigger' => {}
    },
    'name' => 'session',
    'number' => 18
  }, 'Garmin::FIT::Streamer::Message' ),
  '19' => bless( {
    'context' => 'ACTIVITY FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'event',
        'name' => 'event',
        'number' => 0,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'event_type',
        'name' => 'event_type',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '10' => bless( {
        'id' => 'total_cycles',
        'name' => 'total_cycles',
        'number' => 10,
        'size' => 4,
        'type' => {},
        'unit' => [
          'cycles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '11' => bless( {
        'id' => 'total_calories',
        'name' => 'total_calories',
        'number' => 11,
        'size' => 2,
        'type' => {},
        'unit' => [
          'kcal'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '12' => bless( {
        'id' => 'total_fat_calories',
        'name' => 'total_fat_calories',
        'number' => 12,
        'size' => 2,
        'type' => {},
        'unit' => [
          'kcal'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '13' => bless( {
        'id' => 'avg_speed',
        'name' => 'avg_speed',
        'number' => 13,
        'scale' => [
          1000,	# 03e8
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'm/s'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '14' => bless( {
        'id' => 'max_speed',
        'name' => 'max_speed',
        'number' => 14,
        'scale' => [
          1000,	# 03e8
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'm/s'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '15' => bless( {
        'id' => 'avg_heart_rate',
        'name' => 'avg_heart_rate',
        'number' => 15,
        'size' => 1,
        'type' => {},
        'unit' => [
          'bpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '16' => bless( {
        'id' => 'max_heart_rate',
        'name' => 'max_heart_rate',
        'number' => 16,
        'size' => 1,
        'type' => {},
        'unit' => [
          'bpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '17' => bless( {
        'id' => 'avg_cadence',
        'name' => 'avg_cadence',
        'number' => 17,
        'size' => 1,
        'type' => {},
        'unit' => [
          'rpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '18' => bless( {
        'id' => 'max_cadence',
        'name' => 'max_cadence',
        'number' => 18,
        'size' => 1,
        'type' => {},
        'unit' => [
          'rpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '19' => bless( {
        'id' => 'avg_power',
        'name' => 'avg_power',
        'number' => 19,
        'size' => 2,
        'type' => {},
        'unit' => [
          'watts'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'start_time',
        'name' => 'start_time',
        'number' => 2,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '20' => bless( {
        'id' => 'max_power',
        'name' => 'max_power',
        'number' => 20,
        'size' => 2,
        'type' => {},
        'unit' => [
          'watts'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '21' => bless( {
        'id' => 'total_ascent',
        'name' => 'total_ascent',
        'number' => 21,
        'size' => 2,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '22' => bless( {
        'id' => 'total_descent',
        'name' => 'total_descent',
        'number' => 22,
        'size' => 2,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '23' => bless( {
        'id' => 'intensity',
        'name' => 'intensity',
        'number' => 23,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '24' => bless( {
        'id' => 'lap_trigger',
        'name' => 'lap_trigger',
        'number' => 24,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '25' => bless( {
        'id' => 'sport',
        'name' => 'sport',
        'number' => 25,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '253' => bless( {
        'id' => 'timestamp',
        'name' => 'timestamp',
        'number' => 253,
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '26' => bless( {
        'id' => 'event_group',
        'name' => 'event_group',
        'number' => 26,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '27' => bless( {
        'id' => 'nec_lat',
        'name' => 'nec_lat',
        'number' => 27,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '28' => bless( {
        'id' => 'nec_long',
        'name' => 'nec_long',
        'number' => 28,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '29' => bless( {
        'id' => 'swc_lat',
        'name' => 'swc_lat',
        'number' => 29,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'start_position_lat',
        'name' => 'start_position_lat',
        'number' => 3,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '30' => bless( {
        'id' => 'swc_long',
        'name' => 'swc_long',
        'number' => 30,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'start_position_long',
        'name' => 'start_position_long',
        'number' => 4,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'end_position_lat',
        'name' => 'end_position_lat',
        'number' => 5,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '6' => bless( {
        'id' => 'end_position_long',
        'name' => 'end_position_long',
        'number' => 6,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '7' => bless( {
        'id' => 'total_elapsed_time',
        'name' => 'total_elapsed_time',
        'number' => 7,
        'scale' => [
          1000,	# 03e8
        ],
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '8' => bless( {
        'id' => 'total_timer_time',
        'name' => 'total_timer_time',
        'number' => 8,
        'scale' => [
          1000,	# 03e8
        ],
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '9' => bless( {
        'id' => 'total_distance',
        'name' => 'total_distance',
        'number' => 9,
        'scale' => [
          100,	# 0064
        ],
        'size' => 4,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      'avg_cadence' => {},
      'avg_heart_rate' => {},
      'avg_power' => {},
      'avg_speed' => {},
      'end_position_lat' => {},
      'end_position_long' => {},
      'event' => {},
      'event_group' => {},
      'event_type' => {},
      'intensity' => {},
      'lap_trigger' => {},
      'max_cadence' => {},
      'max_heart_rate' => {},
      'max_power' => {},
      'max_speed' => {},
      'message_index' => {},
      'nec_lat' => {},
      'nec_long' => {},
      'sport' => {},
      'start_position_lat' => {},
      'start_position_long' => {},
      'start_time' => {},
      'swc_lat' => {},
      'swc_long' => {},
      'timestamp' => {},
      'total_ascent' => {},
      'total_calories' => {},
      'total_cycles' => {},
      'total_descent' => {},
      'total_distance' => {},
      'total_elapsed_time' => {},
      'total_fat_calories' => {},
      'total_timer_time' => {}
    },
    'name' => 'lap',
    'number' => 19
  }, 'Garmin::FIT::Streamer::Message' ),
  '2' => bless( {
    'context' => 'SETTINGS FILE MESSAGES',
    'fields' => {
      '1' => bless( {
        'id' => 'utc_offset',
        'name' => 'utc_offset',
        'number' => 1,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'utc_offset' => {}
    },
    'name' => 'device_settings',
    'number' => 2
  }, 'Garmin::FIT::Streamer::Message' ),
  '20' => bless( {
    'context' => 'ACTIVITY FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'position_lat',
        'name' => 'position_lat',
        'number' => 0,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'position_long',
        'name' => 'position_long',
        'number' => 1,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '10' => bless( {
        'id' => 'resistance',
        'name' => 'resistance',
        'number' => 10,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '11' => bless( {
        'id' => 'time_from_course',
        'name' => 'time_from_course',
        'number' => 11,
        'scale' => [
          1000,	# 03e8
        ],
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '12' => bless( {
        'id' => 'cycle_length',
        'name' => 'cycle_length',
        'number' => 12,
        'scale' => [
          100,	# 0064
        ],
        'size' => 1,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '13' => bless( {
        'id' => 'temperature',
        'name' => 'temperature',
        'number' => 13,
        'size' => 1,
        'type' => {},
        'unit' => [
          'C'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'altitude',
        'name' => 'altitude',
        'number' => 2,
        'offset' => [
          500,	# 01f4
        ],
        'scale' => [
          5,	# 0005
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '253' => bless( {
        'id' => 'timestamp',
        'name' => 'timestamp',
        'number' => 253,
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'heart_rate',
        'name' => 'heart_rate',
        'number' => 3,
        'size' => 1,
        'type' => {},
        'unit' => [
          'bpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'cadence',
        'name' => 'cadence',
        'number' => 4,
        'size' => 1,
        'type' => {},
        'unit' => [
          'rpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'distance',
        'name' => 'distance',
        'number' => 5,
        'scale' => [
          100,	# 0064
        ],
        'size' => 4,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '6' => bless( {
        'id' => 'speed',
        'name' => 'speed',
        'number' => 6,
        'scale' => [
          1000,	# 03e8
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'm/s'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '7' => bless( {
        'id' => 'power',
        'name' => 'power',
        'number' => 7,
        'size' => 2,
        'type' => {},
        'unit' => [
          'watts'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '8' => bless( {
        'accumulate' => [
          '0',
          '1'
        ],
        'array' => '3',
        'bits' => [
          12,	# 000c
          12,	# 000c
        ],
        'id' => 'compressed_speed_distance',
        'name' => 'compressed_speed_distance',
        'number' => 8,
        'scale' => [
          100,	# 0064
          16,	# 0010
        ],
        'size' => 0,
        'type' => {},
        'unit' => [
          'm/s',
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '9' => bless( {
        'id' => 'grade',
        'name' => 'grade',
        'number' => 9,
        'scale' => [
          100,	# 0064
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          '%'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      'altitude' => {},
      'cadence' => {},
      'compressed_speed_distance' => {},
      'cycle_length' => {},
      'distance' => {},
      'grade' => {},
      'heart_rate' => {},
      'position_lat' => {},
      'position_long' => {},
      'power' => {},
      'resistance' => {},
      'speed' => {},
      'temperature' => {},
      'time_from_course' => {},
      'timestamp' => {}
    },
    'name' => 'record',
    'number' => 20
  }, 'Garmin::FIT::Streamer::Message' ),
  '21' => bless( {
    'context' => 'ACTIVITY FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'event',
        'name' => 'event',
        'number' => 0,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'event_type',
        'name' => 'event_type',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'bits' => [
          16,	# 0010
        ],
        'id' => 'data16',
        'name' => 'data16',
        'number' => 2,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '253' => bless( {
        'id' => 'timestamp',
        'name' => 'timestamp',
        'number' => 253,
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'data',
        'name' => 'data',
        'number' => 3,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'event_group',
        'name' => 'event_group',
        'number' => 4,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'data' => {},
      'data16' => {},
      'event' => {},
      'event_group' => {},
      'event_type' => {},
      'timestamp' => {}
    },
    'name' => 'event',
    'number' => 21
  }, 'Garmin::FIT::Streamer::Message' ),
  '23' => bless( {
    'context' => 'ACTIVITY FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'bits' => [
          16,	# 0010
        ],
        'id' => 'device_index',
        'name' => 'device_index',
        'number' => 0,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'device_type',
        'name' => 'device_type',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '10' => bless( {
        'id' => 'battery_voltage',
        'name' => 'battery_voltage',
        'number' => 10,
        'scale' => [
          256,	# 0100
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'V'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '11' => bless( {
        'id' => 'battery_status',
        'name' => 'battery_status',
        'number' => 11,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'manufacturer',
        'name' => 'manufacturer',
        'number' => 2,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '253' => bless( {
        'id' => 'timestamp',
        'name' => 'timestamp',
        'number' => 253,
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'serial_number',
        'name' => 'serial_number',
        'number' => 3,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'product',
        'name' => 'product',
        'number' => 4,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'software_version',
        'name' => 'software_version',
        'number' => 5,
        'scale' => [
          100,	# 0064
        ],
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '6' => bless( {
        'id' => 'hardware_version',
        'name' => 'hardware_version',
        'number' => 6,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '7' => bless( {
        'id' => 'cum_operating_time',
        'name' => 'cum_operating_time',
        'number' => 7,
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      'battery_status' => {},
      'battery_voltage' => {},
      'cum_operating_time' => {},
      'device_index' => {},
      'device_type' => {},
      'hardware_version' => {},
      'manufacturer' => {},
      'product' => {},
      'serial_number' => {},
      'software_version' => {},
      'timestamp' => {}
    },
    'name' => 'device_info',
    'number' => 23
  }, 'Garmin::FIT::Streamer::Message' ),
  '26' => bless( {
    'context' => 'WORKOUT FILE MESSAGES',
    'fields' => {
      '4' => bless( {
        'id' => 'sport',
        'name' => 'sport',
        'number' => 4,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'capabilities',
        'name' => 'capabilities',
        'number' => 5,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '6' => bless( {
        'id' => 'num_valid_steps',
        'name' => 'num_valid_steps',
        'number' => 6,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '8' => bless( {
        'id' => 'wkt_name',
        'name' => 'wkt_name',
        'number' => 8,
        'size' => 0,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'capabilities' => {},
      'num_valid_steps' => {},
      'sport' => {},
      'wkt_name' => {}
    },
    'name' => 'workout',
    'number' => 26
  }, 'Garmin::FIT::Streamer::Message' ),
  '27' => bless( {
    'context' => 'WORKOUT FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'wkt_step_name',
        'name' => 'wkt_step_name',
        'number' => 0,
        'size' => 0,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'duration_type',
        'name' => 'duration_type',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'duration_value',
        'name' => 'duration_value',
        'number' => 2,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'target_type',
        'name' => 'target_type',
        'number' => 3,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'target_value',
        'name' => 'target_value',
        'number' => 4,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'custom_target_value_low',
        'name' => 'custom_target_value_low',
        'number' => 5,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '6' => bless( {
        'id' => 'custom_target_value_high',
        'name' => 'custom_target_value_high',
        'number' => 6,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '7' => bless( {
        'id' => 'intensity',
        'name' => 'intensity',
        'number' => 7,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'custom_target_value_high' => {},
      'custom_target_value_low' => {},
      'duration_type' => {},
      'duration_value' => {},
      'intensity' => {},
      'message_index' => {},
      'target_type' => {},
      'target_value' => {},
      'wkt_step_name' => {}
    },
    'name' => 'workout_step',
    'number' => 27
  }, 'Garmin::FIT::Streamer::Message' ),
  '3' => bless( {
    'context' => 'SETTINGS FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'friendly_name',
        'name' => 'friendly_name',
        'number' => 0,
        'size' => 0,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'gender',
        'name' => 'gender',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '10' => bless( {
        'id' => 'default_max_biking_heart_rate',
        'name' => 'default_max_biking_heart_rate',
        'number' => 10,
        'size' => 1,
        'type' => {},
        'unit' => [
          'bpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '11' => bless( {
        'id' => 'default_max_heart_rate',
        'name' => 'default_max_heart_rate',
        'number' => 11,
        'size' => 1,
        'type' => {},
        'unit' => [
          'bpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '12' => bless( {
        'id' => 'hr_setting',
        'name' => 'hr_setting',
        'number' => 12,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '13' => bless( {
        'id' => 'speed_setting',
        'name' => 'speed_setting',
        'number' => 13,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '14' => bless( {
        'id' => 'dist_setting',
        'name' => 'dist_setting',
        'number' => 14,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '16' => bless( {
        'id' => 'power_setting',
        'name' => 'power_setting',
        'number' => 16,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '17' => bless( {
        'id' => 'activity_class',
        'name' => 'activity_class',
        'number' => 17,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '18' => bless( {
        'id' => 'position_setting',
        'name' => 'position_setting',
        'number' => 18,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'age',
        'name' => 'age',
        'number' => 2,
        'size' => 1,
        'type' => {},
        'unit' => [
          'years'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '21' => bless( {
        'id' => 'temperature_setting',
        'name' => 'temperature_setting',
        'number' => 21,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '22' => bless( {
        'id' => 'local_id',
        'name' => 'local_id',
        'number' => 22,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '23' => bless( {
        'array' => '6',
        'id' => 'global_id',
        'name' => 'global_id',
        'number' => 23,
        'size' => 0,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'height',
        'name' => 'height',
        'number' => 3,
        'scale' => [
          100,	# 0064
        ],
        'size' => 1,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'weight',
        'name' => 'weight',
        'number' => 4,
        'scale' => [
          10,	# 000a
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'kg'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'language',
        'name' => 'language',
        'number' => 5,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '6' => bless( {
        'id' => 'elev_setting',
        'name' => 'elev_setting',
        'number' => 6,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '7' => bless( {
        'id' => 'weight_setting',
        'name' => 'weight_setting',
        'number' => 7,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '8' => bless( {
        'id' => 'resting_heart_rate',
        'name' => 'resting_heart_rate',
        'number' => 8,
        'size' => 1,
        'type' => {},
        'unit' => [
          'bpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '9' => bless( {
        'id' => 'default_max_running_heart_rate',
        'name' => 'default_max_running_heart_rate',
        'number' => 9,
        'size' => 1,
        'type' => {},
        'unit' => [
          'bpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      'activity_class' => {},
      'age' => {},
      'default_max_biking_heart_rate' => {},
      'default_max_heart_rate' => {},
      'default_max_running_heart_rate' => {},
      'dist_setting' => {},
      'elev_setting' => {},
      'friendly_name' => {},
      'gender' => {},
      'global_id' => {},
      'height' => {},
      'hr_setting' => {},
      'language' => {},
      'local_id' => {},
      'message_index' => {},
      'position_setting' => {},
      'power_setting' => {},
      'resting_heart_rate' => {},
      'speed_setting' => {},
      'temperature_setting' => {},
      'weight' => {},
      'weight_setting' => {}
    },
    'name' => 'user_profile',
    'number' => 3
  }, 'Garmin::FIT::Streamer::Message' ),
  '30' => bless( {
    'context' => 'WEIGHT SCALE FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'weight',
        'name' => 'weight',
        'number' => 0,
        'scale' => [
          100,	# 0064
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'kg'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'percent_fat',
        'name' => 'percent_fat',
        'number' => 1,
        'scale' => [
          100,	# 0064
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          '%'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '10' => bless( {
        'id' => 'metabolic_age',
        'name' => 'metabolic_age',
        'number' => 10,
        'size' => 1,
        'type' => {},
        'unit' => [
          'years'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '11' => bless( {
        'id' => 'visceral_fat_rating',
        'name' => 'visceral_fat_rating',
        'number' => 11,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '12' => bless( {
        'id' => 'user_profile_index',
        'name' => 'user_profile_index',
        'number' => 12,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'percent_hydration',
        'name' => 'percent_hydration',
        'number' => 2,
        'scale' => [
          100,	# 0064
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          '%'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '253' => bless( {
        'id' => 'timestamp',
        'name' => 'timestamp',
        'number' => 253,
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'visceral_fat_mass',
        'name' => 'visceral_fat_mass',
        'number' => 3,
        'scale' => [
          100,	# 0064
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'kg'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'bone_mass',
        'name' => 'bone_mass',
        'number' => 4,
        'scale' => [
          100,	# 0064
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'kg'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'muscle_mass',
        'name' => 'muscle_mass',
        'number' => 5,
        'scale' => [
          100,	# 0064
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'kg'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '7' => bless( {
        'id' => 'basal_met',
        'name' => 'basal_met',
        'number' => 7,
        'scale' => [
          4,	# 0004
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'kcal/day'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '8' => bless( {
        'id' => 'physique_rating',
        'name' => 'physique_rating',
        'number' => 8,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '9' => bless( {
        'id' => 'active_met',
        'name' => 'active_met',
        'number' => 9,
        'scale' => [
          4,	# 0004
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'kcal/day'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      'active_met' => {},
      'basal_met' => {},
      'bone_mass' => {},
      'metabolic_age' => {},
      'muscle_mass' => {},
      'percent_fat' => {},
      'percent_hydration' => {},
      'physique_rating' => {},
      'timestamp' => {},
      'user_profile_index' => {},
      'visceral_fat_mass' => {},
      'visceral_fat_rating' => {},
      'weight' => {}
    },
    'name' => 'weight_scale',
    'number' => 30
  }, 'Garmin::FIT::Streamer::Message' ),
  '31' => bless( {
    'context' => 'COURSE FILE MESSAGES',
    'fields' => {
      '4' => bless( {
        'id' => 'sport',
        'name' => 'sport',
        'number' => 4,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'name',
        'name' => 'name',
        'number' => 5,
        'size' => 0,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '6' => bless( {
        'id' => 'capabilities',
        'name' => 'capabilities',
        'number' => 6,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'capabilities' => {},
      'name' => {},
      'sport' => {}
    },
    'name' => 'course',
    'number' => 31
  }, 'Garmin::FIT::Streamer::Message' ),
  '32' => bless( {
    'context' => 'COURSE FILE MESSAGES',
    'fields' => {
      '1' => bless( {
        'id' => 'timestamp',
        'name' => 'timestamp',
        'number' => 1,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'position_lat',
        'name' => 'position_lat',
        'number' => 2,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'position_long',
        'name' => 'position_long',
        'number' => 3,
        'size' => 4,
        'type' => {},
        'unit' => [
          'semicircles'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'distance',
        'name' => 'distance',
        'number' => 4,
        'scale' => [
          100,	# 0064
        ],
        'size' => 4,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'type',
        'name' => 'type',
        'number' => 5,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '6' => bless( {
        'id' => 'name',
        'name' => 'name',
        'number' => 6,
        'size' => 0,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'distance' => {},
      'message_index' => {},
      'name' => {},
      'position_lat' => {},
      'position_long' => {},
      'timestamp' => {},
      'type' => {}
    },
    'name' => 'course_point',
    'number' => 32
  }, 'Garmin::FIT::Streamer::Message' ),
  '33' => bless( {
    'context' => 'TOTALS FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'timer_time',
        'name' => 'timer_time',
        'number' => 0,
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'distance',
        'name' => 'distance',
        'number' => 1,
        'size' => 4,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'calories',
        'name' => 'calories',
        'number' => 2,
        'size' => 4,
        'type' => {},
        'unit' => [
          'kcal'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '253' => bless( {
        'id' => 'timestamp',
        'name' => 'timestamp',
        'number' => 253,
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'sport',
        'name' => 'sport',
        'number' => 3,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'elapsed_time',
        'name' => 'elapsed_time',
        'number' => 4,
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      'calories' => {},
      'distance' => {},
      'elapsed_time' => {},
      'message_index' => {},
      'sport' => {},
      'timer_time' => {},
      'timestamp' => {}
    },
    'name' => 'totals',
    'number' => 33
  }, 'Garmin::FIT::Streamer::Message' ),
  '34' => bless( {
    'context' => 'ACTIVITY FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'total_timer_time',
        'name' => 'total_timer_time',
        'number' => 0,
        'scale' => [
          1000,	# 03e8
        ],
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'num_sessions',
        'name' => 'num_sessions',
        'number' => 1,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'type',
        'name' => 'type',
        'number' => 2,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '253' => bless( {
        'id' => 'timestamp',
        'name' => 'timestamp',
        'number' => 253,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'event',
        'name' => 'event',
        'number' => 3,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'event_type',
        'name' => 'event_type',
        'number' => 4,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'local_timestamp',
        'name' => 'local_timestamp',
        'number' => 5,
        'size' => 4,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '6' => bless( {
        'id' => 'event_group',
        'name' => 'event_group',
        'number' => 6,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'event' => {},
      'event_group' => {},
      'event_type' => {},
      'local_timestamp' => {},
      'num_sessions' => {},
      'timestamp' => {},
      'total_timer_time' => {},
      'type' => {}
    },
    'name' => 'activity',
    'number' => 34
  }, 'Garmin::FIT::Streamer::Message' ),
  '35' => bless( {
    'context' => 'DEVICE FILE MESSAGES',
    'fields' => {
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'version',
        'name' => 'version',
        'number' => 3,
        'scale' => [
          100,	# 0064
        ],
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'part_number',
        'name' => 'part_number',
        'number' => 5,
        'size' => 0,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'message_index' => {},
      'part_number' => {},
      'version' => {}
    },
    'name' => 'software',
    'number' => 35
  }, 'Garmin::FIT::Streamer::Message' ),
  '37' => bless( {
    'context' => 'DEVICE FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'type',
        'name' => 'type',
        'number' => 0,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'flags',
        'name' => 'flags',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'directory',
        'name' => 'directory',
        'number' => 2,
        'size' => 0,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'max_count',
        'name' => 'max_count',
        'number' => 3,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'max_size',
        'name' => 'max_size',
        'number' => 4,
        'size' => 4,
        'type' => {},
        'unit' => [
          'bytes'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      'directory' => {},
      'flags' => {},
      'max_count' => {},
      'max_size' => {},
      'message_index' => {},
      'type' => {}
    },
    'name' => 'file_capabilities',
    'number' => 37
  }, 'Garmin::FIT::Streamer::Message' ),
  '38' => bless( {
    'context' => 'DEVICE FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'file',
        'name' => 'file',
        'number' => 0,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'mesg_num',
        'name' => 'mesg_num',
        'number' => 1,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'count_type',
        'name' => 'count_type',
        'number' => 2,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'count',
        'name' => 'count',
        'number' => 3,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'count' => {},
      'count_type' => {},
      'file' => {},
      'mesg_num' => {},
      'message_index' => {}
    },
    'name' => 'mesg_capabilities',
    'number' => 38
  }, 'Garmin::FIT::Streamer::Message' ),
  '39' => bless( {
    'context' => 'DEVICE FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'file',
        'name' => 'file',
        'number' => 0,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'mesg_num',
        'name' => 'mesg_num',
        'number' => 1,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'field_num',
        'name' => 'field_num',
        'number' => 2,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'count',
        'name' => 'count',
        'number' => 3,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'count' => {},
      'field_num' => {},
      'file' => {},
      'mesg_num' => {},
      'message_index' => {}
    },
    'name' => 'field_capabilities',
    'number' => 39
  }, 'Garmin::FIT::Streamer::Message' ),
  '4' => bless( {
    'context' => 'SETTINGS FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'enabled',
        'name' => 'enabled',
        'number' => 0,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'hrm_ant_id',
        'name' => 'hrm_ant_id',
        'number' => 1,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'enabled' => {},
      'hrm_ant_id' => {},
      'message_index' => {}
    },
    'name' => 'hrm_profile',
    'number' => 4
  }, 'Garmin::FIT::Streamer::Message' ),
  '49' => bless( {
    'context' => 'COMMON MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'software_version',
        'name' => 'software_version',
        'number' => 0,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'hardware_version',
        'name' => 'hardware_version',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'hardware_version' => {},
      'software_version' => {}
    },
    'name' => 'file_creator',
    'number' => 49
  }, 'Garmin::FIT::Streamer::Message' ),
  '5' => bless( {
    'context' => 'SETTINGS FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'enabled',
        'name' => 'enabled',
        'number' => 0,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'sdm_ant_id',
        'name' => 'sdm_ant_id',
        'number' => 1,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'sdm_cal_factor',
        'name' => 'sdm_cal_factor',
        'number' => 2,
        'scale' => [
          10,	# 000a
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          '%'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'odometer',
        'name' => 'odometer',
        'number' => 3,
        'scale' => [
          100,	# 0064
        ],
        'size' => 4,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'speed_source',
        'name' => 'speed_source',
        'number' => 4,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'enabled' => {},
      'message_index' => {},
      'odometer' => {},
      'sdm_ant_id' => {},
      'sdm_cal_factor' => {},
      'speed_source' => {}
    },
    'name' => 'sdm_profile',
    'number' => 5
  }, 'Garmin::FIT::Streamer::Message' ),
  '51' => bless( {
    'context' => 'WEIGHT SCALE FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'systolic_pressure',
        'name' => 'systolic_pressure',
        'number' => 0,
        'size' => 2,
        'type' => {},
        'unit' => [
          'mmHg'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'diastolic_pressure',
        'name' => 'diastolic_pressure',
        'number' => 1,
        'size' => 2,
        'type' => {},
        'unit' => [
          'mmHg'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'mean_arterial_pressure',
        'name' => 'mean_arterial_pressure',
        'number' => 2,
        'size' => 2,
        'type' => {},
        'unit' => [
          'mmHg'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '253' => bless( {
        'id' => 'timestamp',
        'name' => 'timestamp',
        'number' => 253,
        'size' => 4,
        'type' => {},
        'unit' => [
          's'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'map_3_sample_mean',
        'name' => 'map_3_sample_mean',
        'number' => 3,
        'size' => 2,
        'type' => {},
        'unit' => [
          'mmHg'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'map_morning_values',
        'name' => 'map_morning_values',
        'number' => 4,
        'size' => 2,
        'type' => {},
        'unit' => [
          'mmHg'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'map_evening_values',
        'name' => 'map_evening_values',
        'number' => 5,
        'size' => 2,
        'type' => {},
        'unit' => [
          'mmHg'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '6' => bless( {
        'id' => 'heart_rate',
        'name' => 'heart_rate',
        'number' => 6,
        'size' => 1,
        'type' => {},
        'unit' => [
          'bpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '7' => bless( {
        'id' => 'heart_rate_type',
        'name' => 'heart_rate_type',
        'number' => 7,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '8' => bless( {
        'id' => 'status',
        'name' => 'status',
        'number' => 8,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '9' => bless( {
        'id' => 'user_profile_index',
        'name' => 'user_profile_index',
        'number' => 9,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'diastolic_pressure' => {},
      'heart_rate' => {},
      'heart_rate_type' => {},
      'map_3_sample_mean' => {},
      'map_evening_values' => {},
      'map_morning_values' => {},
      'mean_arterial_pressure' => {},
      'status' => {},
      'systolic_pressure' => {},
      'timestamp' => {},
      'user_profile_index' => {}
    },
    'name' => 'blood_pressure',
    'number' => 51
  }, 'Garmin::FIT::Streamer::Message' ),
  '6' => bless( {
    'context' => 'SETTINGS FILE MESSAGES',
    'fields' => {
      '0' => bless( {
        'id' => 'name',
        'name' => 'name',
        'number' => 0,
        'size' => 0,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '1' => bless( {
        'id' => 'sport',
        'name' => 'sport',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '10' => bless( {
        'id' => 'bike_weight',
        'name' => 'bike_weight',
        'number' => 10,
        'scale' => [
          10,	# 000a
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'kg'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '11' => bless( {
        'id' => 'power_cal_factor',
        'name' => 'power_cal_factor',
        'number' => 11,
        'scale' => [
          10,	# 000a
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          '%'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '12' => bless( {
        'id' => 'auto_wheel_cal',
        'name' => 'auto_wheel_cal',
        'number' => 12,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '13' => bless( {
        'id' => 'auto_power_zero',
        'name' => 'auto_power_zero',
        'number' => 13,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '14' => bless( {
        'id' => 'id',
        'name' => 'id',
        'number' => 14,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '15' => bless( {
        'id' => 'spd_enabled',
        'name' => 'spd_enabled',
        'number' => 15,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '16' => bless( {
        'id' => 'cad_enabled',
        'name' => 'cad_enabled',
        'number' => 16,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '17' => bless( {
        'id' => 'spdcad_enabled',
        'name' => 'spdcad_enabled',
        'number' => 17,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '18' => bless( {
        'id' => 'power_enabled',
        'name' => 'power_enabled',
        'number' => 18,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'sub_sport',
        'name' => 'sub_sport',
        'number' => 2,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'odometer',
        'name' => 'odometer',
        'number' => 3,
        'scale' => [
          100,	# 0064
        ],
        'size' => 4,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '4' => bless( {
        'id' => 'bike_spd_ant_id',
        'name' => 'bike_spd_ant_id',
        'number' => 4,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'bike_cad_ant_id',
        'name' => 'bike_cad_ant_id',
        'number' => 5,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '6' => bless( {
        'id' => 'bike_spdcad_ant_id',
        'name' => 'bike_spdcad_ant_id',
        'number' => 6,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '7' => bless( {
        'id' => 'bike_power_ant_id',
        'name' => 'bike_power_ant_id',
        'number' => 7,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '8' => bless( {
        'id' => 'custom_wheelsize',
        'name' => 'custom_wheelsize',
        'number' => 8,
        'scale' => [
          1000,	# 03e8
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '9' => bless( {
        'id' => 'auto_wheelsize',
        'name' => 'auto_wheelsize',
        'number' => 9,
        'scale' => [
          1000,	# 03e8
        ],
        'size' => 2,
        'type' => {},
        'unit' => [
          'm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      'auto_power_zero' => {},
      'auto_wheel_cal' => {},
      'auto_wheelsize' => {},
      'bike_cad_ant_id' => {},
      'bike_power_ant_id' => {},
      'bike_spd_ant_id' => {},
      'bike_spdcad_ant_id' => {},
      'bike_weight' => {},
      'cad_enabled' => {},
      'custom_wheelsize' => {},
      'id' => {},
      'message_index' => {},
      'name' => {},
      'odometer' => {},
      'power_cal_factor' => {},
      'power_enabled' => {},
      'spd_enabled' => {},
      'spdcad_enabled' => {},
      'sport' => {},
      'sub_sport' => {}
    },
    'name' => 'bike_profile',
    'number' => 6
  }, 'Garmin::FIT::Streamer::Message' ),
  '7' => bless( {
    'context' => 'SPORT SETTINGS FILE MESSAGES',
    'fields' => {
      '1' => bless( {
        'id' => 'max_heart_rate',
        'name' => 'max_heart_rate',
        'number' => 1,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'threshold_heart_rate',
        'name' => 'threshold_heart_rate',
        'number' => 2,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '3' => bless( {
        'id' => 'functional_threshold_power',
        'name' => 'functional_threshold_power',
        'number' => 3,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '5' => bless( {
        'id' => 'hr_calc_type',
        'name' => 'hr_calc_type',
        'number' => 5,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '7' => bless( {
        'id' => 'pwr_calc_type',
        'name' => 'pwr_calc_type',
        'number' => 7,
        'size' => 1,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'functional_threshold_power' => {},
      'hr_calc_type' => {},
      'max_heart_rate' => {},
      'pwr_calc_type' => {},
      'threshold_heart_rate' => {}
    },
    'name' => 'zones_target',
    'number' => 7
  }, 'Garmin::FIT::Streamer::Message' ),
  '8' => bless( {
    'context' => 'SPORT SETTINGS FILE MESSAGES',
    'fields' => {
      '1' => bless( {
        'id' => 'high_bpm',
        'name' => 'high_bpm',
        'number' => 1,
        'size' => 1,
        'type' => {},
        'unit' => [
          'bpm'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'name',
        'name' => 'name',
        'number' => 2,
        'size' => 0,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'high_bpm' => {},
      'message_index' => {},
      'name' => {}
    },
    'name' => 'hr_zone',
    'number' => 8
  }, 'Garmin::FIT::Streamer::Message' ),
  '9' => bless( {
    'context' => 'SPORT SETTINGS FILE MESSAGES',
    'fields' => {
      '1' => bless( {
        'id' => 'high_value',
        'name' => 'high_value',
        'number' => 1,
        'size' => 2,
        'type' => {},
        'unit' => [
          'watts'
        ]
      }, 'Garmin::FIT::Streamer::Field' ),
      '2' => bless( {
        'id' => 'name',
        'name' => 'name',
        'number' => 2,
        'size' => 0,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      '254' => bless( {
        'id' => 'message_index',
        'name' => 'message_index',
        'number' => 254,
        'size' => 2,
        'type' => {}
      }, 'Garmin::FIT::Streamer::Field' ),
      'high_value' => {},
      'message_index' => {},
      'name' => {}
    },
    'name' => 'power_zone',
    'number' => 9
  }, 'Garmin::FIT::Streamer::Message' ),
  'activity' => {},
  'bike_profile' => {},
  'blood_pressure' => {},
  'capabilities' => {},
  'course' => {},
  'course_point' => {},
  'device_info' => {},
  'device_settings' => {},
  'event' => {},
  'field_capabilities' => {},
  'file_capabilities' => {},
  'file_creator' => {},
  'file_id' => {},
  'goal' => {},
  'hr_zone' => {},
  'hrm_profile' => {},
  'lap' => {},
  'mesg_capabilities' => {},
  'met_zone' => {},
  'power_zone' => {},
  'record' => {},
  'sdm_profile' => {},
  'session' => {},
  'software' => {},
  'sport' => {},
  'totals' => {},
  'user_profile' => {},
  'weight_scale' => {},
  'workout' => {},
  'workout_step' => {},
  'zones_target' => {}
};
$profile->{'0'}{'fields'}{'0'}{'type'} = $types->{'file'};
$profile->{'0'}{'fields'}{'1'}{'type'} = $types->{'manufacturer'};
$profile->{'0'}{'fields'}{'2'}{'type'} = $types->{'uint16'};
$profile->{'0'}{'fields'}{'3'}{'type'} = $types->{'uint32z'};
$profile->{'0'}{'fields'}{'4'}{'type'} = $types->{'date_time'};
$profile->{'0'}{'fields'}{'5'}{'type'} = $types->{'uint16'};
$profile->{'0'}{'fields'}{'manufacturer'} = $profile->{'0'}{'fields'}{'1'};
$profile->{'0'}{'fields'}{'number'} = $profile->{'0'}{'fields'}{'5'};
$profile->{'0'}{'fields'}{'product'} = $profile->{'0'}{'fields'}{'2'};
$profile->{'0'}{'fields'}{'serial_number'} = $profile->{'0'}{'fields'}{'3'};
$profile->{'0'}{'fields'}{'time_created'} = $profile->{'0'}{'fields'}{'4'};
$profile->{'0'}{'fields'}{'type'} = $profile->{'0'}{'fields'}{'0'};
$profile->{'1'}{'fields'}{'0'}{'type'} = $types->{'uint8z'};
$profile->{'1'}{'fields'}{'1'}{'type'} = $types->{'sport_bits_0'};
$profile->{'1'}{'fields'}{'21'}{'type'} = $types->{'workout_capabilities'};
$profile->{'1'}{'fields'}{'languages'} = $profile->{'1'}{'fields'}{'0'};
$profile->{'1'}{'fields'}{'sports'} = $profile->{'1'}{'fields'}{'1'};
$profile->{'1'}{'fields'}{'workouts_supported'} = $profile->{'1'}{'fields'}{'21'};
$profile->{'10'}{'fields'}{'1'}{'type'} = $types->{'uint8'};
$profile->{'10'}{'fields'}{'2'}{'type'} = $types->{'uint16'};
$profile->{'10'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'10'}{'fields'}{'3'}{'type'} = $types->{'uint8'};
$profile->{'10'}{'fields'}{'calories'} = $profile->{'10'}{'fields'}{'2'};
$profile->{'10'}{'fields'}{'fat_calories'} = $profile->{'10'}{'fields'}{'3'};
$profile->{'10'}{'fields'}{'high_bpm'} = $profile->{'10'}{'fields'}{'1'};
$profile->{'10'}{'fields'}{'message_index'} = $profile->{'10'}{'fields'}{'254'};
$profile->{'12'}{'fields'}{'0'}{'type'} = $types->{'sport'};
$profile->{'12'}{'fields'}{'1'}{'type'} = $types->{'sub_sport'};
$profile->{'12'}{'fields'}{'3'}{'type'} = $types->{'string'};
$profile->{'12'}{'fields'}{'name'} = $profile->{'12'}{'fields'}{'3'};
$profile->{'12'}{'fields'}{'sport'} = $profile->{'12'}{'fields'}{'0'};
$profile->{'12'}{'fields'}{'sub_sport'} = $profile->{'12'}{'fields'}{'1'};
$profile->{'15'}{'fields'}{'0'}{'type'} = $types->{'sport'};
$profile->{'15'}{'fields'}{'1'}{'type'} = $types->{'sub_sport'};
$profile->{'15'}{'fields'}{'10'}{'type'} = $types->{'bool'};
$profile->{'15'}{'fields'}{'2'}{'type'} = $types->{'date_time'};
$profile->{'15'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'15'}{'fields'}{'3'}{'type'} = $types->{'date_time'};
$profile->{'15'}{'fields'}{'4'}{'type'} = $types->{'goal'};
$profile->{'15'}{'fields'}{'5'}{'type'} = $types->{'uint32'};
$profile->{'15'}{'fields'}{'6'}{'type'} = $types->{'bool'};
$profile->{'15'}{'fields'}{'7'}{'type'} = $types->{'uint32'};
$profile->{'15'}{'fields'}{'8'}{'type'} = $types->{'goal_recurrence'};
$profile->{'15'}{'fields'}{'9'}{'type'} = $types->{'uint16'};
$profile->{'15'}{'fields'}{'enabled'} = $profile->{'15'}{'fields'}{'10'};
$profile->{'15'}{'fields'}{'end_date'} = $profile->{'15'}{'fields'}{'3'};
$profile->{'15'}{'fields'}{'message_index'} = $profile->{'15'}{'fields'}{'254'};
$profile->{'15'}{'fields'}{'recurrence'} = $profile->{'15'}{'fields'}{'8'};
$profile->{'15'}{'fields'}{'recurrence_value'} = $profile->{'15'}{'fields'}{'9'};
$profile->{'15'}{'fields'}{'repeat'} = $profile->{'15'}{'fields'}{'6'};
$profile->{'15'}{'fields'}{'sport'} = $profile->{'15'}{'fields'}{'0'};
$profile->{'15'}{'fields'}{'start_date'} = $profile->{'15'}{'fields'}{'2'};
$profile->{'15'}{'fields'}{'sub_sport'} = $profile->{'15'}{'fields'}{'1'};
$profile->{'15'}{'fields'}{'target_value'} = $profile->{'15'}{'fields'}{'7'};
$profile->{'15'}{'fields'}{'type'} = $profile->{'15'}{'fields'}{'4'};
$profile->{'15'}{'fields'}{'value'} = $profile->{'15'}{'fields'}{'5'};
$profile->{'18'}{'fields'}{'0'}{'type'} = $types->{'event'};
$profile->{'18'}{'fields'}{'1'}{'type'} = $types->{'event_type'};
$profile->{'18'}{'fields'}{'10'}{'type'} = $types->{'uint32'};
$profile->{'18'}{'fields'}{'11'}{'type'} = $types->{'uint16'};
$profile->{'18'}{'fields'}{'13'}{'type'} = $types->{'uint16'};
$profile->{'18'}{'fields'}{'14'}{'type'} = $types->{'uint16'};
$profile->{'18'}{'fields'}{'15'}{'type'} = $types->{'uint16'};
$profile->{'18'}{'fields'}{'16'}{'type'} = $types->{'uint8'};
$profile->{'18'}{'fields'}{'17'}{'type'} = $types->{'uint8'};
$profile->{'18'}{'fields'}{'18'}{'type'} = $types->{'uint8'};
$profile->{'18'}{'fields'}{'19'}{'type'} = $types->{'uint8'};
$profile->{'18'}{'fields'}{'2'}{'type'} = $types->{'date_time'};
$profile->{'18'}{'fields'}{'20'}{'type'} = $types->{'uint16'};
$profile->{'18'}{'fields'}{'21'}{'type'} = $types->{'uint16'};
$profile->{'18'}{'fields'}{'22'}{'type'} = $types->{'uint16'};
$profile->{'18'}{'fields'}{'23'}{'type'} = $types->{'uint16'};
$profile->{'18'}{'fields'}{'24'}{'type'} = $types->{'uint8'};
$profile->{'18'}{'fields'}{'25'}{'type'} = $types->{'uint16'};
$profile->{'18'}{'fields'}{'253'}{'type'} = $types->{'date_time'};
$profile->{'18'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'18'}{'fields'}{'26'}{'type'} = $types->{'uint16'};
$profile->{'18'}{'fields'}{'27'}{'type'} = $types->{'uint8'};
$profile->{'18'}{'fields'}{'28'}{'type'} = $types->{'session_trigger'};
$profile->{'18'}{'fields'}{'29'}{'type'} = $types->{'sint32'};
$profile->{'18'}{'fields'}{'3'}{'type'} = $types->{'sint32'};
$profile->{'18'}{'fields'}{'30'}{'type'} = $types->{'sint32'};
$profile->{'18'}{'fields'}{'31'}{'type'} = $types->{'sint32'};
$profile->{'18'}{'fields'}{'32'}{'type'} = $types->{'sint32'};
$profile->{'18'}{'fields'}{'4'}{'type'} = $types->{'sint32'};
$profile->{'18'}{'fields'}{'5'}{'type'} = $types->{'sport'};
$profile->{'18'}{'fields'}{'6'}{'type'} = $types->{'sub_sport'};
$profile->{'18'}{'fields'}{'7'}{'type'} = $types->{'uint32'};
$profile->{'18'}{'fields'}{'8'}{'type'} = $types->{'uint32'};
$profile->{'18'}{'fields'}{'9'}{'type'} = $types->{'uint32'};
$profile->{'18'}{'fields'}{'avg_cadence'} = $profile->{'18'}{'fields'}{'18'};
$profile->{'18'}{'fields'}{'avg_heart_rate'} = $profile->{'18'}{'fields'}{'16'};
$profile->{'18'}{'fields'}{'avg_power'} = $profile->{'18'}{'fields'}{'20'};
$profile->{'18'}{'fields'}{'avg_speed'} = $profile->{'18'}{'fields'}{'14'};
$profile->{'18'}{'fields'}{'event'} = $profile->{'18'}{'fields'}{'0'};
$profile->{'18'}{'fields'}{'event_group'} = $profile->{'18'}{'fields'}{'27'};
$profile->{'18'}{'fields'}{'event_type'} = $profile->{'18'}{'fields'}{'1'};
$profile->{'18'}{'fields'}{'first_lap_index'} = $profile->{'18'}{'fields'}{'25'};
$profile->{'18'}{'fields'}{'max_cadence'} = $profile->{'18'}{'fields'}{'19'};
$profile->{'18'}{'fields'}{'max_heart_rate'} = $profile->{'18'}{'fields'}{'17'};
$profile->{'18'}{'fields'}{'max_power'} = $profile->{'18'}{'fields'}{'21'};
$profile->{'18'}{'fields'}{'max_speed'} = $profile->{'18'}{'fields'}{'15'};
$profile->{'18'}{'fields'}{'message_index'} = $profile->{'18'}{'fields'}{'254'};
$profile->{'18'}{'fields'}{'nec_lat'} = $profile->{'18'}{'fields'}{'29'};
$profile->{'18'}{'fields'}{'nec_long'} = $profile->{'18'}{'fields'}{'30'};
$profile->{'18'}{'fields'}{'num_laps'} = $profile->{'18'}{'fields'}{'26'};
$profile->{'18'}{'fields'}{'sport'} = $profile->{'18'}{'fields'}{'5'};
$profile->{'18'}{'fields'}{'start_position_lat'} = $profile->{'18'}{'fields'}{'3'};
$profile->{'18'}{'fields'}{'start_position_long'} = $profile->{'18'}{'fields'}{'4'};
$profile->{'18'}{'fields'}{'start_time'} = $profile->{'18'}{'fields'}{'2'};
$profile->{'18'}{'fields'}{'sub_sport'} = $profile->{'18'}{'fields'}{'6'};
$profile->{'18'}{'fields'}{'swc_lat'} = $profile->{'18'}{'fields'}{'31'};
$profile->{'18'}{'fields'}{'swc_long'} = $profile->{'18'}{'fields'}{'32'};
$profile->{'18'}{'fields'}{'timestamp'} = $profile->{'18'}{'fields'}{'253'};
$profile->{'18'}{'fields'}{'total_ascent'} = $profile->{'18'}{'fields'}{'22'};
$profile->{'18'}{'fields'}{'total_calories'} = $profile->{'18'}{'fields'}{'11'};
$profile->{'18'}{'fields'}{'total_cycles'} = $profile->{'18'}{'fields'}{'10'};
$profile->{'18'}{'fields'}{'total_descent'} = $profile->{'18'}{'fields'}{'23'};
$profile->{'18'}{'fields'}{'total_distance'} = $profile->{'18'}{'fields'}{'9'};
$profile->{'18'}{'fields'}{'total_elapsed_time'} = $profile->{'18'}{'fields'}{'7'};
$profile->{'18'}{'fields'}{'total_fat_calories'} = $profile->{'18'}{'fields'}{'13'};
$profile->{'18'}{'fields'}{'total_timer_time'} = $profile->{'18'}{'fields'}{'8'};
$profile->{'18'}{'fields'}{'total_training_effect'} = $profile->{'18'}{'fields'}{'24'};
$profile->{'18'}{'fields'}{'trigger'} = $profile->{'18'}{'fields'}{'28'};
$profile->{'19'}{'fields'}{'0'}{'type'} = $types->{'event'};
$profile->{'19'}{'fields'}{'1'}{'type'} = $types->{'event_type'};
$profile->{'19'}{'fields'}{'10'}{'type'} = $types->{'uint32'};
$profile->{'19'}{'fields'}{'11'}{'type'} = $types->{'uint16'};
$profile->{'19'}{'fields'}{'12'}{'type'} = $types->{'uint16'};
$profile->{'19'}{'fields'}{'13'}{'type'} = $types->{'uint16'};
$profile->{'19'}{'fields'}{'14'}{'type'} = $types->{'uint16'};
$profile->{'19'}{'fields'}{'15'}{'type'} = $types->{'uint8'};
$profile->{'19'}{'fields'}{'16'}{'type'} = $types->{'uint8'};
$profile->{'19'}{'fields'}{'17'}{'type'} = $types->{'uint8'};
$profile->{'19'}{'fields'}{'18'}{'type'} = $types->{'uint8'};
$profile->{'19'}{'fields'}{'19'}{'type'} = $types->{'uint16'};
$profile->{'19'}{'fields'}{'2'}{'type'} = $types->{'date_time'};
$profile->{'19'}{'fields'}{'20'}{'type'} = $types->{'uint16'};
$profile->{'19'}{'fields'}{'21'}{'type'} = $types->{'uint16'};
$profile->{'19'}{'fields'}{'22'}{'type'} = $types->{'uint16'};
$profile->{'19'}{'fields'}{'23'}{'type'} = $types->{'intensity'};
$profile->{'19'}{'fields'}{'24'}{'type'} = $types->{'lap_trigger'};
$profile->{'19'}{'fields'}{'25'}{'type'} = $types->{'sport'};
$profile->{'19'}{'fields'}{'253'}{'type'} = $types->{'date_time'};
$profile->{'19'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'19'}{'fields'}{'26'}{'type'} = $types->{'uint8'};
$profile->{'19'}{'fields'}{'27'}{'type'} = $types->{'sint32'};
$profile->{'19'}{'fields'}{'28'}{'type'} = $types->{'sint32'};
$profile->{'19'}{'fields'}{'29'}{'type'} = $types->{'sint32'};
$profile->{'19'}{'fields'}{'3'}{'type'} = $types->{'sint32'};
$profile->{'19'}{'fields'}{'30'}{'type'} = $types->{'sint32'};
$profile->{'19'}{'fields'}{'4'}{'type'} = $types->{'sint32'};
$profile->{'19'}{'fields'}{'5'}{'type'} = $types->{'sint32'};
$profile->{'19'}{'fields'}{'6'}{'type'} = $types->{'sint32'};
$profile->{'19'}{'fields'}{'7'}{'type'} = $types->{'uint32'};
$profile->{'19'}{'fields'}{'8'}{'type'} = $types->{'uint32'};
$profile->{'19'}{'fields'}{'9'}{'type'} = $types->{'uint32'};
$profile->{'19'}{'fields'}{'avg_cadence'} = $profile->{'19'}{'fields'}{'17'};
$profile->{'19'}{'fields'}{'avg_heart_rate'} = $profile->{'19'}{'fields'}{'15'};
$profile->{'19'}{'fields'}{'avg_power'} = $profile->{'19'}{'fields'}{'19'};
$profile->{'19'}{'fields'}{'avg_speed'} = $profile->{'19'}{'fields'}{'13'};
$profile->{'19'}{'fields'}{'end_position_lat'} = $profile->{'19'}{'fields'}{'5'};
$profile->{'19'}{'fields'}{'end_position_long'} = $profile->{'19'}{'fields'}{'6'};
$profile->{'19'}{'fields'}{'event'} = $profile->{'19'}{'fields'}{'0'};
$profile->{'19'}{'fields'}{'event_group'} = $profile->{'19'}{'fields'}{'26'};
$profile->{'19'}{'fields'}{'event_type'} = $profile->{'19'}{'fields'}{'1'};
$profile->{'19'}{'fields'}{'intensity'} = $profile->{'19'}{'fields'}{'23'};
$profile->{'19'}{'fields'}{'lap_trigger'} = $profile->{'19'}{'fields'}{'24'};
$profile->{'19'}{'fields'}{'max_cadence'} = $profile->{'19'}{'fields'}{'18'};
$profile->{'19'}{'fields'}{'max_heart_rate'} = $profile->{'19'}{'fields'}{'16'};
$profile->{'19'}{'fields'}{'max_power'} = $profile->{'19'}{'fields'}{'20'};
$profile->{'19'}{'fields'}{'max_speed'} = $profile->{'19'}{'fields'}{'14'};
$profile->{'19'}{'fields'}{'message_index'} = $profile->{'19'}{'fields'}{'254'};
$profile->{'19'}{'fields'}{'nec_lat'} = $profile->{'19'}{'fields'}{'27'};
$profile->{'19'}{'fields'}{'nec_long'} = $profile->{'19'}{'fields'}{'28'};
$profile->{'19'}{'fields'}{'sport'} = $profile->{'19'}{'fields'}{'25'};
$profile->{'19'}{'fields'}{'start_position_lat'} = $profile->{'19'}{'fields'}{'3'};
$profile->{'19'}{'fields'}{'start_position_long'} = $profile->{'19'}{'fields'}{'4'};
$profile->{'19'}{'fields'}{'start_time'} = $profile->{'19'}{'fields'}{'2'};
$profile->{'19'}{'fields'}{'swc_lat'} = $profile->{'19'}{'fields'}{'29'};
$profile->{'19'}{'fields'}{'swc_long'} = $profile->{'19'}{'fields'}{'30'};
$profile->{'19'}{'fields'}{'timestamp'} = $profile->{'19'}{'fields'}{'253'};
$profile->{'19'}{'fields'}{'total_ascent'} = $profile->{'19'}{'fields'}{'21'};
$profile->{'19'}{'fields'}{'total_calories'} = $profile->{'19'}{'fields'}{'11'};
$profile->{'19'}{'fields'}{'total_cycles'} = $profile->{'19'}{'fields'}{'10'};
$profile->{'19'}{'fields'}{'total_descent'} = $profile->{'19'}{'fields'}{'22'};
$profile->{'19'}{'fields'}{'total_distance'} = $profile->{'19'}{'fields'}{'9'};
$profile->{'19'}{'fields'}{'total_elapsed_time'} = $profile->{'19'}{'fields'}{'7'};
$profile->{'19'}{'fields'}{'total_fat_calories'} = $profile->{'19'}{'fields'}{'12'};
$profile->{'19'}{'fields'}{'total_timer_time'} = $profile->{'19'}{'fields'}{'8'};
$profile->{'2'}{'fields'}{'1'}{'type'} = $types->{'uint32'};
$profile->{'2'}{'fields'}{'utc_offset'} = $profile->{'2'}{'fields'}{'1'};
$profile->{'20'}{'fields'}{'0'}{'type'} = $types->{'sint32'};
$profile->{'20'}{'fields'}{'1'}{'type'} = $types->{'sint32'};
$profile->{'20'}{'fields'}{'10'}{'type'} = $types->{'uint8'};
$profile->{'20'}{'fields'}{'11'}{'type'} = $types->{'sint32'};
$profile->{'20'}{'fields'}{'12'}{'type'} = $types->{'uint8'};
$profile->{'20'}{'fields'}{'13'}{'type'} = $types->{'sint8'};
$profile->{'20'}{'fields'}{'2'}{'type'} = $types->{'uint16'};
$profile->{'20'}{'fields'}{'253'}{'type'} = $types->{'date_time'};
$profile->{'20'}{'fields'}{'3'}{'type'} = $types->{'uint8'};
$profile->{'20'}{'fields'}{'4'}{'type'} = $types->{'uint8'};
$profile->{'20'}{'fields'}{'5'}{'type'} = $types->{'uint32'};
$profile->{'20'}{'fields'}{'6'}{'type'} = $types->{'uint16'};
$profile->{'20'}{'fields'}{'7'}{'type'} = $types->{'uint16'};
$profile->{'20'}{'fields'}{'8'}{'type'} = $types->{'byte'};
$profile->{'20'}{'fields'}{'9'}{'type'} = $types->{'sint16'};
$profile->{'20'}{'fields'}{'altitude'} = $profile->{'20'}{'fields'}{'2'};
$profile->{'20'}{'fields'}{'cadence'} = $profile->{'20'}{'fields'}{'4'};
$profile->{'20'}{'fields'}{'compressed_speed_distance'} = $profile->{'20'}{'fields'}{'8'};
$profile->{'20'}{'fields'}{'cycle_length'} = $profile->{'20'}{'fields'}{'12'};
$profile->{'20'}{'fields'}{'distance'} = $profile->{'20'}{'fields'}{'5'};
$profile->{'20'}{'fields'}{'grade'} = $profile->{'20'}{'fields'}{'9'};
$profile->{'20'}{'fields'}{'heart_rate'} = $profile->{'20'}{'fields'}{'3'};
$profile->{'20'}{'fields'}{'position_lat'} = $profile->{'20'}{'fields'}{'0'};
$profile->{'20'}{'fields'}{'position_long'} = $profile->{'20'}{'fields'}{'1'};
$profile->{'20'}{'fields'}{'power'} = $profile->{'20'}{'fields'}{'7'};
$profile->{'20'}{'fields'}{'resistance'} = $profile->{'20'}{'fields'}{'10'};
$profile->{'20'}{'fields'}{'speed'} = $profile->{'20'}{'fields'}{'6'};
$profile->{'20'}{'fields'}{'temperature'} = $profile->{'20'}{'fields'}{'13'};
$profile->{'20'}{'fields'}{'time_from_course'} = $profile->{'20'}{'fields'}{'11'};
$profile->{'20'}{'fields'}{'timestamp'} = $profile->{'20'}{'fields'}{'253'};
$profile->{'21'}{'fields'}{'0'}{'type'} = $types->{'event'};
$profile->{'21'}{'fields'}{'1'}{'type'} = $types->{'event_type'};
$profile->{'21'}{'fields'}{'2'}{'type'} = $types->{'uint16'};
$profile->{'21'}{'fields'}{'253'}{'type'} = $types->{'date_time'};
$profile->{'21'}{'fields'}{'3'}{'type'} = $types->{'uint32'};
$profile->{'21'}{'fields'}{'4'}{'type'} = $types->{'uint8'};
$profile->{'21'}{'fields'}{'data'} = $profile->{'21'}{'fields'}{'3'};
$profile->{'21'}{'fields'}{'data16'} = $profile->{'21'}{'fields'}{'2'};
$profile->{'21'}{'fields'}{'event'} = $profile->{'21'}{'fields'}{'0'};
$profile->{'21'}{'fields'}{'event_group'} = $profile->{'21'}{'fields'}{'4'};
$profile->{'21'}{'fields'}{'event_type'} = $profile->{'21'}{'fields'}{'1'};
$profile->{'21'}{'fields'}{'timestamp'} = $profile->{'21'}{'fields'}{'253'};
$profile->{'23'}{'fields'}{'0'}{'type'} = $types->{'device_index'};
$profile->{'23'}{'fields'}{'1'}{'type'} = $types->{'device_type'};
$profile->{'23'}{'fields'}{'10'}{'type'} = $types->{'uint16'};
$profile->{'23'}{'fields'}{'11'}{'type'} = $types->{'battery_status'};
$profile->{'23'}{'fields'}{'2'}{'type'} = $types->{'manufacturer'};
$profile->{'23'}{'fields'}{'253'}{'type'} = $types->{'date_time'};
$profile->{'23'}{'fields'}{'3'}{'type'} = $types->{'uint32z'};
$profile->{'23'}{'fields'}{'4'}{'type'} = $types->{'uint16'};
$profile->{'23'}{'fields'}{'5'}{'type'} = $types->{'uint16'};
$profile->{'23'}{'fields'}{'6'}{'type'} = $types->{'uint8'};
$profile->{'23'}{'fields'}{'7'}{'type'} = $types->{'uint32'};
$profile->{'23'}{'fields'}{'battery_status'} = $profile->{'23'}{'fields'}{'11'};
$profile->{'23'}{'fields'}{'battery_voltage'} = $profile->{'23'}{'fields'}{'10'};
$profile->{'23'}{'fields'}{'cum_operating_time'} = $profile->{'23'}{'fields'}{'7'};
$profile->{'23'}{'fields'}{'device_index'} = $profile->{'23'}{'fields'}{'0'};
$profile->{'23'}{'fields'}{'device_type'} = $profile->{'23'}{'fields'}{'1'};
$profile->{'23'}{'fields'}{'hardware_version'} = $profile->{'23'}{'fields'}{'6'};
$profile->{'23'}{'fields'}{'manufacturer'} = $profile->{'23'}{'fields'}{'2'};
$profile->{'23'}{'fields'}{'product'} = $profile->{'23'}{'fields'}{'4'};
$profile->{'23'}{'fields'}{'serial_number'} = $profile->{'23'}{'fields'}{'3'};
$profile->{'23'}{'fields'}{'software_version'} = $profile->{'23'}{'fields'}{'5'};
$profile->{'23'}{'fields'}{'timestamp'} = $profile->{'23'}{'fields'}{'253'};
$profile->{'26'}{'fields'}{'4'}{'type'} = $types->{'sport'};
$profile->{'26'}{'fields'}{'5'}{'type'} = $types->{'workout_capabilities'};
$profile->{'26'}{'fields'}{'6'}{'type'} = $types->{'uint16'};
$profile->{'26'}{'fields'}{'8'}{'type'} = $types->{'string'};
$profile->{'26'}{'fields'}{'capabilities'} = $profile->{'26'}{'fields'}{'5'};
$profile->{'26'}{'fields'}{'num_valid_steps'} = $profile->{'26'}{'fields'}{'6'};
$profile->{'26'}{'fields'}{'sport'} = $profile->{'26'}{'fields'}{'4'};
$profile->{'26'}{'fields'}{'wkt_name'} = $profile->{'26'}{'fields'}{'8'};
$profile->{'27'}{'fields'}{'0'}{'type'} = $types->{'string'};
$profile->{'27'}{'fields'}{'1'}{'type'} = $types->{'wkt_step_duration'};
$profile->{'27'}{'fields'}{'2'}{'type'} = $types->{'uint32'};
$profile->{'27'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'27'}{'fields'}{'3'}{'type'} = $types->{'wkt_step_target'};
$profile->{'27'}{'fields'}{'4'}{'type'} = $types->{'uint32'};
$profile->{'27'}{'fields'}{'5'}{'type'} = $types->{'uint32'};
$profile->{'27'}{'fields'}{'6'}{'type'} = $types->{'uint32'};
$profile->{'27'}{'fields'}{'7'}{'type'} = $types->{'intensity'};
$profile->{'27'}{'fields'}{'custom_target_value_high'} = $profile->{'27'}{'fields'}{'6'};
$profile->{'27'}{'fields'}{'custom_target_value_low'} = $profile->{'27'}{'fields'}{'5'};
$profile->{'27'}{'fields'}{'duration_type'} = $profile->{'27'}{'fields'}{'1'};
$profile->{'27'}{'fields'}{'duration_value'} = $profile->{'27'}{'fields'}{'2'};
$profile->{'27'}{'fields'}{'intensity'} = $profile->{'27'}{'fields'}{'7'};
$profile->{'27'}{'fields'}{'message_index'} = $profile->{'27'}{'fields'}{'254'};
$profile->{'27'}{'fields'}{'target_type'} = $profile->{'27'}{'fields'}{'3'};
$profile->{'27'}{'fields'}{'target_value'} = $profile->{'27'}{'fields'}{'4'};
$profile->{'27'}{'fields'}{'wkt_step_name'} = $profile->{'27'}{'fields'}{'0'};
$profile->{'3'}{'fields'}{'0'}{'type'} = $types->{'string'};
$profile->{'3'}{'fields'}{'1'}{'type'} = $types->{'gender'};
$profile->{'3'}{'fields'}{'10'}{'type'} = $types->{'uint8'};
$profile->{'3'}{'fields'}{'11'}{'type'} = $types->{'uint8'};
$profile->{'3'}{'fields'}{'12'}{'type'} = $types->{'display_heart'};
$profile->{'3'}{'fields'}{'13'}{'type'} = $types->{'display_measure'};
$profile->{'3'}{'fields'}{'14'}{'type'} = $types->{'display_measure'};
$profile->{'3'}{'fields'}{'16'}{'type'} = $types->{'display_power'};
$profile->{'3'}{'fields'}{'17'}{'type'} = $types->{'activity_class'};
$profile->{'3'}{'fields'}{'18'}{'type'} = $types->{'display_position'};
$profile->{'3'}{'fields'}{'2'}{'type'} = $types->{'uint8'};
$profile->{'3'}{'fields'}{'21'}{'type'} = $types->{'display_measure'};
$profile->{'3'}{'fields'}{'22'}{'type'} = $types->{'user_local_id'};
$profile->{'3'}{'fields'}{'23'}{'type'} = $types->{'byte'};
$profile->{'3'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'3'}{'fields'}{'3'}{'type'} = $types->{'uint8'};
$profile->{'3'}{'fields'}{'4'}{'type'} = $types->{'uint16'};
$profile->{'3'}{'fields'}{'5'}{'type'} = $types->{'language'};
$profile->{'3'}{'fields'}{'6'}{'type'} = $types->{'display_measure'};
$profile->{'3'}{'fields'}{'7'}{'type'} = $types->{'display_measure'};
$profile->{'3'}{'fields'}{'8'}{'type'} = $types->{'uint8'};
$profile->{'3'}{'fields'}{'9'}{'type'} = $types->{'uint8'};
$profile->{'3'}{'fields'}{'activity_class'} = $profile->{'3'}{'fields'}{'17'};
$profile->{'3'}{'fields'}{'age'} = $profile->{'3'}{'fields'}{'2'};
$profile->{'3'}{'fields'}{'default_max_biking_heart_rate'} = $profile->{'3'}{'fields'}{'10'};
$profile->{'3'}{'fields'}{'default_max_heart_rate'} = $profile->{'3'}{'fields'}{'11'};
$profile->{'3'}{'fields'}{'default_max_running_heart_rate'} = $profile->{'3'}{'fields'}{'9'};
$profile->{'3'}{'fields'}{'dist_setting'} = $profile->{'3'}{'fields'}{'14'};
$profile->{'3'}{'fields'}{'elev_setting'} = $profile->{'3'}{'fields'}{'6'};
$profile->{'3'}{'fields'}{'friendly_name'} = $profile->{'3'}{'fields'}{'0'};
$profile->{'3'}{'fields'}{'gender'} = $profile->{'3'}{'fields'}{'1'};
$profile->{'3'}{'fields'}{'global_id'} = $profile->{'3'}{'fields'}{'23'};
$profile->{'3'}{'fields'}{'height'} = $profile->{'3'}{'fields'}{'3'};
$profile->{'3'}{'fields'}{'hr_setting'} = $profile->{'3'}{'fields'}{'12'};
$profile->{'3'}{'fields'}{'language'} = $profile->{'3'}{'fields'}{'5'};
$profile->{'3'}{'fields'}{'local_id'} = $profile->{'3'}{'fields'}{'22'};
$profile->{'3'}{'fields'}{'message_index'} = $profile->{'3'}{'fields'}{'254'};
$profile->{'3'}{'fields'}{'position_setting'} = $profile->{'3'}{'fields'}{'18'};
$profile->{'3'}{'fields'}{'power_setting'} = $profile->{'3'}{'fields'}{'16'};
$profile->{'3'}{'fields'}{'resting_heart_rate'} = $profile->{'3'}{'fields'}{'8'};
$profile->{'3'}{'fields'}{'speed_setting'} = $profile->{'3'}{'fields'}{'13'};
$profile->{'3'}{'fields'}{'temperature_setting'} = $profile->{'3'}{'fields'}{'21'};
$profile->{'3'}{'fields'}{'weight'} = $profile->{'3'}{'fields'}{'4'};
$profile->{'3'}{'fields'}{'weight_setting'} = $profile->{'3'}{'fields'}{'7'};
$profile->{'30'}{'fields'}{'0'}{'type'} = $types->{'weight'};
$profile->{'30'}{'fields'}{'1'}{'type'} = $types->{'uint16'};
$profile->{'30'}{'fields'}{'10'}{'type'} = $types->{'uint8'};
$profile->{'30'}{'fields'}{'11'}{'type'} = $types->{'uint8'};
$profile->{'30'}{'fields'}{'12'}{'type'} = $types->{'message_index'};
$profile->{'30'}{'fields'}{'2'}{'type'} = $types->{'uint16'};
$profile->{'30'}{'fields'}{'253'}{'type'} = $types->{'date_time'};
$profile->{'30'}{'fields'}{'3'}{'type'} = $types->{'uint16'};
$profile->{'30'}{'fields'}{'4'}{'type'} = $types->{'uint16'};
$profile->{'30'}{'fields'}{'5'}{'type'} = $types->{'uint16'};
$profile->{'30'}{'fields'}{'7'}{'type'} = $types->{'uint16'};
$profile->{'30'}{'fields'}{'8'}{'type'} = $types->{'uint8'};
$profile->{'30'}{'fields'}{'9'}{'type'} = $types->{'uint16'};
$profile->{'30'}{'fields'}{'active_met'} = $profile->{'30'}{'fields'}{'9'};
$profile->{'30'}{'fields'}{'basal_met'} = $profile->{'30'}{'fields'}{'7'};
$profile->{'30'}{'fields'}{'bone_mass'} = $profile->{'30'}{'fields'}{'4'};
$profile->{'30'}{'fields'}{'metabolic_age'} = $profile->{'30'}{'fields'}{'10'};
$profile->{'30'}{'fields'}{'muscle_mass'} = $profile->{'30'}{'fields'}{'5'};
$profile->{'30'}{'fields'}{'percent_fat'} = $profile->{'30'}{'fields'}{'1'};
$profile->{'30'}{'fields'}{'percent_hydration'} = $profile->{'30'}{'fields'}{'2'};
$profile->{'30'}{'fields'}{'physique_rating'} = $profile->{'30'}{'fields'}{'8'};
$profile->{'30'}{'fields'}{'timestamp'} = $profile->{'30'}{'fields'}{'253'};
$profile->{'30'}{'fields'}{'user_profile_index'} = $profile->{'30'}{'fields'}{'12'};
$profile->{'30'}{'fields'}{'visceral_fat_mass'} = $profile->{'30'}{'fields'}{'3'};
$profile->{'30'}{'fields'}{'visceral_fat_rating'} = $profile->{'30'}{'fields'}{'11'};
$profile->{'30'}{'fields'}{'weight'} = $profile->{'30'}{'fields'}{'0'};
$profile->{'31'}{'fields'}{'4'}{'type'} = $types->{'sport'};
$profile->{'31'}{'fields'}{'5'}{'type'} = $types->{'string'};
$profile->{'31'}{'fields'}{'6'}{'type'} = $types->{'course_capabilities'};
$profile->{'31'}{'fields'}{'capabilities'} = $profile->{'31'}{'fields'}{'6'};
$profile->{'31'}{'fields'}{'name'} = $profile->{'31'}{'fields'}{'5'};
$profile->{'31'}{'fields'}{'sport'} = $profile->{'31'}{'fields'}{'4'};
$profile->{'32'}{'fields'}{'1'}{'type'} = $types->{'date_time'};
$profile->{'32'}{'fields'}{'2'}{'type'} = $types->{'sint32'};
$profile->{'32'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'32'}{'fields'}{'3'}{'type'} = $types->{'sint32'};
$profile->{'32'}{'fields'}{'4'}{'type'} = $types->{'uint32'};
$profile->{'32'}{'fields'}{'5'}{'type'} = $types->{'course_point'};
$profile->{'32'}{'fields'}{'6'}{'type'} = $types->{'string'};
$profile->{'32'}{'fields'}{'distance'} = $profile->{'32'}{'fields'}{'4'};
$profile->{'32'}{'fields'}{'message_index'} = $profile->{'32'}{'fields'}{'254'};
$profile->{'32'}{'fields'}{'name'} = $profile->{'32'}{'fields'}{'6'};
$profile->{'32'}{'fields'}{'position_lat'} = $profile->{'32'}{'fields'}{'2'};
$profile->{'32'}{'fields'}{'position_long'} = $profile->{'32'}{'fields'}{'3'};
$profile->{'32'}{'fields'}{'timestamp'} = $profile->{'32'}{'fields'}{'1'};
$profile->{'32'}{'fields'}{'type'} = $profile->{'32'}{'fields'}{'5'};
$profile->{'33'}{'fields'}{'0'}{'type'} = $types->{'uint32'};
$profile->{'33'}{'fields'}{'1'}{'type'} = $types->{'uint32'};
$profile->{'33'}{'fields'}{'2'}{'type'} = $types->{'uint32'};
$profile->{'33'}{'fields'}{'253'}{'type'} = $types->{'date_time'};
$profile->{'33'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'33'}{'fields'}{'3'}{'type'} = $types->{'sport'};
$profile->{'33'}{'fields'}{'4'}{'type'} = $types->{'uint32'};
$profile->{'33'}{'fields'}{'calories'} = $profile->{'33'}{'fields'}{'2'};
$profile->{'33'}{'fields'}{'distance'} = $profile->{'33'}{'fields'}{'1'};
$profile->{'33'}{'fields'}{'elapsed_time'} = $profile->{'33'}{'fields'}{'4'};
$profile->{'33'}{'fields'}{'message_index'} = $profile->{'33'}{'fields'}{'254'};
$profile->{'33'}{'fields'}{'sport'} = $profile->{'33'}{'fields'}{'3'};
$profile->{'33'}{'fields'}{'timer_time'} = $profile->{'33'}{'fields'}{'0'};
$profile->{'33'}{'fields'}{'timestamp'} = $profile->{'33'}{'fields'}{'253'};
$profile->{'34'}{'fields'}{'0'}{'type'} = $types->{'uint32'};
$profile->{'34'}{'fields'}{'1'}{'type'} = $types->{'uint16'};
$profile->{'34'}{'fields'}{'2'}{'type'} = $types->{'activity'};
$profile->{'34'}{'fields'}{'253'}{'type'} = $types->{'date_time'};
$profile->{'34'}{'fields'}{'3'}{'type'} = $types->{'event'};
$profile->{'34'}{'fields'}{'4'}{'type'} = $types->{'event_type'};
$profile->{'34'}{'fields'}{'5'}{'type'} = $types->{'date_time'};
$profile->{'34'}{'fields'}{'6'}{'type'} = $types->{'uint8'};
$profile->{'34'}{'fields'}{'event'} = $profile->{'34'}{'fields'}{'3'};
$profile->{'34'}{'fields'}{'event_group'} = $profile->{'34'}{'fields'}{'6'};
$profile->{'34'}{'fields'}{'event_type'} = $profile->{'34'}{'fields'}{'4'};
$profile->{'34'}{'fields'}{'local_timestamp'} = $profile->{'34'}{'fields'}{'5'};
$profile->{'34'}{'fields'}{'num_sessions'} = $profile->{'34'}{'fields'}{'1'};
$profile->{'34'}{'fields'}{'timestamp'} = $profile->{'34'}{'fields'}{'253'};
$profile->{'34'}{'fields'}{'total_timer_time'} = $profile->{'34'}{'fields'}{'0'};
$profile->{'34'}{'fields'}{'type'} = $profile->{'34'}{'fields'}{'2'};
$profile->{'35'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'35'}{'fields'}{'3'}{'type'} = $types->{'uint16'};
$profile->{'35'}{'fields'}{'5'}{'type'} = $types->{'string'};
$profile->{'35'}{'fields'}{'message_index'} = $profile->{'35'}{'fields'}{'254'};
$profile->{'35'}{'fields'}{'part_number'} = $profile->{'35'}{'fields'}{'5'};
$profile->{'35'}{'fields'}{'version'} = $profile->{'35'}{'fields'}{'3'};
$profile->{'37'}{'fields'}{'0'}{'type'} = $types->{'file'};
$profile->{'37'}{'fields'}{'1'}{'type'} = $types->{'file_flags'};
$profile->{'37'}{'fields'}{'2'}{'type'} = $types->{'string'};
$profile->{'37'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'37'}{'fields'}{'3'}{'type'} = $types->{'uint16'};
$profile->{'37'}{'fields'}{'4'}{'type'} = $types->{'uint32'};
$profile->{'37'}{'fields'}{'directory'} = $profile->{'37'}{'fields'}{'2'};
$profile->{'37'}{'fields'}{'flags'} = $profile->{'37'}{'fields'}{'1'};
$profile->{'37'}{'fields'}{'max_count'} = $profile->{'37'}{'fields'}{'3'};
$profile->{'37'}{'fields'}{'max_size'} = $profile->{'37'}{'fields'}{'4'};
$profile->{'37'}{'fields'}{'message_index'} = $profile->{'37'}{'fields'}{'254'};
$profile->{'37'}{'fields'}{'type'} = $profile->{'37'}{'fields'}{'0'};
$profile->{'38'}{'fields'}{'0'}{'type'} = $types->{'file'};
$profile->{'38'}{'fields'}{'1'}{'type'} = $types->{'mesg_num'};
$profile->{'38'}{'fields'}{'2'}{'type'} = $types->{'mesg_count'};
$profile->{'38'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'38'}{'fields'}{'3'}{'type'} = $types->{'uint16'};
$profile->{'38'}{'fields'}{'count'} = $profile->{'38'}{'fields'}{'3'};
$profile->{'38'}{'fields'}{'count_type'} = $profile->{'38'}{'fields'}{'2'};
$profile->{'38'}{'fields'}{'file'} = $profile->{'38'}{'fields'}{'0'};
$profile->{'38'}{'fields'}{'mesg_num'} = $profile->{'38'}{'fields'}{'1'};
$profile->{'38'}{'fields'}{'message_index'} = $profile->{'38'}{'fields'}{'254'};
$profile->{'39'}{'fields'}{'0'}{'type'} = $types->{'file'};
$profile->{'39'}{'fields'}{'1'}{'type'} = $types->{'mesg_num'};
$profile->{'39'}{'fields'}{'2'}{'type'} = $types->{'uint8'};
$profile->{'39'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'39'}{'fields'}{'3'}{'type'} = $types->{'uint16'};
$profile->{'39'}{'fields'}{'count'} = $profile->{'39'}{'fields'}{'3'};
$profile->{'39'}{'fields'}{'field_num'} = $profile->{'39'}{'fields'}{'2'};
$profile->{'39'}{'fields'}{'file'} = $profile->{'39'}{'fields'}{'0'};
$profile->{'39'}{'fields'}{'mesg_num'} = $profile->{'39'}{'fields'}{'1'};
$profile->{'39'}{'fields'}{'message_index'} = $profile->{'39'}{'fields'}{'254'};
$profile->{'4'}{'fields'}{'0'}{'type'} = $types->{'bool'};
$profile->{'4'}{'fields'}{'1'}{'type'} = $types->{'uint16z'};
$profile->{'4'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'4'}{'fields'}{'enabled'} = $profile->{'4'}{'fields'}{'0'};
$profile->{'4'}{'fields'}{'hrm_ant_id'} = $profile->{'4'}{'fields'}{'1'};
$profile->{'4'}{'fields'}{'message_index'} = $profile->{'4'}{'fields'}{'254'};
$profile->{'49'}{'fields'}{'0'}{'type'} = $types->{'uint16'};
$profile->{'49'}{'fields'}{'1'}{'type'} = $types->{'uint8'};
$profile->{'49'}{'fields'}{'hardware_version'} = $profile->{'49'}{'fields'}{'1'};
$profile->{'49'}{'fields'}{'software_version'} = $profile->{'49'}{'fields'}{'0'};
$profile->{'5'}{'fields'}{'0'}{'type'} = $types->{'bool'};
$profile->{'5'}{'fields'}{'1'}{'type'} = $types->{'uint16z'};
$profile->{'5'}{'fields'}{'2'}{'type'} = $types->{'uint16'};
$profile->{'5'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'5'}{'fields'}{'3'}{'type'} = $types->{'uint32'};
$profile->{'5'}{'fields'}{'4'}{'type'} = $types->{'bool'};
$profile->{'5'}{'fields'}{'enabled'} = $profile->{'5'}{'fields'}{'0'};
$profile->{'5'}{'fields'}{'message_index'} = $profile->{'5'}{'fields'}{'254'};
$profile->{'5'}{'fields'}{'odometer'} = $profile->{'5'}{'fields'}{'3'};
$profile->{'5'}{'fields'}{'sdm_ant_id'} = $profile->{'5'}{'fields'}{'1'};
$profile->{'5'}{'fields'}{'sdm_cal_factor'} = $profile->{'5'}{'fields'}{'2'};
$profile->{'5'}{'fields'}{'speed_source'} = $profile->{'5'}{'fields'}{'4'};
$profile->{'51'}{'fields'}{'0'}{'type'} = $types->{'uint16'};
$profile->{'51'}{'fields'}{'1'}{'type'} = $types->{'uint16'};
$profile->{'51'}{'fields'}{'2'}{'type'} = $types->{'uint16'};
$profile->{'51'}{'fields'}{'253'}{'type'} = $types->{'date_time'};
$profile->{'51'}{'fields'}{'3'}{'type'} = $types->{'uint16'};
$profile->{'51'}{'fields'}{'4'}{'type'} = $types->{'uint16'};
$profile->{'51'}{'fields'}{'5'}{'type'} = $types->{'uint16'};
$profile->{'51'}{'fields'}{'6'}{'type'} = $types->{'uint8'};
$profile->{'51'}{'fields'}{'7'}{'type'} = $types->{'hr_type'};
$profile->{'51'}{'fields'}{'8'}{'type'} = $types->{'bp_status'};
$profile->{'51'}{'fields'}{'9'}{'type'} = $types->{'message_index'};
$profile->{'51'}{'fields'}{'diastolic_pressure'} = $profile->{'51'}{'fields'}{'1'};
$profile->{'51'}{'fields'}{'heart_rate'} = $profile->{'51'}{'fields'}{'6'};
$profile->{'51'}{'fields'}{'heart_rate_type'} = $profile->{'51'}{'fields'}{'7'};
$profile->{'51'}{'fields'}{'map_3_sample_mean'} = $profile->{'51'}{'fields'}{'3'};
$profile->{'51'}{'fields'}{'map_evening_values'} = $profile->{'51'}{'fields'}{'5'};
$profile->{'51'}{'fields'}{'map_morning_values'} = $profile->{'51'}{'fields'}{'4'};
$profile->{'51'}{'fields'}{'mean_arterial_pressure'} = $profile->{'51'}{'fields'}{'2'};
$profile->{'51'}{'fields'}{'status'} = $profile->{'51'}{'fields'}{'8'};
$profile->{'51'}{'fields'}{'systolic_pressure'} = $profile->{'51'}{'fields'}{'0'};
$profile->{'51'}{'fields'}{'timestamp'} = $profile->{'51'}{'fields'}{'253'};
$profile->{'51'}{'fields'}{'user_profile_index'} = $profile->{'51'}{'fields'}{'9'};
$profile->{'6'}{'fields'}{'0'}{'type'} = $types->{'string'};
$profile->{'6'}{'fields'}{'1'}{'type'} = $types->{'sport'};
$profile->{'6'}{'fields'}{'10'}{'type'} = $types->{'uint16'};
$profile->{'6'}{'fields'}{'11'}{'type'} = $types->{'uint16'};
$profile->{'6'}{'fields'}{'12'}{'type'} = $types->{'bool'};
$profile->{'6'}{'fields'}{'13'}{'type'} = $types->{'bool'};
$profile->{'6'}{'fields'}{'14'}{'type'} = $types->{'uint8'};
$profile->{'6'}{'fields'}{'15'}{'type'} = $types->{'bool'};
$profile->{'6'}{'fields'}{'16'}{'type'} = $types->{'bool'};
$profile->{'6'}{'fields'}{'17'}{'type'} = $types->{'bool'};
$profile->{'6'}{'fields'}{'18'}{'type'} = $types->{'bool'};
$profile->{'6'}{'fields'}{'2'}{'type'} = $types->{'sub_sport'};
$profile->{'6'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'6'}{'fields'}{'3'}{'type'} = $types->{'uint32'};
$profile->{'6'}{'fields'}{'4'}{'type'} = $types->{'uint16z'};
$profile->{'6'}{'fields'}{'5'}{'type'} = $types->{'uint16z'};
$profile->{'6'}{'fields'}{'6'}{'type'} = $types->{'uint16z'};
$profile->{'6'}{'fields'}{'7'}{'type'} = $types->{'uint16z'};
$profile->{'6'}{'fields'}{'8'}{'type'} = $types->{'uint16'};
$profile->{'6'}{'fields'}{'9'}{'type'} = $types->{'uint16'};
$profile->{'6'}{'fields'}{'auto_power_zero'} = $profile->{'6'}{'fields'}{'13'};
$profile->{'6'}{'fields'}{'auto_wheel_cal'} = $profile->{'6'}{'fields'}{'12'};
$profile->{'6'}{'fields'}{'auto_wheelsize'} = $profile->{'6'}{'fields'}{'9'};
$profile->{'6'}{'fields'}{'bike_cad_ant_id'} = $profile->{'6'}{'fields'}{'5'};
$profile->{'6'}{'fields'}{'bike_power_ant_id'} = $profile->{'6'}{'fields'}{'7'};
$profile->{'6'}{'fields'}{'bike_spd_ant_id'} = $profile->{'6'}{'fields'}{'4'};
$profile->{'6'}{'fields'}{'bike_spdcad_ant_id'} = $profile->{'6'}{'fields'}{'6'};
$profile->{'6'}{'fields'}{'bike_weight'} = $profile->{'6'}{'fields'}{'10'};
$profile->{'6'}{'fields'}{'cad_enabled'} = $profile->{'6'}{'fields'}{'16'};
$profile->{'6'}{'fields'}{'custom_wheelsize'} = $profile->{'6'}{'fields'}{'8'};
$profile->{'6'}{'fields'}{'id'} = $profile->{'6'}{'fields'}{'14'};
$profile->{'6'}{'fields'}{'message_index'} = $profile->{'6'}{'fields'}{'254'};
$profile->{'6'}{'fields'}{'name'} = $profile->{'6'}{'fields'}{'0'};
$profile->{'6'}{'fields'}{'odometer'} = $profile->{'6'}{'fields'}{'3'};
$profile->{'6'}{'fields'}{'power_cal_factor'} = $profile->{'6'}{'fields'}{'11'};
$profile->{'6'}{'fields'}{'power_enabled'} = $profile->{'6'}{'fields'}{'18'};
$profile->{'6'}{'fields'}{'spd_enabled'} = $profile->{'6'}{'fields'}{'15'};
$profile->{'6'}{'fields'}{'spdcad_enabled'} = $profile->{'6'}{'fields'}{'17'};
$profile->{'6'}{'fields'}{'sport'} = $profile->{'6'}{'fields'}{'1'};
$profile->{'6'}{'fields'}{'sub_sport'} = $profile->{'6'}{'fields'}{'2'};
$profile->{'7'}{'fields'}{'1'}{'type'} = $types->{'uint8'};
$profile->{'7'}{'fields'}{'2'}{'type'} = $types->{'uint8'};
$profile->{'7'}{'fields'}{'3'}{'type'} = $types->{'uint16'};
$profile->{'7'}{'fields'}{'5'}{'type'} = $types->{'hr_zone_calc'};
$profile->{'7'}{'fields'}{'7'}{'type'} = $types->{'pwr_zone_calc'};
$profile->{'7'}{'fields'}{'functional_threshold_power'} = $profile->{'7'}{'fields'}{'3'};
$profile->{'7'}{'fields'}{'hr_calc_type'} = $profile->{'7'}{'fields'}{'5'};
$profile->{'7'}{'fields'}{'max_heart_rate'} = $profile->{'7'}{'fields'}{'1'};
$profile->{'7'}{'fields'}{'pwr_calc_type'} = $profile->{'7'}{'fields'}{'7'};
$profile->{'7'}{'fields'}{'threshold_heart_rate'} = $profile->{'7'}{'fields'}{'2'};
$profile->{'8'}{'fields'}{'1'}{'type'} = $types->{'uint8'};
$profile->{'8'}{'fields'}{'2'}{'type'} = $types->{'string'};
$profile->{'8'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'8'}{'fields'}{'high_bpm'} = $profile->{'8'}{'fields'}{'1'};
$profile->{'8'}{'fields'}{'message_index'} = $profile->{'8'}{'fields'}{'254'};
$profile->{'8'}{'fields'}{'name'} = $profile->{'8'}{'fields'}{'2'};
$profile->{'9'}{'fields'}{'1'}{'type'} = $types->{'uint16'};
$profile->{'9'}{'fields'}{'2'}{'type'} = $types->{'string'};
$profile->{'9'}{'fields'}{'254'}{'type'} = $types->{'message_index'};
$profile->{'9'}{'fields'}{'high_value'} = $profile->{'9'}{'fields'}{'1'};
$profile->{'9'}{'fields'}{'message_index'} = $profile->{'9'}{'fields'}{'254'};
$profile->{'9'}{'fields'}{'name'} = $profile->{'9'}{'fields'}{'2'};
$profile->{'activity'} = $profile->{'34'};
$profile->{'bike_profile'} = $profile->{'6'};
$profile->{'blood_pressure'} = $profile->{'51'};
$profile->{'capabilities'} = $profile->{'1'};
$profile->{'course'} = $profile->{'31'};
$profile->{'course_point'} = $profile->{'32'};
$profile->{'device_info'} = $profile->{'23'};
$profile->{'device_settings'} = $profile->{'2'};
$profile->{'event'} = $profile->{'21'};
$profile->{'field_capabilities'} = $profile->{'39'};
$profile->{'file_capabilities'} = $profile->{'37'};
$profile->{'file_creator'} = $profile->{'49'};
$profile->{'file_id'} = $profile->{'0'};
$profile->{'goal'} = $profile->{'15'};
$profile->{'hr_zone'} = $profile->{'8'};
$profile->{'hrm_profile'} = $profile->{'4'};
$profile->{'lap'} = $profile->{'19'};
$profile->{'mesg_capabilities'} = $profile->{'38'};
$profile->{'met_zone'} = $profile->{'10'};
$profile->{'power_zone'} = $profile->{'9'};
$profile->{'record'} = $profile->{'20'};
$profile->{'sdm_profile'} = $profile->{'5'};
$profile->{'session'} = $profile->{'18'};
$profile->{'software'} = $profile->{'35'};
$profile->{'sport'} = $profile->{'12'};
$profile->{'totals'} = $profile->{'33'};
$profile->{'user_profile'} = $profile->{'3'};
$profile->{'weight_scale'} = $profile->{'30'};
$profile->{'workout'} = $profile->{'26'};
$profile->{'workout_step'} = $profile->{'27'};
$profile->{'zones_target'} = $profile->{'7'};
$crc16_low = [
  32768,	# 8000
  128,		# 0080
  40961,	# a001
  49249,	# c061
  59393,	# e801
  49193,	# c029
  56833,	# de01
  49183,	# c01f
  51329,	# c881
  24584,	# 6008
  50785,	# c661
  59399,	# e807
  49833,	# c2a9
  32258,	# 7e02
  49663,	# c1ff
  16513,	# 4081
  24704,	# 6080
  41057,	# a061
  59489,	# e861
  59433,	# e829
  56873,	# de29
  56863,	# de1f
  51359,	# c89f
  26760,	# 6888
  26216,	# 6668
  61031,	# ee67
  60079,	# eaaf
  31914,	# 7caa
  32764,	# 7ffc
  16767,	# 417f
  57344,	# e000
  224,		# 00e0
  34817,	# 8801
  49225,	# c049
  62977,	# f601
  49207,	# c037
  54913,	# d681
  24598,	# 6016
  52961,	# cee1
  18446,	# 480e
  50377,	# c4c9
  22020,	# 5604
  50007,	# c357
  65154,	# fe82
  24958,	# 617e
  8417,		# 20e1
  18656,	# 48e0
  34889,	# 8849
  63049,	# f649
  63031,	# f637
  54967,	# d6b7
  30358,	# 7696
  28406,	# 6ef6
  18158,	# 46ee
  19654,	# 4cc6
  21196,	# 52cc
  21842,	# 5552
  64980,	# fdd4
  24573,	# 5ffd
  33182,	# 819e
  43008,	# a800
  168,		# 00a8
  48641,	# be01
  49279,	# c07f
  57473,	# e081
  24608,	# 6020
  55393,	# d861
  59417,	# e819
  51753,	# ca29
  56843,	# de0b
  51103,	# c79f
  26759,	# 6887
  25128,	# 6228
  7778,		# 1e62
  59807,	# e99f
  26793,	# 68a9
  32424,	# 7ea8
  48767,	# be7f
  57599,	# e0ff
  16544,	# 40a0
  30784,	# 7840
  61561,	# f079
  57905,	# e231
  54307,	# d423
  55701,	# d995
  28441,	# 6f19
  51886,	# caae
  48203,	# bc4b
  14332,	# 37fc
  16695,	# 4137
  54784,	# d600
  214,		# 00d6
  40577,	# 9e81
  24670,	# 605e
  63713,	# f8e1
  18488,	# 4838
  53833,	# d249
  62995,	# f613
  52663,	# cdb7
  30349,	# 768d
  26038,	# 65b6
  46820,	# b6e4
  19382,	# 4bb6
  46794,	# b6ca
  22326,	# 5736
  5847,		# 16d7
  24150,	# 5e56
  16094,	# 3ede
  22718,	# 58be
  28888,	# 70d8
  23152,	# 5a70
  58459,	# e45b
  64421,	# fba5
  31547,	# 7b3b
  54074,	# d33a
  4947,		# 1353
  15699,	# 3d53
  15741,	# 3d7d
  8701,		# 21fd
  33248,	# 81e0
  34944,	# 8880
  41097,	# a089
  42593,	# a661
  59495,	# e867
  60073,	# eaa9
  32298,	# 7e2a
  57343,	# dfff
  16543,	# 409f
  26624,	# 6800
  104,		# 0068
  60929,	# ee01
  49199,	# c02f
  56449,	# dc81
  24604,	# 601c
  51553,	# c961
  59400,	# e808
  50921,	# c6e9
  36359,	# 8e07
  49871,	# c2cf
  21634,	# 5482
  25044,	# 61d4
  24417,	# 5f61
  59550,	# e89e
  43113,	# a869
  11880,	# 2e68
  60975,	# ee2f
  56495,	# dcaf
  31900,	# 7c9c
  27004,	# 697c
  57704,	# e168
  61152,	# eee0
  35055,	# 88ef
  36041,	# 8cc9
  22092,	# 564c
  62807,	# f557
  65204,	# feb4
  30718,	# 77fe
  33014,	# 80f6
  17920,	# 4600
  70,		# 0046
  62081,	# f281
  24626,	# 6032
  54753,	# d5e1
  18453,	# 4815
  53129,	# cf89
  42510,	# a60e
  50215,	# c427
  6788,		# 1a84
  25370,	# 631a
  52194,	# cbe2
  18763,	# 494b
  14089,	# 3709
  1783,		# 06f7
  34375,	# 8647
  12998,	# 32c6
  21170,	# 52b2
  30162,	# 75d2
  24053,	# 5df5
  18333,	# 479d
  43398,	# a986
  41512,	# a228
  7842,		# 1ea2
  47519,	# b99f
  26873,	# 68f9
  17064,	# 42a8
  48707,	# be43
  61951,	# f1ff
  16561,	# 40b1
  29824,	# 7480
  41077,	# a075
  59233,	# e761
  59430,	# e826
  55913,	# da69
  11802,	# 2e1a
  52143,	# cbaf
  31883,	# 7c8b
  26428,	# 673c
  4455,		# 1167
  59984,	# ea50
  15594,	# 3cea
  36797,	# 8fbd
  29007,	# 714f
  62512,	# f430
  5364,		# 14f4
  34581,	# 8715
  53062,	# cf46
  62030,	# f24e
  13426,	# 3472
  9652,		# 25b4
  30501,	# 7725
  56246,	# dbb6
  46682,	# b65a
  15158,	# 3b36
  5819,		# 16bb
  29526,	# 7356
  16115,	# 3ef3
  17790,	# 457e
  8389,		# 20c5
  21472,	# 53e0
  34898,	# 8852
  64777,	# fd09
  1597,		# 063d
  53703,	# d1c7
  37520,	# 9290
  27794,	# 6c92
  44525,	# aded
  19821,	# 4d6d
  60812,	# ed8c
  42476,	# a5ec
  36260,	# 8da4
  48012,	# bb8c
  42426,	# a5ba
  45860,	# b324
  7091,		# 1bb3
  46426,	# b55a
  15157,	# 3b35
  6139,		# 17fb
  33622,	# 8356
  15875,	# 3e03
  382,		# 017e
  8321,		# 2081
  24800,	# 60e0
  34913,	# 8861
  59465,	# e849
  63017,	# f629
  56887,	# de37
  54943,	# d69f
  26774,	# 6896
  28392,	# 6ee8
  20078,	# 4e6e
  60623,	# eccf
  21676,	# 54ac
  32084,	# 7d54
  65404,	# ff7c
  57854,	# e1fe
  32864,	# 8060
];
$crc16_high = [
  32768,	# 8000
  10368,	# 2880
  43137,	# a881
  31936,	# 7cc0
  18560,	# 4880
  46817,	# b6e1
  21152,	# 52a0
  27088,	# 69d0
  32897,	# 8081
  29800,	# 7468
  21544,	# 5428
  44573,	# ae1d
  17416,	# 4408
  29446,	# 7306
  37123,	# 9103
  26753,	# 6881
  16384,	# 4000
  5184,		# 1440
  62529,	# f441
  15968,	# 3e60
  9280,		# 2440
  64369,	# fb71
  10576,	# 2950
  13544,	# 34e8
  57409,	# e041
  14900,	# 3a34
  10772,	# 2a14
  63247,	# f70f
  8708,		# 2204
  14723,	# 3983
  59520,	# e880
  37953,	# 9441
  8192,		# 2000
  2592,		# 0a20
  55841,	# da21
  7984,		# 1f30
  4640,		# 1220
  56761,	# ddb9
  5288,		# 14a8
  6772,		# 1a74
  53281,	# d021
  7450,		# 1d1a
  5386,		# 150a
  56198,	# db86
  4354,		# 1102
  48320,	# bcc0
  29760,	# 7440
  59937,	# ea21
  4096,		# 1000
  1296,		# 0510
  52497,	# cd11
  3992,		# 0f98
  2320,		# 0910
  52957,	# cedd
  2644,		# 0a54
  3386,		# 0d3a
  51217,	# c811
  3725,		# 0e8d
  2693,		# 0a85
  28099,	# 6dc3
  2177,		# 0881
  24160,	# 5e60
  14880,	# 3a20
  54545,	# d511
  2048,		# 0800
  648,		# 0288
  50825,	# c689
  1996,		# 07cc
  1160,		# 0488
  51055,	# c76f
  1322,		# 052a
  1693,		# 069d
  50185,	# c409
  42823,	# a747
  42307,	# a543
  38624,	# 96e0
  42049,	# a441
  12080,	# 2f30
  7440,		# 1d10
  51849,	# ca89
  1024,		# 0400
  324,		# 0144
  49989,	# c345
  998,		# 03e6
  580,		# 0244
  50102,	# c3b6
  661,		# 0295
  41807,	# a34f
  49669,	# c205
  62370,	# f3a2
  62112,	# f2a0
  19312,	# 4b70
  61985,	# f221
  6040,		# 1798
  3720,		# 0e88
  50501,	# c545
  512,		# 0200
  162,		# 00a2
  49571,	# c1a3
  499,		# 01f3
  290,		# 0122
  25051,	# 61db
  41291,	# a14b
  61862,	# f1a6
  49411,	# c103
  31185,	# 79d1
  31056,	# 7950
  9656,		# 25b8
  55569,	# d911
  3020,		# 0bcc
  1860,		# 0744
  49827,	# c2a3
  256,		# 0100
  81,		# 0051
  49360,	# c0d0
  41208,	# a0f8
  145,		# 0091
  37100,	# 90ec
  61604,	# f0a4
  30931,	# 78d3
  49280,	# c080
  40169,	# 9ce9
  15528,	# 3ca8
  4828,		# 12dc
  52361,	# cc89
  1510,		# 05e6
  930,		# 03a2
  49488,	# c150
];
$crc16_modulo = 32767;
$all_units = {
  '%' => 1,
  'C' => 1,
  'V' => 1,
  'bpm' => 1,
  'bytes' => 1,
  'cycles' => 1,
  'kcal' => 1,
  'kcal/day' => 1,
  'kcal/min' => 1,
  'kg' => 1,
  'm' => 1,
  'm/s' => 1,
  'mmHg' => 1,
  'rpm' => 1,
  's' => 1,
  'semicircles' => 1,
  'watts' => 1,
  'years' => 1
};
# END GENERATED

1;
__END__
=cut
