package Garmin::FIT::Streamer::Profile;

use strict;
use warnings;

our $VERSION = "1.000";

package Garmin::FIT::Streamer::BaseType;
our $base_types;

package Garmin::FIT::Streamer::Type;
our $types;

package Garmin::FIT::Streamer::Profile;
our $profile;

sub types {
    return $types;
}

sub profile {
    return $profile;
}

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

$base_types = {
  '0' => bless( {
    'decoder' => [
      'C',
      'C'
    ],
    'invalid' => 255,
    'name' => 'enum',
    'number' => 0,
    'regex' => qr{^[0-9]+\z},
    'size' => 1
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '1' => bless( {
    'decoder' => [
      'c',
      'c'
    ],
    'invalid' => 127,
    'name' => 'sint8',
    'notice' => 1,
    'number' => 1,
    'regex' => qr{^[+-]?[0-9]+\z},
    'size' => 1
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '10' => bless( {
    'decoder' => [
      'C',
      'C'
    ],
    'invalid' => 0,
    'name' => 'uint8z',
    'notice' => 1,
    'number' => 10,
    'regex' => qr{^[0-9]+\z},
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
    'name' => 'sint16',
    'notice' => 1,
    'number' => 131,
    'regex' => qr{^[+-]?[0-9]+\z},
    'size' => 2
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '132' => bless( {
    'decoder' => [
      'v',
      'n'
    ],
    'invalid' => 65535,
    'name' => 'uint16',
    'number' => 132,
    'regex' => qr{^[0-9]+\z},
    'size' => 2
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '133' => bless( {
    'decoder' => [
      'V!',
      'N!'
    ],
    'invalid' => 2147483647,
    'name' => 'sint32',
    'notice' => 1,
    'number' => 133,
    'regex' => qr{^[+-]?[0-9]+\z},
    'size' => 4
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '134' => bless( {
    'decoder' => [
      'V',
      'N'
    ],
    'invalid' => 4294967295,
    'name' => 'uint32',
    'number' => 134,
    'regex' => qr{^[0-9]+\z},
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
    'invalid' => '1.84467440737096e+19',
    'name' => 'float64',
    'notice' => 1,
    'number' => 137,
    'regex' => qr{^[+-]?[0-9]+(?:\.[0-9]*)?(?:[eE][+-]?[0-9]+)\z},
    'size' => 4
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '139' => bless( {
    'decoder' => [
      'v',
      'n'
    ],
    'invalid' => 0,
    'name' => 'uint16z',
    'notice' => 1,
    'number' => 139,
    'regex' => qr{^[0-9]+\z},
    'size' => 2
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '140' => bless( {
    'decoder' => [
      'V',
      'N'
    ],
    'invalid' => 0,
    'name' => 'uint32z',
    'number' => 140,
    'regex' => qr{^[0-9]+\z},
    'size' => 4
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '2' => bless( {
    'decoder' => [
      'C',
      'C'
    ],
    'invalid' => 255,
    'name' => 'uint8',
    'number' => 2,
    'regex' => qr{^[0-9]+\z},
    'size' => 1
  }, 'Garmin::FIT::Streamer::BaseType' ),
  '7' => bless( {
    'decoder' => [
      'Z',
      'Z'
    ],
    'invalid' => 0,
    'name' => 'string',
    'notice' => 1,
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
  'activity' => {
    'base_type' => {},
    'name' => 'activity',
    'values' => {
      '0' => {
        'name' => 'manual',
        'number' => 0
      },
      '1' => {
        'name' => 'auto_multi_sport',
        'number' => 1
      },
      'auto_multi_sport' => {},
      'manual' => {}
    }
  },
  'activity_class' => {
    'base_type' => {},
    'name' => 'activity_class',
    'values' => {
      '100' => {
        'name' => 'level_max',
        'number' => 100
      },
      '127' => {
        'comment' => '0 to 100',
        'name' => 'level',
        'number' => 127
      },
      '128' => {
        'name' => 'athlete',
        'number' => 128
      },
      'athlete' => {},
      'level' => {},
      'level_max' => {}
    }
  },
  'autolap_trigger' => {
    'base_type' => {},
    'name' => 'autolap_trigger',
    'values' => {
      '0' => {
        'name' => 'time',
        'number' => 0
      },
      '1' => {
        'name' => 'distance',
        'number' => 1
      },
      '2' => {
        'name' => 'position_start',
        'number' => 2
      },
      '3' => {
        'name' => 'position_lap',
        'number' => 3
      },
      '4' => {
        'name' => 'position_waypoint',
        'number' => 4
      },
      '5' => {
        'name' => 'position_marked',
        'number' => 5
      },
      '6' => {
        'name' => 'off',
        'number' => 6
      },
      'distance' => {},
      'off' => {},
      'position_lap' => {},
      'position_marked' => {},
      'position_start' => {},
      'position_waypoint' => {},
      'time' => {}
    }
  },
  'battery_status' => {
    'base_type' => {},
    'name' => 'battery_status',
    'values' => {
      '1' => {
        'name' => 'new',
        'number' => 1
      },
      '2' => {
        'name' => 'good',
        'number' => 2
      },
      '3' => {
        'name' => 'ok',
        'number' => 3
      },
      '4' => {
        'name' => 'low',
        'number' => 4
      },
      '5' => {
        'name' => 'critical',
        'number' => 5
      },
      'critical' => {},
      'good' => {},
      'low' => {},
      'new' => {},
      'ok' => {}
    }
  },
  'bool' => {
    'base_type' => {},
    'name' => 'bool',
    'values' => {
      '0' => {
        'name' => 'no',
        'number' => 0
      },
      '1' => {
        'name' => 'yes',
        'number' => 1
      },
      'no' => {},
      'yes' => {}
    }
  },
  'bp_status' => {
    'base_type' => {},
    'name' => 'bp_status',
    'values' => {
      '0' => {
        'name' => 'no_error',
        'number' => 0
      },
      '1' => {
        'name' => 'error_incomplete_data',
        'number' => 1
      },
      '2' => {
        'name' => 'error_no_measurement',
        'number' => 2
      },
      '3' => {
        'name' => 'error_data_out_of_range',
        'number' => 3
      },
      '4' => {
        'name' => 'error_irregular_heart_rate',
        'number' => 4
      },
      'error_data_out_of_range' => {},
      'error_incomplete_data' => {},
      'error_irregular_heart_rate' => {},
      'error_no_measurement' => {},
      'no_error' => {}
    }
  },
  'byte' => {
    'base_type' => {},
    'name' => 'byte',
    'values' => {}
  },
  'course_capabilities' => {
    'base_type' => {},
    'name' => 'course_capabilities',
    'values' => {
      '1' => {
        'name' => 'processed',
        'number' => 1
      },
      '128' => {
        'name' => 'cadence',
        'number' => 128
      },
      '16' => {
        'name' => 'position',
        'number' => 16
      },
      '2' => {
        'name' => 'valid',
        'number' => 2
      },
      '256' => {
        'name' => 'training',
        'number' => 256
      },
      '32' => {
        'name' => 'heart_rate',
        'number' => 32
      },
      '4' => {
        'name' => 'time',
        'number' => 4
      },
      '512' => {
        'name' => 'navigation',
        'number' => 512
      },
      '64' => {
        'name' => 'power',
        'number' => 64
      },
      '8' => {
        'name' => 'distance',
        'number' => 8
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
  },
  'course_point' => {
    'base_type' => {},
    'name' => 'course_point',
    'values' => {
      '0' => {
        'name' => 'generic',
        'number' => 0
      },
      '1' => {
        'name' => 'summit',
        'number' => 1
      },
      '10' => {
        'name' => 'fourth_category',
        'number' => 10
      },
      '11' => {
        'name' => 'third_category',
        'number' => 11
      },
      '12' => {
        'name' => 'second_category',
        'number' => 12
      },
      '13' => {
        'name' => 'first_category',
        'number' => 13
      },
      '14' => {
        'name' => 'hors_category',
        'number' => 14
      },
      '15' => {
        'name' => 'sprint',
        'number' => 15
      },
      '16' => {
        'name' => 'left_fork',
        'number' => 16
      },
      '17' => {
        'name' => 'right_fork',
        'number' => 17
      },
      '18' => {
        'name' => 'middle_fork',
        'number' => 18
      },
      '2' => {
        'name' => 'valley',
        'number' => 2
      },
      '3' => {
        'name' => 'water',
        'number' => 3
      },
      '4' => {
        'name' => 'food',
        'number' => 4
      },
      '5' => {
        'name' => 'danger',
        'number' => 5
      },
      '6' => {
        'name' => 'left',
        'number' => 6
      },
      '7' => {
        'name' => 'right',
        'number' => 7
      },
      '8' => {
        'name' => 'straight',
        'number' => 8
      },
      '9' => {
        'name' => 'first_aid',
        'number' => 9
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
  },
  'date_time' => {
    'base_type' => {},
    'comment' => 'seconds since UTC 00:00 Dec 31 1989',
    'name' => 'date_time',
    'values' => {
      '268435456' => {
        'comment' => 'if date_time is < 0x10000000 then it is system time (seconds from device power on)',
        'name' => 'min',
        'number' => 268435456
      },
      'min' => {}
    }
  },
  'device_index' => {
    'base_type' => {},
    'name' => 'device_index',
    'values' => {
      '0' => {
        'comment' => 'Creator of the file is always device index 0.',
        'name' => 'creator',
        'number' => 0
      },
      'creator' => {}
    }
  },
  'device_type' => {
    'base_type' => {},
    'name' => 'device_type',
    'values' => {
      '1' => {
        'name' => 'antfs',
        'number' => 1
      },
      '11' => {
        'name' => 'bike_power',
        'number' => 11
      },
      '119' => {
        'name' => 'weight_scale',
        'number' => 119
      },
      '12' => {
        'name' => 'environment_sensor',
        'number' => 12
      },
      '120' => {
        'name' => 'heart_rate',
        'number' => 120
      },
      '121' => {
        'name' => 'bike_speed_cadence',
        'number' => 121
      },
      '122' => {
        'name' => 'bike_cadence',
        'number' => 122
      },
      '123' => {
        'name' => 'bike_speed',
        'number' => 123
      },
      '124' => {
        'name' => 'stride_speed_distance',
        'number' => 124
      },
      '15' => {
        'name' => 'multi_sport_speed_distance',
        'number' => 15
      },
      '17' => {
        'name' => 'fitness_equipment',
        'number' => 17
      },
      '18' => {
        'name' => 'blood_pressure',
        'number' => 18
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
  },
  'display_heart' => {
    'base_type' => {},
    'name' => 'display_heart',
    'values' => {
      '0' => {
        'name' => 'bpm',
        'number' => 0
      },
      '1' => {
        'name' => 'max',
        'number' => 1
      },
      '2' => {
        'name' => 'reserve',
        'number' => 2
      },
      'bpm' => {},
      'max' => {},
      'reserve' => {}
    }
  },
  'display_measure' => {
    'base_type' => {},
    'name' => 'display_measure',
    'values' => {
      '0' => {
        'name' => 'metric',
        'number' => 0
      },
      '1' => {
        'name' => 'statute',
        'number' => 1
      },
      'metric' => {},
      'statute' => {}
    }
  },
  'display_position' => {
    'base_type' => {},
    'name' => 'display_position',
    'values' => {
      '0' => {
        'comment' => 'dd.dddddd',
        'name' => 'degree',
        'number' => 0
      },
      '1' => {
        'comment' => 'dddmm.mmm',
        'name' => 'degree_minute',
        'number' => 1
      },
      '10' => {
        'comment' => 'Indonesian Equatorial LCO',
        'name' => 'indonesian_equatorial',
        'number' => 10
      },
      '11' => {
        'comment' => 'Indonesian Irian LCO',
        'name' => 'indonesian_irian',
        'number' => 11
      },
      '12' => {
        'comment' => 'Indonesian Southern LCO',
        'name' => 'indonesian_southern',
        'number' => 12
      },
      '13' => {
        'comment' => 'India zone 0',
        'name' => 'india_zone_0',
        'number' => 13
      },
      '14' => {
        'comment' => 'India zone IA',
        'name' => 'india_zone_IA',
        'number' => 14
      },
      '15' => {
        'comment' => 'India zone IB',
        'name' => 'india_zone_IB',
        'number' => 15
      },
      '16' => {
        'comment' => 'India zone IIA',
        'name' => 'india_zone_IIA',
        'number' => 16
      },
      '17' => {
        'comment' => 'India zone IIB',
        'name' => 'india_zone_IIB',
        'number' => 17
      },
      '18' => {
        'comment' => 'India zone IIIA',
        'name' => 'india_zone_IIIA',
        'number' => 18
      },
      '19' => {
        'comment' => 'India zone IIIB',
        'name' => 'india_zone_IIIB',
        'number' => 19
      },
      '2' => {
        'comment' => 'dddmmss',
        'name' => 'degree_minute_second',
        'number' => 2
      },
      '20' => {
        'comment' => 'India zone IVA',
        'name' => 'india_zone_IVA',
        'number' => 20
      },
      '21' => {
        'comment' => 'India zone IVB',
        'name' => 'india_zone_IVB',
        'number' => 21
      },
      '22' => {
        'comment' => 'Irish Transverse Mercator',
        'name' => 'irish_transverse',
        'number' => 22
      },
      '23' => {
        'comment' => 'Irish Grid',
        'name' => 'irish_grid',
        'number' => 23
      },
      '24' => {
        'comment' => 'Loran TD',
        'name' => 'loran',
        'number' => 24
      },
      '25' => {
        'comment' => 'Maidenhead grid system',
        'name' => 'maidenhead_grid',
        'number' => 25
      },
      '26' => {
        'comment' => 'MGRS grid system',
        'name' => 'mgrs_grid',
        'number' => 26
      },
      '27' => {
        'comment' => 'New Zealand grid system',
        'name' => 'new_zealand_grid',
        'number' => 27
      },
      '28' => {
        'comment' => 'New Zealand Transverse Mercator',
        'name' => 'new_zealand_transverse',
        'number' => 28
      },
      '29' => {
        'comment' => 'Qatar National Grid',
        'name' => 'qatar_grid',
        'number' => 29
      },
      '3' => {
        'comment' => 'Austrian Grid (BMN)',
        'name' => 'austrian_grid',
        'number' => 3
      },
      '30' => {
        'comment' => 'Modified RT-90 (Sweden)',
        'name' => 'modified_swedish_grid',
        'number' => 30
      },
      '31' => {
        'comment' => 'RT-90 (Sweden)',
        'name' => 'swedish_grid',
        'number' => 31
      },
      '32' => {
        'comment' => 'South African Grid',
        'name' => 'south_african_grid',
        'number' => 32
      },
      '33' => {
        'comment' => 'Swiss CH-1903 grid',
        'name' => 'swiss_grid',
        'number' => 33
      },
      '34' => {
        'comment' => 'Taiwan Grid',
        'name' => 'taiwan_grid',
        'number' => 34
      },
      '35' => {
        'comment' => 'United States National Grid',
        'name' => 'united_states_grid',
        'number' => 35
      },
      '36' => {
        'comment' => 'UTM/UPS grid system',
        'name' => 'utm_ups_grid',
        'number' => 36
      },
      '37' => {
        'comment' => 'West Malayan RSO',
        'name' => 'west_malayan',
        'number' => 37
      },
      '38' => {
        'comment' => 'Borneo RSO',
        'name' => 'borneo_rso',
        'number' => 38
      },
      '39' => {
        'comment' => 'Estonian grid system',
        'name' => 'estonian_grid',
        'number' => 39
      },
      '4' => {
        'comment' => 'British National Grid',
        'name' => 'british_grid',
        'number' => 4
      },
      '40' => {
        'comment' => 'Latvian Transverse Mercator',
        'name' => 'latvian_grid',
        'number' => 40
      },
      '41' => {
        'comment' => 'Reference Grid 99 TM (Swedish)',
        'name' => 'swedish_ref_99_grid',
        'number' => 41
      },
      '5' => {
        'comment' => 'Dutch grid system',
        'name' => 'dutch_grid',
        'number' => 5
      },
      '6' => {
        'comment' => 'Hungarian grid system',
        'name' => 'hungarian_grid',
        'number' => 6
      },
      '7' => {
        'comment' => 'Finnish grid system Zone3 KKJ27',
        'name' => 'finnish_grid',
        'number' => 7
      },
      '8' => {
        'comment' => 'Gausss Krueger (German)',
        'name' => 'german_grid',
        'number' => 8
      },
      '9' => {
        'comment' => 'Icelandic Grid',
        'name' => 'icelandic_grid',
        'number' => 9
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
  },
  'display_power' => {
    'base_type' => {},
    'name' => 'display_power',
    'values' => {
      '0' => {
        'name' => 'watts',
        'number' => 0
      },
      '1' => {
        'name' => 'percent_ftp',
        'number' => 1
      },
      'percent_ftp' => {},
      'watts' => {}
    }
  },
  'enum' => {
    'base_type' => {},
    'name' => 'enum',
    'values' => {}
  },
  'event' => {
    'base_type' => {},
    'name' => 'event',
    'values' => {
      '0' => {
        'comment' => 'Group 0.  Start / stop_all',
        'name' => 'timer',
        'number' => 0
      },
      '10' => {
        'comment' => 'marker',
        'name' => 'course_point',
        'number' => 10
      },
      '11' => {
        'comment' => 'marker',
        'name' => 'battery',
        'number' => 11
      },
      '12' => {
        'comment' => 'Group 1. Start at beginning of activity if VP enabled, when VP pace is changed during activity or VP enabled mid activity.  stop_disable when VP disabled.',
        'name' => 'virtual_partner_pace',
        'number' => 12
      },
      '13' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'hr_high_alert',
        'number' => 13
      },
      '14' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'hr_low_alert',
        'number' => 14
      },
      '15' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'speed_high_alert',
        'number' => 15
      },
      '16' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'speed_low_alert',
        'number' => 16
      },
      '17' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'cad_high_alert',
        'number' => 17
      },
      '18' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'cad_low_alert',
        'number' => 18
      },
      '19' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'power_high_alert',
        'number' => 19
      },
      '20' => {
        'comment' => 'Group 0.  Start / stop when in alert condition.',
        'name' => 'power_low_alert',
        'number' => 20
      },
      '21' => {
        'comment' => 'marker',
        'name' => 'recovery_hr',
        'number' => 21
      },
      '22' => {
        'comment' => 'marker',
        'name' => 'battery_low',
        'number' => 22
      },
      '23' => {
        'comment' => 'Group 1.  Start if enabled mid activity (not required at start of activity). Stop when duration is reached.  stop_disable if disabled.',
        'name' => 'time_duration_alert',
        'number' => 23
      },
      '24' => {
        'comment' => 'Group 1.  Start if enabled mid activity (not required at start of activity). Stop when duration is reached.  stop_disable if disabled.',
        'name' => 'distance_duration_alert',
        'number' => 24
      },
      '25' => {
        'comment' => 'Group 1.  Start if enabled mid activity (not required at start of activity). Stop when duration is reached.  stop_disable if disabled.',
        'name' => 'calorie_duration_alert',
        'number' => 25
      },
      '26' => {
        'comment' => 'Group 1..  Stop at end of activity.',
        'name' => 'activity',
        'number' => 26
      },
      '27' => {
        'comment' => 'marker',
        'name' => 'fitness_equipment',
        'number' => 27
      },
      '3' => {
        'comment' => 'start / stop',
        'name' => 'workout',
        'number' => 3
      },
      '4' => {
        'comment' => 'Start at beginning of workout.  Stop at end of each step.',
        'name' => 'workout_step',
        'number' => 4
      },
      '5' => {
        'comment' => 'stop_all group 0',
        'name' => 'power_down',
        'number' => 5
      },
      '6' => {
        'comment' => 'stop_all group 0',
        'name' => 'power_up',
        'number' => 6
      },
      '7' => {
        'comment' => 'start / stop group 0',
        'name' => 'off_course',
        'number' => 7
      },
      '8' => {
        'comment' => 'Stop at end of each session.',
        'name' => 'session',
        'number' => 8
      },
      '9' => {
        'comment' => 'Stop at end of each lap.',
        'name' => 'lap',
        'number' => 9
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
  },
  'event_type' => {
    'base_type' => {},
    'name' => 'event_type',
    'values' => {
      '0' => {
        'name' => 'start',
        'number' => 0
      },
      '1' => {
        'name' => 'stop',
        'number' => 1
      },
      '2' => {
        'name' => 'consecutive_depreciated',
        'number' => 2
      },
      '3' => {
        'name' => 'marker',
        'number' => 3
      },
      '4' => {
        'name' => 'stop_all',
        'number' => 4
      },
      '5' => {
        'name' => 'begin_depreciated',
        'number' => 5
      },
      '6' => {
        'name' => 'end_depreciated',
        'number' => 6
      },
      '7' => {
        'name' => 'end_all_depreciated',
        'number' => 7
      },
      '8' => {
        'name' => 'stop_disable',
        'number' => 8
      },
      '9' => {
        'name' => 'stop_disable_all',
        'number' => 9
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
  },
  'file' => {
    'base_type' => {},
    'name' => 'file',
    'values' => {
      '1' => {
        'comment' => 'Read only, single file. Must be in root directory.',
        'name' => 'device',
        'number' => 1
      },
      '10' => {
        'comment' => 'Read only, single file. Directory=Totals',
        'name' => 'totals',
        'number' => 10
      },
      '11' => {
        'comment' => 'Read/write, single file. Directory=Goals',
        'name' => 'goals',
        'number' => 11
      },
      '14' => {
        'comment' => 'Read only. Directory=Blood Pressure',
        'name' => 'blood_pressure',
        'number' => 14
      },
      '2' => {
        'comment' => 'Read/write, single file. Directory=Settings',
        'name' => 'settings',
        'number' => 2
      },
      '20' => {
        'comment' => 'Read/erase, multiple files. Directory=Activities',
        'name' => 'activity_summary',
        'number' => 20
      },
      '3' => {
        'comment' => 'Read/write, multiple files, file number = sport type. Directory=Sports',
        'name' => 'sport',
        'number' => 3
      },
      '4' => {
        'comment' => 'Read/erase, multiple files. Directory=Activities',
        'name' => 'activity',
        'number' => 4
      },
      '5' => {
        'comment' => 'Read/write/erase, multiple files. Directory=Workouts',
        'name' => 'workout',
        'number' => 5
      },
      '6' => {
        'comment' => 'Read/write/erase, multiple files. Directory=Courses',
        'name' => 'course',
        'number' => 6
      },
      '9' => {
        'comment' => 'Read only, single file. Circular buffer. All message definitions at start of file. Directory=Weight',
        'name' => 'weight',
        'number' => 9
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
  },
  'file_flags' => {
    'base_type' => {},
    'name' => 'file_flags',
    'values' => {
      '2' => {
        'name' => 'read',
        'number' => 2
      },
      '4' => {
        'name' => 'write',
        'number' => 4
      },
      '8' => {
        'name' => 'erase',
        'number' => 8
      },
      'erase' => {},
      'read' => {},
      'write' => {}
    }
  },
  'fitness_equipment_state' => {
    'base_type' => {},
    'comment' => 'fitness equipment event data',
    'name' => 'fitness_equipment_state',
    'values' => {
      '0' => {
        'name' => 'ready',
        'number' => 0
      },
      '1' => {
        'name' => 'in_use',
        'number' => 1
      },
      '2' => {
        'name' => 'paused',
        'number' => 2
      },
      '3' => {
        'comment' => 'lost connection to fitness equipment',
        'name' => 'unknown',
        'number' => 3
      },
      'in_use' => {},
      'paused' => {},
      'ready' => {},
      'unknown' => {}
    }
  },
  'float32' => {
    'base_type' => {},
    'name' => 'float32',
    'values' => {}
  },
  'float64' => {
    'base_type' => {},
    'name' => 'float64',
    'values' => {}
  },
  'garmin_product' => {
    'base_type' => {},
    'name' => 'garmin_product',
    'values' => {
      '1' => {
        'name' => 'hrm1',
        'number' => 1
      },
      '10007' => {
        'comment' => 'SDM4 footpod',
        'name' => 'sdm4',
        'number' => 10007
      },
      '1011' => {
        'name' => 'dsi_alf01',
        'number' => 1011
      },
      '1018' => {
        'comment' => 'Forerunner 310',
        'name' => 'fr310xt',
        'number' => 1018
      },
      '1036' => {
        'name' => 'edge500',
        'number' => 1036
      },
      '1124' => {
        'comment' => 'Forerunner 110',
        'name' => 'fr110',
        'number' => 1124
      },
      '1169' => {
        'name' => 'edge800',
        'number' => 1169
      },
      '1253' => {
        'name' => 'chirp',
        'number' => 1253
      },
      '2' => {
        'comment' => 'AXH01 HRM chipset',
        'name' => 'axh01',
        'number' => 2
      },
      '20119' => {
        'name' => 'training_center',
        'number' => 20119
      },
      '3' => {
        'name' => 'axb01',
        'number' => 3
      },
      '4' => {
        'name' => 'axb02',
        'number' => 4
      },
      '5' => {
        'name' => 'hrm2ss',
        'number' => 5
      },
      '6' => {
        'name' => 'dsi_alf02',
        'number' => 6
      },
      '65534' => {
        'comment' => 'Garmin Connect website',
        'name' => 'connect',
        'number' => 65534
      },
      '717' => {
        'comment' => 'Forerunner 405',
        'name' => 'fr405',
        'number' => 717
      },
      '782' => {
        'comment' => 'Forerunner 50',
        'name' => 'fr50',
        'number' => 782
      },
      '988' => {
        'comment' => 'Forerunner 60',
        'name' => 'fr60',
        'number' => 988
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
  },
  'gender' => {
    'base_type' => {},
    'name' => 'gender',
    'values' => {
      '0' => {
        'name' => 'female',
        'number' => 0
      },
      '1' => {
        'name' => 'male',
        'number' => 1
      },
      'female' => {},
      'male' => {}
    }
  },
  'goal' => {
    'base_type' => {},
    'name' => 'goal',
    'values' => {
      '0' => {
        'name' => 'time',
        'number' => 0
      },
      '1' => {
        'name' => 'distance',
        'number' => 1
      },
      '2' => {
        'name' => 'calories',
        'number' => 2
      },
      '3' => {
        'name' => 'frequency',
        'number' => 3
      },
      '4' => {
        'name' => 'steps',
        'number' => 4
      },
      'calories' => {},
      'distance' => {},
      'frequency' => {},
      'steps' => {},
      'time' => {}
    }
  },
  'goal_recurrence' => {
    'base_type' => {},
    'name' => 'goal_recurrence',
    'values' => {
      '0' => {
        'name' => 'off',
        'number' => 0
      },
      '1' => {
        'name' => 'daily',
        'number' => 1
      },
      '2' => {
        'name' => 'weekly',
        'number' => 2
      },
      '3' => {
        'name' => 'monthly',
        'number' => 3
      },
      '4' => {
        'name' => 'yearly',
        'number' => 4
      },
      '5' => {
        'name' => 'custom',
        'number' => 5
      },
      'custom' => {},
      'daily' => {},
      'monthly' => {},
      'off' => {},
      'weekly' => {},
      'yearly' => {}
    }
  },
  'hr_type' => {
    'base_type' => {},
    'name' => 'hr_type',
    'values' => {
      '0' => {
        'name' => 'normal',
        'number' => 0
      },
      '1' => {
        'name' => 'irregular',
        'number' => 1
      },
      'irregular' => {},
      'normal' => {}
    }
  },
  'hr_zone_calc' => {
    'base_type' => {},
    'name' => 'hr_zone_calc',
    'values' => {
      '0' => {
        'name' => 'custom',
        'number' => 0
      },
      '1' => {
        'name' => 'percent_max_hr',
        'number' => 1
      },
      '2' => {
        'name' => 'percent_hrr',
        'number' => 2
      },
      'custom' => {},
      'percent_hrr' => {},
      'percent_max_hr' => {}
    }
  },
  'intensity' => {
    'base_type' => {},
    'name' => 'intensity',
    'values' => {
      '0' => {
        'name' => 'active',
        'number' => 0
      },
      '1' => {
        'name' => 'rest',
        'number' => 1
      },
      '2' => {
        'name' => 'warmup',
        'number' => 2
      },
      '3' => {
        'name' => 'cooldown',
        'number' => 3
      },
      'active' => {},
      'cooldown' => {},
      'rest' => {},
      'warmup' => {}
    }
  },
  'language' => {
    'base_type' => {},
    'name' => 'language',
    'values' => {
      '0' => {
        'name' => 'english',
        'number' => 0
      },
      '1' => {
        'name' => 'french',
        'number' => 1
      },
      '10' => {
        'name' => 'greek',
        'number' => 10
      },
      '11' => {
        'name' => 'hungarian',
        'number' => 11
      },
      '12' => {
        'name' => 'norwegian',
        'number' => 12
      },
      '13' => {
        'name' => 'polish',
        'number' => 13
      },
      '14' => {
        'name' => 'portuguese',
        'number' => 14
      },
      '15' => {
        'name' => 'slovakian',
        'number' => 15
      },
      '16' => {
        'name' => 'slovenian',
        'number' => 16
      },
      '17' => {
        'name' => 'swedish',
        'number' => 17
      },
      '18' => {
        'name' => 'russian',
        'number' => 18
      },
      '19' => {
        'name' => 'turkish',
        'number' => 19
      },
      '2' => {
        'name' => 'italian',
        'number' => 2
      },
      '20' => {
        'name' => 'latvian',
        'number' => 20
      },
      '21' => {
        'name' => 'ukrainian',
        'number' => 21
      },
      '22' => {
        'name' => 'arabic',
        'number' => 22
      },
      '23' => {
        'name' => 'farsi',
        'number' => 23
      },
      '24' => {
        'name' => 'bulgarian',
        'number' => 24
      },
      '25' => {
        'name' => 'romanian',
        'number' => 25
      },
      '254' => {
        'name' => 'custom',
        'number' => 254
      },
      '3' => {
        'name' => 'german',
        'number' => 3
      },
      '4' => {
        'name' => 'spanish',
        'number' => 4
      },
      '5' => {
        'name' => 'croatian',
        'number' => 5
      },
      '6' => {
        'name' => 'czech',
        'number' => 6
      },
      '7' => {
        'name' => 'danish',
        'number' => 7
      },
      '8' => {
        'name' => 'dutch',
        'number' => 8
      },
      '9' => {
        'name' => 'finnish',
        'number' => 9
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
  },
  'lap_trigger' => {
    'base_type' => {},
    'name' => 'lap_trigger',
    'values' => {
      '0' => {
        'name' => 'manual',
        'number' => 0
      },
      '1' => {
        'name' => 'time',
        'number' => 1
      },
      '2' => {
        'name' => 'distance',
        'number' => 2
      },
      '3' => {
        'name' => 'position_start',
        'number' => 3
      },
      '4' => {
        'name' => 'position_lap',
        'number' => 4
      },
      '5' => {
        'name' => 'position_waypoint',
        'number' => 5
      },
      '6' => {
        'name' => 'position_marked',
        'number' => 6
      },
      '7' => {
        'name' => 'session_end',
        'number' => 7
      },
      '8' => {
        'name' => 'fitness_equipment',
        'number' => 8
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
  },
  'local_date_time' => {
    'base_type' => {},
    'comment' => 'seconds since 00:00 Dec 31 1989 in local time zone',
    'name' => 'local_date_time',
    'values' => {}
  },
  'manufacturer' => {
    'base_type' => {},
    'name' => 'manufacturer',
    'values' => {
      '1' => {
        'name' => 'garmin',
        'number' => 1
      },
      '10' => {
        'name' => 'spark_hk',
        'number' => 10
      },
      '11' => {
        'name' => 'tanita',
        'number' => 11
      },
      '12' => {
        'name' => 'echowell',
        'number' => 12
      },
      '13' => {
        'name' => 'dynastream_oem',
        'number' => 13
      },
      '14' => {
        'name' => 'nautilus',
        'number' => 14
      },
      '15' => {
        'name' => 'dynastream',
        'number' => 15
      },
      '16' => {
        'name' => 'timex',
        'number' => 16
      },
      '17' => {
        'name' => 'metrigear',
        'number' => 17
      },
      '18' => {
        'name' => 'xelic',
        'number' => 18
      },
      '19' => {
        'name' => 'beurer',
        'number' => 19
      },
      '2' => {
        'comment' => 'Do not use.  Used by FR405 for ANTFS man id.',
        'name' => 'garmin_fr405_antfs',
        'number' => 2
      },
      '20' => {
        'name' => 'cardiosport',
        'number' => 20
      },
      '21' => {
        'name' => 'a_and_d',
        'number' => 21
      },
      '22' => {
        'name' => 'hmm',
        'number' => 22
      },
      '23' => {
        'name' => 'suunto',
        'number' => 23
      },
      '24' => {
        'name' => 'thita_elektronik',
        'number' => 24
      },
      '25' => {
        'name' => 'gpulse',
        'number' => 25
      },
      '26' => {
        'name' => 'clean_mobile',
        'number' => 26
      },
      '27' => {
        'name' => 'pedal_brain',
        'number' => 27
      },
      '28' => {
        'name' => 'peaksware',
        'number' => 28
      },
      '29' => {
        'name' => 'saxonar',
        'number' => 29
      },
      '3' => {
        'name' => 'zephyr',
        'number' => 3
      },
      '30' => {
        'name' => 'lemond_fitness',
        'number' => 30
      },
      '31' => {
        'name' => 'dexcom',
        'number' => 31
      },
      '32' => {
        'name' => 'wahoo_fitness',
        'number' => 32
      },
      '33' => {
        'name' => 'octane_fitness',
        'number' => 33
      },
      '4' => {
        'name' => 'dayton',
        'number' => 4
      },
      '5' => {
        'name' => 'idt',
        'number' => 5
      },
      '6' => {
        'name' => 'srm',
        'number' => 6
      },
      '7' => {
        'name' => 'quarq',
        'number' => 7
      },
      '8' => {
        'name' => 'ibike',
        'number' => 8
      },
      '9' => {
        'name' => 'saris',
        'number' => 9
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
  },
  'mesg_count' => {
    'base_type' => {},
    'name' => 'mesg_count',
    'values' => {
      '0' => {
        'name' => 'num_per_file',
        'number' => 0
      },
      '1' => {
        'name' => 'max_per_file',
        'number' => 1
      },
      '2' => {
        'name' => 'max_per_file_type',
        'number' => 2
      },
      'max_per_file' => {},
      'max_per_file_type' => {},
      'num_per_file' => {}
    }
  },
  'mesg_num' => {
    'base_type' => {},
    'name' => 'mesg_num',
    'values' => {
      '0' => {
        'name' => 'file_id',
        'number' => 0
      },
      '1' => {
        'name' => 'capabilities',
        'number' => 1
      },
      '10' => {
        'name' => 'met_zone',
        'number' => 10
      },
      '12' => {
        'name' => 'sport',
        'number' => 12
      },
      '15' => {
        'name' => 'goal',
        'number' => 15
      },
      '18' => {
        'name' => 'session',
        'number' => 18
      },
      '19' => {
        'name' => 'lap',
        'number' => 19
      },
      '2' => {
        'name' => 'device_settings',
        'number' => 2
      },
      '20' => {
        'name' => 'record',
        'number' => 20
      },
      '21' => {
        'name' => 'event',
        'number' => 21
      },
      '23' => {
        'name' => 'device_info',
        'number' => 23
      },
      '26' => {
        'name' => 'workout',
        'number' => 26
      },
      '27' => {
        'name' => 'workout_step',
        'number' => 27
      },
      '3' => {
        'name' => 'user_profile',
        'number' => 3
      },
      '30' => {
        'name' => 'weight_scale',
        'number' => 30
      },
      '31' => {
        'name' => 'course',
        'number' => 31
      },
      '32' => {
        'name' => 'course_point',
        'number' => 32
      },
      '33' => {
        'name' => 'totals',
        'number' => 33
      },
      '34' => {
        'name' => 'activity',
        'number' => 34
      },
      '35' => {
        'name' => 'software',
        'number' => 35
      },
      '37' => {
        'name' => 'file_capabilities',
        'number' => 37
      },
      '38' => {
        'name' => 'mesg_capabilities',
        'number' => 38
      },
      '39' => {
        'name' => 'field_capabilities',
        'number' => 39
      },
      '4' => {
        'name' => 'hrm_profile',
        'number' => 4
      },
      '49' => {
        'name' => 'file_creator',
        'number' => 49
      },
      '5' => {
        'name' => 'sdm_profile',
        'number' => 5
      },
      '51' => {
        'name' => 'blood_pressure',
        'number' => 51
      },
      '6' => {
        'name' => 'bike_profile',
        'number' => 6
      },
      '65280' => {
        'comment' => '0xFF00 - 0xFFFE reserved for manufacturer specific messages',
        'name' => 'mfg_range_min',
        'number' => 65280
      },
      '65534' => {
        'comment' => '0xFF00 - 0xFFFE reserved for manufacturer specific messages',
        'name' => 'mfg_range_max',
        'number' => 65534
      },
      '7' => {
        'name' => 'zones_target',
        'number' => 7
      },
      '8' => {
        'name' => 'hr_zone',
        'number' => 8
      },
      '9' => {
        'name' => 'power_zone',
        'number' => 9
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
  },
  'message_index' => {
    'base_type' => {},
    'name' => 'message_index',
    'values' => {
      '28672' => {
        'comment' => 'reserved (default 0)',
        'name' => 'reserved',
        'number' => 28672
      },
      '32768' => {
        'comment' => 'message is selected if set',
        'name' => 'selected',
        'number' => 32768
      },
      '4095' => {
        'comment' => 'index',
        'name' => 'mask',
        'number' => 4095
      },
      'mask' => {},
      'reserved' => {},
      'selected' => {}
    }
  },
  'pwr_zone_calc' => {
    'base_type' => {},
    'name' => 'pwr_zone_calc',
    'values' => {
      '0' => {
        'name' => 'custom',
        'number' => 0
      },
      '1' => {
        'name' => 'percent_ftp',
        'number' => 1
      },
      'custom' => {},
      'percent_ftp' => {}
    }
  },
  'session_trigger' => {
    'base_type' => {},
    'name' => 'session_trigger',
    'values' => {
      '0' => {
        'name' => 'activity_end',
        'number' => 0
      },
      '1' => {
        'comment' => 'User changed sport.',
        'name' => 'manual',
        'number' => 1
      },
      '2' => {
        'comment' => 'Auto multi-sport feature is enabled and user pressed lap button to advance session.',
        'name' => 'auto_multi_sport',
        'number' => 2
      },
      '3' => {
        'comment' => 'Auto sport change caused by user linking to fitness equipment.',
        'name' => 'fitness_equipment',
        'number' => 3
      },
      'activity_end' => {},
      'auto_multi_sport' => {},
      'fitness_equipment' => {},
      'manual' => {}
    }
  },
  'sint16' => {
    'base_type' => {},
    'name' => 'sint16',
    'values' => {}
  },
  'sint32' => {
    'base_type' => {},
    'name' => 'sint32',
    'values' => {}
  },
  'sint8' => {
    'base_type' => {},
    'name' => 'sint8',
    'values' => {}
  },
  'sport' => {
    'base_type' => {},
    'name' => 'sport',
    'values' => {
      '0' => {
        'name' => 'generic',
        'number' => 0
      },
      '1' => {
        'name' => 'running',
        'number' => 1
      },
      '2' => {
        'name' => 'cycling',
        'number' => 2
      },
      '254' => {
        'comment' => 'All is for goals only to include all sports.',
        'name' => 'all',
        'number' => 254
      },
      '3' => {
        'comment' => 'Mulitsport transition',
        'name' => 'transition',
        'number' => 3
      },
      '4' => {
        'name' => 'fitness_equipment',
        'number' => 4
      },
      '5' => {
        'name' => 'swimming',
        'number' => 5
      },
      'all' => {},
      'cycling' => {},
      'fitness_equipment' => {},
      'generic' => {},
      'running' => {},
      'swimming' => {},
      'transition' => {}
    }
  },
  'sport_bits_0' => {
    'base_type' => {},
    'comment' => 'Bit field corresponding to sport enum type (1 << sport).',
    'name' => 'sport_bits_0',
    'values' => {
      '1' => {
        'name' => 'generic',
        'number' => 1
      },
      '16' => {
        'name' => 'fitness_equipment',
        'number' => 16
      },
      '2' => {
        'name' => 'running',
        'number' => 2
      },
      '32' => {
        'name' => 'swimming',
        'number' => 32
      },
      '4' => {
        'name' => 'cycling',
        'number' => 4
      },
      '8' => {
        'comment' => 'Mulitsport transition',
        'name' => 'transition',
        'number' => 8
      },
      'cycling' => {},
      'fitness_equipment' => {},
      'generic' => {},
      'running' => {},
      'swimming' => {},
      'transition' => {}
    }
  },
  'string' => {
    'base_type' => {},
    'name' => 'string',
    'values' => {}
  },
  'sub_sport' => {
    'base_type' => {},
    'name' => 'sub_sport',
    'values' => {
      '0' => {
        'name' => 'generic',
        'number' => 0
      },
      '1' => {
        'comment' => 'Run',
        'name' => 'treadmill',
        'number' => 1
      },
      '10' => {
        'comment' => 'Cycling',
        'name' => 'recumbent',
        'number' => 10
      },
      '11' => {
        'comment' => 'Cycling',
        'name' => 'cyclocross',
        'number' => 11
      },
      '12' => {
        'comment' => 'Cycling',
        'name' => 'hand_cycling',
        'number' => 12
      },
      '13' => {
        'comment' => 'Cycling',
        'name' => 'track_cycling',
        'number' => 13
      },
      '14' => {
        'comment' => 'Fitness Equipment',
        'name' => 'indoor_rowing',
        'number' => 14
      },
      '15' => {
        'comment' => 'Fitness Equipment',
        'name' => 'elliptical',
        'number' => 15
      },
      '16' => {
        'comment' => 'Fitness Equipment',
        'name' => 'stair_climbing',
        'number' => 16
      },
      '17' => {
        'comment' => 'Swimming',
        'name' => 'lap_swimming',
        'number' => 17
      },
      '18' => {
        'comment' => 'Swimming',
        'name' => 'open_water',
        'number' => 18
      },
      '2' => {
        'comment' => 'Run',
        'name' => 'street',
        'number' => 2
      },
      '254' => {
        'name' => 'all',
        'number' => 254
      },
      '3' => {
        'comment' => 'Run',
        'name' => 'trail',
        'number' => 3
      },
      '4' => {
        'comment' => 'Run',
        'name' => 'track',
        'number' => 4
      },
      '5' => {
        'comment' => 'Cycling',
        'name' => 'spin',
        'number' => 5
      },
      '6' => {
        'comment' => 'Cycling',
        'name' => 'indoor_cycling',
        'number' => 6
      },
      '7' => {
        'comment' => 'Cycling',
        'name' => 'road',
        'number' => 7
      },
      '8' => {
        'comment' => 'Cycling',
        'name' => 'mountain',
        'number' => 8
      },
      '9' => {
        'comment' => 'Cycling',
        'name' => 'downhill',
        'number' => 9
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
  },
  'timer_trigger' => {
    'base_type' => {},
    'comment' => 'timer event data',
    'name' => 'timer_trigger',
    'values' => {
      '0' => {
        'name' => 'manual',
        'number' => 0
      },
      '1' => {
        'name' => 'auto',
        'number' => 1
      },
      '2' => {
        'name' => 'fitness_equipment',
        'number' => 2
      },
      'auto' => {},
      'fitness_equipment' => {},
      'manual' => {}
    }
  },
  'uint16' => {
    'base_type' => {},
    'name' => 'uint16',
    'values' => {}
  },
  'uint16z' => {
    'base_type' => {},
    'name' => 'uint16z',
    'values' => {}
  },
  'uint32' => {
    'base_type' => {},
    'name' => 'uint32',
    'values' => {}
  },
  'uint32z' => {
    'base_type' => {},
    'name' => 'uint32z',
    'values' => {}
  },
  'uint8' => {
    'base_type' => {},
    'name' => 'uint8',
    'values' => {}
  },
  'uint8z' => {
    'base_type' => {},
    'name' => 'uint8z',
    'values' => {}
  },
  'user_local_id' => {
    'base_type' => {},
    'name' => 'user_local_id',
    'values' => {
      '1' => {
        'name' => 'local_min',
        'number' => 1
      },
      '15' => {
        'name' => 'local_max',
        'number' => 15
      },
      '16' => {
        'name' => 'stationary_min',
        'number' => 16
      },
      '255' => {
        'name' => 'stationary_max',
        'number' => 255
      },
      '256' => {
        'name' => 'portable_min',
        'number' => 256
      },
      '65534' => {
        'name' => 'portable_max',
        'number' => 65534
      },
      'local_max' => {},
      'local_min' => {},
      'portable_max' => {},
      'portable_min' => {},
      'stationary_max' => {},
      'stationary_min' => {}
    }
  },
  'weight' => {
    'base_type' => {},
    'name' => 'weight',
    'values' => {
      '65534' => {
        'name' => 'calculating',
        'number' => 65534
      },
      'calculating' => {}
    }
  },
  'wkt_step_duration' => {
    'base_type' => {},
    'name' => 'wkt_step_duration',
    'values' => {
      '0' => {
        'name' => 'time',
        'number' => 0
      },
      '1' => {
        'name' => 'distance',
        'number' => 1
      },
      '10' => {
        'name' => 'repeat_until_hr_less_than',
        'number' => 10
      },
      '11' => {
        'name' => 'repeat_until_hr_greater_than',
        'number' => 11
      },
      '12' => {
        'name' => 'repeat_until_power_less_than',
        'number' => 12
      },
      '13' => {
        'name' => 'repeat_until_power_greater_than',
        'number' => 13
      },
      '14' => {
        'name' => 'power_less_than',
        'number' => 14
      },
      '15' => {
        'name' => 'power_greater_than',
        'number' => 15
      },
      '2' => {
        'name' => 'hr_less_than',
        'number' => 2
      },
      '3' => {
        'name' => 'hr_greater_than',
        'number' => 3
      },
      '4' => {
        'name' => 'calories',
        'number' => 4
      },
      '5' => {
        'name' => 'open',
        'number' => 5
      },
      '6' => {
        'name' => 'repeat_until_steps_cmplt',
        'number' => 6
      },
      '7' => {
        'name' => 'repeat_until_time',
        'number' => 7
      },
      '8' => {
        'name' => 'repeat_until_distance',
        'number' => 8
      },
      '9' => {
        'name' => 'repeat_until_calories',
        'number' => 9
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
  },
  'wkt_step_target' => {
    'base_type' => {},
    'name' => 'wkt_step_target',
    'values' => {
      '0' => {
        'name' => 'speed',
        'number' => 0
      },
      '1' => {
        'name' => 'heart_rate',
        'number' => 1
      },
      '2' => {
        'name' => 'open',
        'number' => 2
      },
      '3' => {
        'name' => 'cadence',
        'number' => 3
      },
      '4' => {
        'name' => 'power',
        'number' => 4
      },
      '5' => {
        'name' => 'grade',
        'number' => 5
      },
      '6' => {
        'name' => 'resistance',
        'number' => 6
      },
      'cadence' => {},
      'grade' => {},
      'heart_rate' => {},
      'open' => {},
      'power' => {},
      'resistance' => {},
      'speed' => {}
    }
  },
  'workout_capabilities' => {
    'base_type' => {},
    'name' => 'workout_capabilities',
    'values' => {
      '1' => {
        'name' => 'interval',
        'number' => 1
      },
      '1024' => {
        'comment' => 'Cadence source required for workout step.',
        'name' => 'cadence',
        'number' => 1024
      },
      '128' => {
        'comment' => 'Speed source required for workout step.',
        'name' => 'speed',
        'number' => 128
      },
      '16' => {
        'name' => 'new_leaf',
        'number' => 16
      },
      '16384' => {
        'name' => 'protected',
        'number' => 16384
      },
      '2' => {
        'name' => 'custom',
        'number' => 2
      },
      '2048' => {
        'comment' => 'Power source required for workout step.',
        'name' => 'power',
        'number' => 2048
      },
      '256' => {
        'comment' => 'Heart rate source required for workout step.',
        'name' => 'heart_rate',
        'number' => 256
      },
      '32' => {
        'comment' => 'For backwards compatibility.  Watch should add missing id fields then clear flag.',
        'name' => 'tcx',
        'number' => 32
      },
      '4' => {
        'name' => 'fitness_equipment',
        'number' => 4
      },
      '4096' => {
        'comment' => 'Grade source required for workout step.',
        'name' => 'grade',
        'number' => 4096
      },
      '512' => {
        'comment' => 'Distance source required for workout step.',
        'name' => 'distance',
        'number' => 512
      },
      '8' => {
        'name' => 'firstbeat',
        'number' => 8
      },
      '8192' => {
        'comment' => 'Resistance source required for workout step.',
        'name' => 'resistance',
        'number' => 8192
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
  },
  'workout_hr' => {
    'base_type' => {},
    'comment' => '0 - 100 indicates% of maz hr; >100 indicates bpm (255 max) plus 100',
    'name' => 'workout_hr',
    'values' => {
      '100' => {
        'name' => 'bpm_offset',
        'number' => 100
      },
      'bpm_offset' => {}
    }
  },
  'workout_power' => {
    'base_type' => {},
    'comment' => '0 - 1000 indicates % of functional threshold power; >1000 indicates watts plus 1000.',
    'name' => 'workout_power',
    'values' => {
      '1000' => {
        'name' => 'watts_offset',
        'number' => 1000
      },
      'watts_offset' => {}
    }
  }
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
  '0' => {
    'comment' => 'Must be first message in file.',
    'context' => 'COMMON MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'type',
        'number' => 0,
        'type' => {}
      },
      '1' => {
        'name' => 'manufacturer',
        'number' => 1,
        'type' => {}
      },
      '2' => {
        'name' => 'product',
        'number' => 2,
        'type' => {}
      },
      '3' => {
        'name' => 'serial_number',
        'number' => 3,
        'type' => {}
      },
      '4' => {
        'name' => 'time_created',
        'number' => 4,
        'type' => {}
      },
      '5' => {
        'name' => 'number',
        'number' => 5,
        'type' => {}
      },
      'manufacturer' => {},
      'number' => {},
      'product' => {},
      'serial_number' => {},
      'time_created' => {},
      'type' => {}
    },
    'name' => 'file_id',
    'number' => 0
  },
  '1' => {
    'context' => 'DEVICE FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'languages',
        'number' => 0,
        'type' => {}
      },
      '1' => {
        'name' => 'sports',
        'number' => 1,
        'type' => {}
      },
      '21' => {
        'name' => 'workouts_supported',
        'number' => 21,
        'type' => {}
      },
      'array' => 'N',
      'languages' => {},
      'sports' => {},
      'workouts_supported' => {}
    },
    'name' => 'capabilities',
    'number' => 1
  },
  '10' => {
    'context' => 'SPORT SETTINGS FILE MESSAGES',
    'fields' => {
      '1' => {
        'name' => 'high_bpm',
        'number' => 1,
        'scale' => '1',
        'type' => {}
      },
      '2' => {
        'name' => 'calories',
        'number' => 2,
        'scale' => '10',
        'type' => {},
        'units' => 'kcal / min'
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'scale' => '1',
        'type' => {}
      },
      '3' => {
        'name' => 'fat_calories',
        'number' => 3,
        'scale' => '10',
        'type' => {},
        'units' => 'kcal / min'
      },
      'calories' => {},
      'fat_calories' => {},
      'high_bpm' => {},
      'message_index' => {}
    },
    'name' => 'met_zone',
    'number' => 10
  },
  '12' => {
    'context' => 'SPORT SETTINGS FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'sport',
        'number' => 0,
        'scale' => '1',
        'type' => {}
      },
      '1' => {
        'name' => 'sub_sport',
        'number' => 1,
        'scale' => '1',
        'type' => {}
      },
      '3' => {
        'name' => 'name',
        'number' => 3,
        'type' => {}
      },
      'name' => {},
      'sport' => {},
      'sub_sport' => {}
    },
    'name' => 'sport',
    'number' => 12
  },
  '15' => {
    'context' => 'GOALS FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'sport',
        'number' => 0,
        'scale' => '1',
        'type' => {}
      },
      '1' => {
        'name' => 'sub_sport',
        'number' => 1,
        'scale' => '1',
        'type' => {}
      },
      '10' => {
        'name' => 'enabled',
        'number' => 10,
        'scale' => '1',
        'type' => {}
      },
      '2' => {
        'name' => 'start_date',
        'number' => 2,
        'type' => {}
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'scale' => '1',
        'type' => {}
      },
      '3' => {
        'name' => 'end_date',
        'number' => 3,
        'type' => {}
      },
      '4' => {
        'name' => 'type',
        'number' => 4,
        'type' => {}
      },
      '5' => {
        'name' => 'value',
        'number' => 5,
        'scale' => '1',
        'type' => {}
      },
      '6' => {
        'name' => 'repeat',
        'number' => 6,
        'type' => {}
      },
      '7' => {
        'name' => 'target_value',
        'number' => 7,
        'scale' => '1',
        'type' => {}
      },
      '8' => {
        'name' => 'recurrence',
        'number' => 8,
        'scale' => '1',
        'type' => {}
      },
      '9' => {
        'name' => 'recurrence_value',
        'number' => 9,
        'scale' => '1',
        'type' => {}
      },
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
  },
  '18' => {
    'context' => 'ACTIVITY FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'event',
        'number' => 0,
        'type' => {}
      },
      '1' => {
        'name' => 'event_type',
        'number' => 1,
        'type' => {}
      },
      '10' => {
        'name' => 'total_cycles',
        'number' => 10,
        'scale' => '1',
        'type' => {},
        'units' => 'cycles'
      },
      '11' => {
        'name' => 'total_calories',
        'number' => 11,
        'scale' => '1',
        'type' => {},
        'units' => 'kcal'
      },
      '13' => {
        'name' => 'total_fat_calories',
        'number' => 13,
        'scale' => '1',
        'type' => {},
        'units' => 'kcal'
      },
      '14' => {
        'name' => 'avg_speed',
        'number' => 14,
        'scale' => '1000',
        'type' => {},
        'units' => 'm/s'
      },
      '15' => {
        'name' => 'max_speed',
        'number' => 15,
        'scale' => '1000',
        'type' => {},
        'units' => 'm/s'
      },
      '16' => {
        'name' => 'avg_heart_rate',
        'number' => 16,
        'scale' => '1',
        'type' => {},
        'units' => 'bpm'
      },
      '17' => {
        'name' => 'max_heart_rate',
        'number' => 17,
        'scale' => '1',
        'type' => {},
        'units' => 'bpm'
      },
      '18' => {
        'name' => 'avg_cadence',
        'number' => 18,
        'scale' => '1',
        'type' => {},
        'units' => 'rpm'
      },
      '19' => {
        'name' => 'max_cadence',
        'number' => 19,
        'scale' => '1',
        'type' => {},
        'units' => 'rpm'
      },
      '2' => {
        'name' => 'start_time',
        'number' => 2,
        'scale' => '1',
        'type' => {}
      },
      '20' => {
        'name' => 'avg_power',
        'number' => 20,
        'scale' => '1',
        'type' => {},
        'units' => 'watts'
      },
      '21' => {
        'name' => 'max_power',
        'number' => 21,
        'scale' => '1',
        'type' => {},
        'units' => 'watts'
      },
      '22' => {
        'name' => 'total_ascent',
        'number' => 22,
        'scale' => '1',
        'type' => {},
        'units' => 'm'
      },
      '23' => {
        'name' => 'total_descent',
        'number' => 23,
        'scale' => '1',
        'type' => {},
        'units' => 'm'
      },
      '24' => {
        'name' => 'total_training_effect',
        'number' => 24,
        'scale' => '10',
        'type' => {}
      },
      '25' => {
        'name' => 'first_lap_index',
        'number' => 25,
        'scale' => '1',
        'type' => {}
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253,
        'type' => {},
        'units' => 's'
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'scale' => '1',
        'type' => {}
      },
      '26' => {
        'name' => 'num_laps',
        'number' => 26,
        'scale' => '1',
        'type' => {}
      },
      '27' => {
        'name' => 'event_group',
        'number' => 27,
        'type' => {}
      },
      '28' => {
        'name' => 'trigger',
        'number' => 28,
        'type' => {}
      },
      '29' => {
        'name' => 'nec_lat',
        'number' => 29,
        'type' => {},
        'units' => 'semicircles'
      },
      '3' => {
        'name' => 'start_position_lat',
        'number' => 3,
        'scale' => '1',
        'type' => {},
        'units' => 'semicircles'
      },
      '30' => {
        'name' => 'nec_long',
        'number' => 30,
        'type' => {},
        'units' => 'semicircles'
      },
      '31' => {
        'name' => 'swc_lat',
        'number' => 31,
        'type' => {},
        'units' => 'semicircles'
      },
      '32' => {
        'name' => 'swc_long',
        'number' => 32,
        'type' => {},
        'units' => 'semicircles'
      },
      '4' => {
        'name' => 'start_position_long',
        'number' => 4,
        'scale' => '1',
        'type' => {},
        'units' => 'semicircles'
      },
      '5' => {
        'name' => 'sport',
        'number' => 5,
        'scale' => '1',
        'type' => {}
      },
      '6' => {
        'name' => 'sub_sport',
        'number' => 6,
        'scale' => '1',
        'type' => {}
      },
      '7' => {
        'name' => 'total_elapsed_time',
        'number' => 7,
        'scale' => '1000',
        'type' => {},
        'units' => 's'
      },
      '8' => {
        'name' => 'total_timer_time',
        'number' => 8,
        'scale' => '1000',
        'type' => {},
        'units' => 's'
      },
      '9' => {
        'name' => 'total_distance',
        'number' => 9,
        'scale' => '100',
        'type' => {},
        'units' => 'm'
      },
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
  },
  '19' => {
    'context' => 'ACTIVITY FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'event',
        'number' => 0,
        'type' => {}
      },
      '1' => {
        'name' => 'event_type',
        'number' => 1,
        'type' => {}
      },
      '10' => {
        'name' => 'total_cycles',
        'number' => 10,
        'type' => {},
        'units' => 'cycles'
      },
      '11' => {
        'name' => 'total_calories',
        'number' => 11,
        'type' => {},
        'units' => 'kcal'
      },
      '12' => {
        'name' => 'total_fat_calories',
        'number' => 12,
        'type' => {},
        'units' => 'kcal'
      },
      '13' => {
        'name' => 'avg_speed',
        'number' => 13,
        'scale' => '1000',
        'type' => {},
        'units' => 'm/s'
      },
      '14' => {
        'name' => 'max_speed',
        'number' => 14,
        'scale' => '1000',
        'type' => {},
        'units' => 'm/s'
      },
      '15' => {
        'name' => 'avg_heart_rate',
        'number' => 15,
        'type' => {},
        'units' => 'bpm'
      },
      '16' => {
        'name' => 'max_heart_rate',
        'number' => 16,
        'type' => {},
        'units' => 'bpm'
      },
      '17' => {
        'name' => 'avg_cadence',
        'number' => 17,
        'type' => {},
        'units' => 'rpm'
      },
      '18' => {
        'name' => 'max_cadence',
        'number' => 18,
        'type' => {},
        'units' => 'rpm'
      },
      '19' => {
        'name' => 'avg_power',
        'number' => 19,
        'type' => {},
        'units' => 'watts'
      },
      '2' => {
        'name' => 'start_time',
        'number' => 2,
        'scale' => '1',
        'type' => {}
      },
      '20' => {
        'name' => 'max_power',
        'number' => 20,
        'type' => {},
        'units' => 'watts'
      },
      '21' => {
        'name' => 'total_ascent',
        'number' => 21,
        'type' => {},
        'units' => 'm'
      },
      '22' => {
        'name' => 'total_descent',
        'number' => 22,
        'type' => {},
        'units' => 'm'
      },
      '23' => {
        'name' => 'intensity',
        'number' => 23,
        'type' => {}
      },
      '24' => {
        'name' => 'lap_trigger',
        'number' => 24,
        'type' => {}
      },
      '25' => {
        'name' => 'sport',
        'number' => 25,
        'type' => {}
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253,
        'type' => {},
        'units' => 's'
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'scale' => '1',
        'type' => {}
      },
      '26' => {
        'name' => 'event_group',
        'number' => 26,
        'type' => {}
      },
      '3' => {
        'name' => 'start_position_lat',
        'number' => 3,
        'scale' => '1',
        'type' => {},
        'units' => 'semicircles'
      },
      '4' => {
        'name' => 'start_position_long',
        'number' => 4,
        'scale' => '1',
        'type' => {},
        'units' => 'semicircles'
      },
      '5' => {
        'name' => 'end_position_lat',
        'number' => 5,
        'scale' => '1',
        'type' => {},
        'units' => 'semicircles'
      },
      '6' => {
        'name' => 'end_position_long',
        'number' => 6,
        'scale' => '1',
        'type' => {},
        'units' => 'semicircles'
      },
      '7' => {
        'name' => 'total_elapsed_time',
        'number' => 7,
        'scale' => '1000',
        'type' => {},
        'units' => 's'
      },
      '8' => {
        'name' => 'total_timer_time',
        'number' => 8,
        'scale' => '1000',
        'type' => {},
        'units' => 's'
      },
      '9' => {
        'name' => 'total_distance',
        'number' => 9,
        'scale' => '100',
        'type' => {},
        'units' => 'm'
      },
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
      'sport' => {},
      'start_position_lat' => {},
      'start_position_long' => {},
      'start_time' => {},
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
  },
  '2' => {
    'context' => 'SETTINGS FILE MESSAGES',
    'fields' => {
      '1' => {
        'name' => 'utc_offset',
        'number' => 1,
        'type' => {}
      },
      'utc_offset' => {}
    },
    'name' => 'device_settings',
    'number' => 2
  },
  '20' => {
    'context' => 'ACTIVITY FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'position_lat',
        'number' => 0,
        'scale' => '1',
        'type' => {},
        'units' => 'semicircles'
      },
      '1' => {
        'name' => 'position_long',
        'number' => 1,
        'scale' => '1',
        'type' => {},
        'units' => 'semicircles'
      },
      '10' => {
        'name' => 'resistance',
        'number' => 10,
        'scale' => '1',
        'type' => {}
      },
      '11' => {
        'name' => 'time_from_course',
        'number' => 11,
        'scale' => '1000',
        'type' => {},
        'units' => 's'
      },
      '12' => {
        'name' => 'cycle_length',
        'number' => 12,
        'scale' => '100',
        'type' => {},
        'units' => 'm'
      },
      '13' => {
        'name' => 'temperature',
        'number' => 13,
        'type' => {},
        'units' => 'C'
      },
      '2' => {
        'name' => 'altitude',
        'number' => 2,
        'offset' => '500',
        'scale' => '5',
        'type' => {},
        'units' => 'm'
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253,
        'scale' => '1',
        'type' => {},
        'units' => 's'
      },
      '3' => {
        'name' => 'heart_rate',
        'number' => 3,
        'scale' => '1',
        'type' => {},
        'units' => 'bpm'
      },
      '4' => {
        'name' => 'cadence',
        'number' => 4,
        'scale' => '1',
        'type' => {},
        'units' => 'rpm'
      },
      '5' => {
        'name' => 'distance',
        'number' => 5,
        'scale' => '100',
        'type' => {},
        'units' => 'm'
      },
      '6' => {
        'name' => 'speed',
        'number' => 6,
        'scale' => '1000',
        'type' => {},
        'units' => 'm/s'
      },
      '7' => {
        'name' => 'power',
        'number' => 7,
        'type' => {},
        'units' => 'watts'
      },
      '8' => {
        'accumulate' => [
          '0',
          '1'
        ],
        'bits' => [
          '12',
          '12'
        ],
        'name' => 'compressed_speed_distance',
        'number' => 8,
        'scale' => [
          '100',
          '16'
        ],
        'type' => {},
        'units' => [
          'm/s',
          'm'
        ]
      },
      '9' => {
        'name' => 'grade',
        'number' => 9,
        'scale' => '100',
        'type' => {},
        'units' => '%'
      },
      'altitude' => {},
      'array' => '3',
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
  },
  '21' => {
    'context' => 'ACTIVITY FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'event',
        'number' => 0,
        'type' => {}
      },
      '1' => {
        'name' => 'event_type',
        'number' => 1,
        'type' => {}
      },
      '2' => {
        'bits' => '16',
        'name' => 'data16',
        'number' => 2,
        'scale' => '1',
        'type' => {}
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253,
        'type' => {},
        'units' => 's'
      },
      '3' => {
        'name' => 'data',
        'number' => 3,
        'scale' => '1',
        'type' => {}
      },
      '4' => {
        'name' => 'event_group',
        'number' => 4,
        'type' => {}
      },
      'data' => {},
      'data16' => {},
      'event' => {},
      'event_group' => {},
      'event_type' => {},
      'timestamp' => {}
    },
    'name' => 'event',
    'number' => 21
  },
  '23' => {
    'context' => 'ACTIVITY FILE MESSAGES',
    'fields' => {
      '0' => {
        'bits' => '16',
        'name' => 'device_index',
        'number' => 0,
        'scale' => '1',
        'type' => {}
      },
      '1' => {
        'name' => 'device_type',
        'number' => 1,
        'scale' => '1',
        'type' => {}
      },
      '10' => {
        'name' => 'battery_voltage',
        'number' => 10,
        'scale' => '256',
        'type' => {},
        'units' => 'V'
      },
      '11' => {
        'name' => 'battery_status',
        'number' => 11,
        'type' => {}
      },
      '2' => {
        'name' => 'manufacturer',
        'number' => 2,
        'scale' => '1',
        'type' => {}
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253,
        'scale' => '1',
        'type' => {},
        'units' => 's'
      },
      '3' => {
        'name' => 'serial_number',
        'number' => 3,
        'scale' => '1',
        'type' => {}
      },
      '4' => {
        'name' => 'product',
        'number' => 4,
        'scale' => '1',
        'type' => {}
      },
      '5' => {
        'name' => 'software_version',
        'number' => 5,
        'scale' => '100',
        'type' => {}
      },
      '6' => {
        'name' => 'hardware_version',
        'number' => 6,
        'scale' => '1',
        'type' => {}
      },
      '7' => {
        'name' => 'cum_operating_time',
        'number' => 7,
        'scale' => '1',
        'type' => {},
        'units' => 's'
      },
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
  },
  '26' => {
    'context' => 'WORKOUT FILE MESSAGES',
    'fields' => {
      '4' => {
        'name' => 'sport',
        'number' => 4,
        'scale' => '1',
        'type' => {}
      },
      '5' => {
        'name' => 'capabilities',
        'number' => 5,
        'type' => {}
      },
      '6' => {
        'name' => 'num_valid_steps',
        'number' => 6,
        'scale' => '1',
        'type' => {}
      },
      '8' => {
        'name' => 'wkt_name',
        'number' => 8,
        'scale' => '1',
        'type' => {}
      },
      'capabilities' => {},
      'num_valid_steps' => {},
      'sport' => {},
      'wkt_name' => {}
    },
    'name' => 'workout',
    'number' => 26
  },
  '27' => {
    'context' => 'WORKOUT FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'wkt_step_name',
        'number' => 0,
        'scale' => '1',
        'type' => {}
      },
      '1' => {
        'name' => 'duration_type',
        'number' => 1,
        'scale' => '1',
        'type' => {}
      },
      '2' => {
        'name' => 'duration_value',
        'number' => 2,
        'scale' => '1',
        'type' => {}
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'type' => {}
      },
      '3' => {
        'name' => 'target_type',
        'number' => 3,
        'scale' => '1',
        'type' => {}
      },
      '4' => {
        'name' => 'target_value',
        'number' => 4,
        'scale' => '1',
        'type' => {}
      },
      '5' => {
        'name' => 'custom_target_value_low',
        'number' => 5,
        'scale' => '1',
        'type' => {}
      },
      '6' => {
        'name' => 'custom_target_value_high',
        'number' => 6,
        'scale' => '1',
        'type' => {}
      },
      '7' => {
        'name' => 'intensity',
        'number' => 7,
        'scale' => '1',
        'type' => {}
      },
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
  },
  '3' => {
    'context' => 'SETTINGS FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'friendly_name',
        'number' => 0,
        'scale' => '1',
        'type' => {}
      },
      '1' => {
        'name' => 'gender',
        'number' => 1,
        'scale' => '1',
        'type' => {}
      },
      '10' => {
        'name' => 'default_max_biking_heart_rate',
        'number' => 10,
        'scale' => '1',
        'type' => {},
        'units' => 'bpm'
      },
      '11' => {
        'name' => 'default_max_heart_rate',
        'number' => 11,
        'scale' => '1',
        'type' => {},
        'units' => 'bpm'
      },
      '12' => {
        'name' => 'hr_setting',
        'number' => 12,
        'scale' => '1',
        'type' => {}
      },
      '13' => {
        'name' => 'speed_setting',
        'number' => 13,
        'scale' => '1',
        'type' => {}
      },
      '14' => {
        'name' => 'dist_setting',
        'number' => 14,
        'scale' => '1',
        'type' => {}
      },
      '16' => {
        'name' => 'power_setting',
        'number' => 16,
        'scale' => '1',
        'type' => {}
      },
      '17' => {
        'name' => 'activity_class',
        'number' => 17,
        'scale' => '1',
        'type' => {}
      },
      '18' => {
        'name' => 'position_setting',
        'number' => 18,
        'scale' => '1',
        'type' => {}
      },
      '2' => {
        'name' => 'age',
        'number' => 2,
        'scale' => '1',
        'type' => {},
        'units' => 'years'
      },
      '21' => {
        'name' => 'temperature_setting',
        'number' => 21,
        'scale' => '1',
        'type' => {}
      },
      '22' => {
        'name' => 'local_id',
        'number' => 22,
        'type' => {}
      },
      '23' => {
        'name' => 'global_id',
        'number' => 23,
        'type' => {}
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'type' => {}
      },
      '3' => {
        'name' => 'height',
        'number' => 3,
        'scale' => '100',
        'type' => {},
        'units' => 'm'
      },
      '4' => {
        'name' => 'weight',
        'number' => 4,
        'scale' => '10',
        'type' => {},
        'units' => 'kg'
      },
      '5' => {
        'name' => 'language',
        'number' => 5,
        'scale' => '1',
        'type' => {}
      },
      '6' => {
        'name' => 'elev_setting',
        'number' => 6,
        'scale' => '1',
        'type' => {}
      },
      '7' => {
        'name' => 'weight_setting',
        'number' => 7,
        'scale' => '1',
        'type' => {}
      },
      '8' => {
        'name' => 'resting_heart_rate',
        'number' => 8,
        'scale' => '1',
        'type' => {},
        'units' => 'bpm'
      },
      '9' => {
        'name' => 'default_max_running_heart_rate',
        'number' => 9,
        'scale' => '1',
        'type' => {},
        'units' => 'bpm'
      },
      'activity_class' => {},
      'age' => {},
      'array' => '6',
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
  },
  '30' => {
    'context' => 'WEIGHT SCALE FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'weight',
        'number' => 0,
        'scale' => '100',
        'type' => {},
        'units' => 'kg'
      },
      '1' => {
        'name' => 'percent_fat',
        'number' => 1,
        'scale' => '100',
        'type' => {},
        'units' => '%'
      },
      '10' => {
        'name' => 'metabolic_age',
        'number' => 10,
        'scale' => '1',
        'type' => {},
        'units' => 'years'
      },
      '11' => {
        'name' => 'visceral_fat_rating',
        'number' => 11,
        'scale' => '1',
        'type' => {}
      },
      '12' => {
        'name' => 'user_profile_index',
        'number' => 12,
        'type' => {}
      },
      '2' => {
        'name' => 'percent_hydration',
        'number' => 2,
        'scale' => '100',
        'type' => {},
        'units' => '%'
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253,
        'scale' => '1',
        'type' => {},
        'units' => 's'
      },
      '3' => {
        'name' => 'visceral_fat_mass',
        'number' => 3,
        'scale' => '100',
        'type' => {},
        'units' => 'kg'
      },
      '4' => {
        'name' => 'bone_mass',
        'number' => 4,
        'scale' => '100',
        'type' => {},
        'units' => 'kg'
      },
      '5' => {
        'name' => 'muscle_mass',
        'number' => 5,
        'scale' => '100',
        'type' => {},
        'units' => 'kg'
      },
      '7' => {
        'name' => 'basal_met',
        'number' => 7,
        'scale' => '4',
        'type' => {},
        'units' => 'kcal/day'
      },
      '8' => {
        'name' => 'physique_rating',
        'number' => 8,
        'scale' => '1',
        'type' => {}
      },
      '9' => {
        'name' => 'active_met',
        'number' => 9,
        'scale' => '4',
        'type' => {},
        'units' => 'kcal/day'
      },
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
  },
  '31' => {
    'context' => 'COURSE FILE MESSAGES',
    'fields' => {
      '4' => {
        'name' => 'sport',
        'number' => 4,
        'type' => {}
      },
      '5' => {
        'name' => 'name',
        'number' => 5,
        'type' => {}
      },
      '6' => {
        'name' => 'capabilities',
        'number' => 6,
        'type' => {}
      },
      'capabilities' => {},
      'name' => {},
      'sport' => {}
    },
    'name' => 'course',
    'number' => 31
  },
  '32' => {
    'context' => 'COURSE FILE MESSAGES',
    'fields' => {
      '1' => {
        'name' => 'timestamp',
        'number' => 1,
        'scale' => '1',
        'type' => {}
      },
      '2' => {
        'name' => 'position_lat',
        'number' => 2,
        'scale' => '1',
        'type' => {},
        'units' => 'semicircles'
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'type' => {}
      },
      '3' => {
        'name' => 'position_long',
        'number' => 3,
        'scale' => '1',
        'type' => {},
        'units' => 'semicircles'
      },
      '4' => {
        'name' => 'distance',
        'number' => 4,
        'scale' => '100',
        'type' => {},
        'units' => 'm'
      },
      '5' => {
        'name' => 'type',
        'number' => 5,
        'scale' => '1',
        'type' => {}
      },
      '6' => {
        'name' => 'name',
        'number' => 6,
        'type' => {}
      },
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
  },
  '33' => {
    'context' => 'TOTALS FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'timer_time',
        'number' => 0,
        'type' => {},
        'units' => 's'
      },
      '1' => {
        'name' => 'distance',
        'number' => 1,
        'type' => {},
        'units' => 'm'
      },
      '2' => {
        'name' => 'calories',
        'number' => 2,
        'type' => {},
        'units' => 'kcal'
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253,
        'type' => {},
        'units' => 's'
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'type' => {}
      },
      '3' => {
        'name' => 'sport',
        'number' => 3,
        'type' => {}
      },
      '4' => {
        'name' => 'elapsed_time',
        'number' => 4,
        'type' => {},
        'units' => 's'
      },
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
  },
  '34' => {
    'context' => 'ACTIVITY FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'total_timer_time',
        'number' => 0,
        'scale' => '1000',
        'type' => {},
        'units' => 's'
      },
      '1' => {
        'name' => 'num_sessions',
        'number' => 1,
        'scale' => '1',
        'type' => {}
      },
      '2' => {
        'name' => 'type',
        'number' => 2,
        'type' => {}
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253,
        'type' => {}
      },
      '3' => {
        'name' => 'event',
        'number' => 3,
        'type' => {}
      },
      '4' => {
        'name' => 'event_type',
        'number' => 4,
        'type' => {}
      },
      '5' => {
        'name' => 'local_timestamp',
        'number' => 5,
        'type' => {}
      },
      '6' => {
        'name' => 'event_group',
        'number' => 6,
        'type' => {}
      },
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
  },
  '35' => {
    'context' => 'DEVICE FILE MESSAGES',
    'fields' => {
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'type' => {}
      },
      '3' => {
        'name' => 'version',
        'number' => 3,
        'scale' => '100',
        'type' => {}
      },
      '5' => {
        'name' => 'part_number',
        'number' => 5,
        'type' => {}
      },
      'message_index' => {},
      'part_number' => {},
      'version' => {}
    },
    'name' => 'software',
    'number' => 35
  },
  '37' => {
    'context' => 'DEVICE FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'type',
        'number' => 0,
        'type' => {}
      },
      '1' => {
        'name' => 'flags',
        'number' => 1,
        'type' => {}
      },
      '2' => {
        'name' => 'directory',
        'number' => 2,
        'type' => {}
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'type' => {}
      },
      '3' => {
        'name' => 'max_count',
        'number' => 3,
        'type' => {}
      },
      '4' => {
        'name' => 'max_size',
        'number' => 4,
        'type' => {},
        'units' => 'bytes'
      },
      'directory' => {},
      'flags' => {},
      'max_count' => {},
      'max_size' => {},
      'message_index' => {},
      'type' => {}
    },
    'name' => 'file_capabilities',
    'number' => 37
  },
  '38' => {
    'context' => 'DEVICE FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'file',
        'number' => 0,
        'type' => {}
      },
      '1' => {
        'name' => 'mesg_num',
        'number' => 1,
        'type' => {}
      },
      '2' => {
        'name' => 'count_type',
        'number' => 2,
        'type' => {}
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'type' => {}
      },
      '3' => {
        'name' => 'count',
        'number' => 3,
        'type' => {}
      },
      'count' => {},
      'count_type' => {},
      'file' => {},
      'mesg_num' => {},
      'message_index' => {}
    },
    'name' => 'mesg_capabilities',
    'number' => 38
  },
  '39' => {
    'context' => 'DEVICE FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'file',
        'number' => 0,
        'type' => {}
      },
      '1' => {
        'name' => 'mesg_num',
        'number' => 1,
        'type' => {}
      },
      '2' => {
        'name' => 'field_num',
        'number' => 2,
        'type' => {}
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'type' => {}
      },
      '3' => {
        'name' => 'count',
        'number' => 3,
        'type' => {}
      },
      'count' => {},
      'field_num' => {},
      'file' => {},
      'mesg_num' => {},
      'message_index' => {}
    },
    'name' => 'field_capabilities',
    'number' => 39
  },
  '4' => {
    'context' => 'SETTINGS FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'enabled',
        'number' => 0,
        'type' => {}
      },
      '1' => {
        'name' => 'hrm_ant_id',
        'number' => 1,
        'scale' => '1',
        'type' => {}
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'scale' => '1',
        'type' => {}
      },
      'enabled' => {},
      'hrm_ant_id' => {},
      'message_index' => {}
    },
    'name' => 'hrm_profile',
    'number' => 4
  },
  '49' => {
    'context' => 'COMMON MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'software_version',
        'number' => 0,
        'type' => {}
      },
      '1' => {
        'name' => 'hardware_version',
        'number' => 1,
        'type' => {}
      },
      'hardware_version' => {},
      'software_version' => {}
    },
    'name' => 'file_creator',
    'number' => 49
  },
  '5' => {
    'context' => 'SETTINGS FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'enabled',
        'number' => 0,
        'type' => {}
      },
      '1' => {
        'name' => 'sdm_ant_id',
        'number' => 1,
        'scale' => '1',
        'type' => {}
      },
      '2' => {
        'name' => 'sdm_cal_factor',
        'number' => 2,
        'scale' => '10',
        'type' => {},
        'units' => '%'
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'scale' => '1',
        'type' => {}
      },
      '3' => {
        'name' => 'odometer',
        'number' => 3,
        'scale' => '100',
        'type' => {},
        'units' => 'm'
      },
      '4' => {
        'name' => 'speed_source',
        'number' => 4,
        'type' => {}
      },
      'enabled' => {},
      'message_index' => {},
      'odometer' => {},
      'sdm_ant_id' => {},
      'sdm_cal_factor' => {},
      'speed_source' => {}
    },
    'name' => 'sdm_profile',
    'number' => 5
  },
  '51' => {
    'context' => 'WEIGHT SCALE FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'systolic_pressure',
        'number' => 0,
        'scale' => '1',
        'type' => {},
        'units' => 'mmHg'
      },
      '1' => {
        'name' => 'diastolic_pressure',
        'number' => 1,
        'scale' => '1',
        'type' => {},
        'units' => 'mmHg'
      },
      '2' => {
        'name' => 'mean_arterial_pressure',
        'number' => 2,
        'scale' => '1',
        'type' => {},
        'units' => 'mmHg'
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253,
        'scale' => '1',
        'type' => {},
        'units' => 's'
      },
      '3' => {
        'name' => 'map_3_sample_mean',
        'number' => 3,
        'scale' => '1',
        'type' => {},
        'units' => 'mmHg'
      },
      '4' => {
        'name' => 'map_morning_values',
        'number' => 4,
        'scale' => '1',
        'type' => {},
        'units' => 'mmHg'
      },
      '5' => {
        'name' => 'map_evening_values',
        'number' => 5,
        'scale' => '1',
        'type' => {},
        'units' => 'mmHg'
      },
      '6' => {
        'name' => 'heart_rate',
        'number' => 6,
        'scale' => '1',
        'type' => {},
        'units' => 'bpm'
      },
      '7' => {
        'name' => 'heart_rate_type',
        'number' => 7,
        'type' => {}
      },
      '8' => {
        'name' => 'status',
        'number' => 8,
        'type' => {}
      },
      '9' => {
        'name' => 'user_profile_index',
        'number' => 9,
        'type' => {}
      },
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
  },
  '6' => {
    'context' => 'SETTINGS FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'name',
        'number' => 0,
        'scale' => '1',
        'type' => {}
      },
      '1' => {
        'name' => 'sport',
        'number' => 1,
        'scale' => '1',
        'type' => {}
      },
      '10' => {
        'name' => 'bike_weight',
        'number' => 10,
        'scale' => '10',
        'type' => {},
        'units' => 'kg'
      },
      '11' => {
        'name' => 'power_cal_factor',
        'number' => 11,
        'scale' => '10',
        'type' => {},
        'units' => '%'
      },
      '12' => {
        'name' => 'auto_wheel_cal',
        'number' => 12,
        'scale' => '1',
        'type' => {}
      },
      '13' => {
        'name' => 'auto_power_zero',
        'number' => 13,
        'scale' => '1',
        'type' => {}
      },
      '14' => {
        'name' => 'id',
        'number' => 14,
        'type' => {}
      },
      '15' => {
        'name' => 'spd_enabled',
        'number' => 15,
        'type' => {}
      },
      '16' => {
        'name' => 'cad_enabled',
        'number' => 16,
        'type' => {}
      },
      '17' => {
        'name' => 'spdcad_enabled',
        'number' => 17,
        'type' => {}
      },
      '18' => {
        'name' => 'power_enabled',
        'number' => 18,
        'type' => {}
      },
      '2' => {
        'name' => 'sub_sport',
        'number' => 2,
        'scale' => '1',
        'type' => {}
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'scale' => '1',
        'type' => {}
      },
      '3' => {
        'name' => 'odometer',
        'number' => 3,
        'scale' => '100',
        'type' => {},
        'units' => 'm'
      },
      '4' => {
        'name' => 'bike_spd_ant_id',
        'number' => 4,
        'scale' => '1',
        'type' => {}
      },
      '5' => {
        'name' => 'bike_cad_ant_id',
        'number' => 5,
        'scale' => '1',
        'type' => {}
      },
      '6' => {
        'name' => 'bike_spdcad_ant_id',
        'number' => 6,
        'scale' => '1',
        'type' => {}
      },
      '7' => {
        'name' => 'bike_power_ant_id',
        'number' => 7,
        'scale' => '1',
        'type' => {}
      },
      '8' => {
        'name' => 'custom_wheelsize',
        'number' => 8,
        'scale' => '1000',
        'type' => {},
        'units' => 'm'
      },
      '9' => {
        'name' => 'auto_wheelsize',
        'number' => 9,
        'scale' => '1000',
        'type' => {},
        'units' => 'm'
      },
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
  },
  '7' => {
    'context' => 'SPORT SETTINGS FILE MESSAGES',
    'fields' => {
      '1' => {
        'name' => 'max_heart_rate',
        'number' => 1,
        'scale' => '1',
        'type' => {}
      },
      '2' => {
        'name' => 'threshold_heart_rate',
        'number' => 2,
        'scale' => '1',
        'type' => {}
      },
      '3' => {
        'name' => 'functional_threshold_power',
        'number' => 3,
        'scale' => '1',
        'type' => {}
      },
      '5' => {
        'name' => 'hr_calc_type',
        'number' => 5,
        'scale' => '1',
        'type' => {}
      },
      '7' => {
        'name' => 'pwr_calc_type',
        'number' => 7,
        'scale' => '1',
        'type' => {}
      },
      'functional_threshold_power' => {},
      'hr_calc_type' => {},
      'max_heart_rate' => {},
      'pwr_calc_type' => {},
      'threshold_heart_rate' => {}
    },
    'name' => 'zones_target',
    'number' => 7
  },
  '8' => {
    'context' => 'SPORT SETTINGS FILE MESSAGES',
    'fields' => {
      '1' => {
        'name' => 'high_bpm',
        'number' => 1,
        'scale' => '1',
        'type' => {},
        'units' => 'bpm'
      },
      '2' => {
        'name' => 'name',
        'number' => 2,
        'scale' => '1',
        'type' => {}
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'scale' => '1',
        'type' => {}
      },
      'high_bpm' => {},
      'message_index' => {},
      'name' => {}
    },
    'name' => 'hr_zone',
    'number' => 8
  },
  '9' => {
    'context' => 'SPORT SETTINGS FILE MESSAGES',
    'fields' => {
      '1' => {
        'name' => 'high_value',
        'number' => 1,
        'scale' => '1',
        'type' => {},
        'units' => 'watts'
      },
      '2' => {
        'name' => 'name',
        'number' => 2,
        'scale' => '1',
        'type' => {}
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254,
        'scale' => '1',
        'type' => {}
      },
      'high_value' => {},
      'message_index' => {},
      'name' => {}
    },
    'name' => 'power_zone',
    'number' => 9
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
$profile->{'19'}{'fields'}{'3'}{'type'} = $types->{'sint32'};
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
$profile->{'19'}{'fields'}{'sport'} = $profile->{'19'}{'fields'}{'25'};
$profile->{'19'}{'fields'}{'start_position_lat'} = $profile->{'19'}{'fields'}{'3'};
$profile->{'19'}{'fields'}{'start_position_long'} = $profile->{'19'}{'fields'}{'4'};
$profile->{'19'}{'fields'}{'start_time'} = $profile->{'19'}{'fields'}{'2'};
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
# END GENERATED

1;
__END__
=cut
