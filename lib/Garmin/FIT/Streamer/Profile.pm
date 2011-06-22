package Garmin::FIT::Streamer::Profile;

use strict;
use warnings;

our $VERSION = "1.000";

# BEGIN GENERATED
my ($base_types, $profile);

$base_types = {
  '0' => {
    'decoder' => [
      'C',
      'C'
    ],
    'invalid' => 255,
    'name' => 'enum',
    'notice' => 1,
    'number' => 0,
    'size' => 1
  },
  '1' => {
    'decoder' => [
      'c',
      'c'
    ],
    'invalid' => 127,
    'name' => 'sint8',
    'notice' => 1,
    'number' => 1,
    'size' => 1
  },
  '10' => {
    'decoder' => [
      'C',
      'C'
    ],
    'invalid' => 0,
    'name' => 'uint8z',
    'notice' => 1,
    'number' => 10,
    'size' => 1
  },
  '13' => {
    'decoder' => [
      'a',
      'a'
    ],
    'invalid' => 255,
    'name' => 'byte',
    'notice' => 1,
    'number' => 13,
    'size' => 0
  },
  '131' => {
    'decoder' => [
      'v!',
      'n!'
    ],
    'invalid' => 32767,
    'name' => 'sint16',
    'notice' => 1,
    'number' => 131,
    'size' => 2
  },
  '132' => {
    'decoder' => [
      'v',
      'n'
    ],
    'invalid' => 65535,
    'name' => 'uint16',
    'notice' => 1,
    'number' => 132,
    'size' => 2
  },
  '133' => {
    'decoder' => [
      'V!',
      'N!'
    ],
    'invalid' => 2147483647,
    'name' => 'sint32',
    'notice' => 1,
    'number' => 133,
    'size' => 4
  },
  '134' => {
    'decoder' => [
      'V',
      'N'
    ],
    'invalid' => 4294967295,
    'name' => 'uint32',
    'notice' => 1,
    'number' => 134,
    'size' => 4
  },
  '136' => {
    'decoder' => [
      'f<',
      'f>'
    ],
    'invalid' => 4294967295,
    'name' => 'float32',
    'notice' => 1,
    'number' => 136,
    'size' => 4
  },
  '137' => {
    'decoder' => [
      'd<',
      'd>'
    ],
    'invalid' => '18446744073709551615',
    'name' => 'float64',
    'notice' => 1,
    'number' => 137,
    'size' => 4
  },
  '139' => {
    'decoder' => [
      'v',
      'n'
    ],
    'invalid' => 0,
    'name' => 'uint16z',
    'notice' => 1,
    'number' => 139,
    'size' => 2
  },
  '140' => {
    'decoder' => [
      'V',
      'N'
    ],
    'invalid' => 0,
    'name' => 'uint32z',
    'notice' => 1,
    'number' => 140,
    'size' => 4
  },
  '2' => {
    'decoder' => [
      'C',
      'C'
    ],
    'invalid' => 255,
    'name' => 'uint8',
    'notice' => 1,
    'number' => 2,
    'size' => 1
  },
  '7' => {
    'decoder' => [
      'Z',
      'Z'
    ],
    'invalid' => '',
    'name' => 'string',
    'notice' => 1,
    'number' => 7,
    'size' => 0
  },
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
$profile = {
  '0' => {
    'comment' => 'Must be first message in file.',
    'context' => 'COMMON MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'type',
        'number' => 0
      },
      '1' => {
        'name' => 'manufacturer',
        'number' => 1
      },
      '2' => {
        'name' => 'product',
        'number' => 2
      },
      '3' => {
        'name' => 'serial_number',
        'number' => 3
      },
      '4' => {
        'name' => 'time_created',
        'number' => 4
      },
      '5' => {
        'name' => 'number',
        'number' => 5
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
        'number' => 0
      },
      '1' => {
        'name' => 'sports',
        'number' => 1
      },
      '21' => {
        'name' => 'workouts_supported',
        'number' => 21
      },
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
        'number' => 1
      },
      '2' => {
        'name' => 'calories',
        'number' => 2
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
      },
      '3' => {
        'name' => 'fat_calories',
        'number' => 3
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
        'number' => 0
      },
      '1' => {
        'name' => 'sub_sport',
        'number' => 1
      },
      '3' => {
        'name' => 'name',
        'number' => 3
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
        'number' => 0
      },
      '1' => {
        'name' => 'sub_sport',
        'number' => 1
      },
      '10' => {
        'name' => 'enabled',
        'number' => 10
      },
      '2' => {
        'name' => 'start_date',
        'number' => 2
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
      },
      '3' => {
        'name' => 'end_date',
        'number' => 3
      },
      '4' => {
        'name' => 'type',
        'number' => 4
      },
      '5' => {
        'name' => 'value',
        'number' => 5
      },
      '6' => {
        'name' => 'repeat',
        'number' => 6
      },
      '7' => {
        'name' => 'target_value',
        'number' => 7
      },
      '8' => {
        'name' => 'recurrence',
        'number' => 8
      },
      '9' => {
        'name' => 'recurrence_value',
        'number' => 9
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
        'number' => 0
      },
      '1' => {
        'name' => 'event_type',
        'number' => 1
      },
      '10' => {
        'name' => 'total_cycles',
        'number' => 10
      },
      '11' => {
        'name' => 'total_calories',
        'number' => 11
      },
      '13' => {
        'name' => 'total_fat_calories',
        'number' => 13
      },
      '14' => {
        'name' => 'avg_speed',
        'number' => 14
      },
      '15' => {
        'name' => 'max_speed',
        'number' => 15
      },
      '16' => {
        'name' => 'avg_heart_rate',
        'number' => 16
      },
      '17' => {
        'name' => 'max_heart_rate',
        'number' => 17
      },
      '18' => {
        'name' => 'avg_cadence',
        'number' => 18
      },
      '19' => {
        'name' => 'max_cadence',
        'number' => 19
      },
      '2' => {
        'name' => 'start_time',
        'number' => 2
      },
      '20' => {
        'name' => 'avg_power',
        'number' => 20
      },
      '21' => {
        'name' => 'max_power',
        'number' => 21
      },
      '22' => {
        'name' => 'total_ascent',
        'number' => 22
      },
      '23' => {
        'name' => 'total_descent',
        'number' => 23
      },
      '24' => {
        'name' => 'total_training_effect',
        'number' => 24
      },
      '25' => {
        'name' => 'first_lap_index',
        'number' => 25
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
      },
      '26' => {
        'name' => 'num_laps',
        'number' => 26
      },
      '27' => {
        'name' => 'event_group',
        'number' => 27
      },
      '28' => {
        'name' => 'trigger',
        'number' => 28
      },
      '29' => {
        'name' => 'nec_lat',
        'number' => 29
      },
      '3' => {
        'name' => 'start_position_lat',
        'number' => 3
      },
      '30' => {
        'name' => 'nec_long',
        'number' => 30
      },
      '31' => {
        'name' => 'swc_lat',
        'number' => 31
      },
      '32' => {
        'name' => 'swc_long',
        'number' => 32
      },
      '4' => {
        'name' => 'start_position_long',
        'number' => 4
      },
      '5' => {
        'name' => 'sport',
        'number' => 5
      },
      '6' => {
        'name' => 'sub_sport',
        'number' => 6
      },
      '7' => {
        'name' => 'total_elapsed_time',
        'number' => 7
      },
      '8' => {
        'name' => 'total_timer_time',
        'number' => 8
      },
      '9' => {
        'name' => 'total_distance',
        'number' => 9
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
        'number' => 0
      },
      '1' => {
        'name' => 'event_type',
        'number' => 1
      },
      '10' => {
        'name' => 'total_cycles',
        'number' => 10
      },
      '11' => {
        'name' => 'total_calories',
        'number' => 11
      },
      '12' => {
        'name' => 'total_fat_calories',
        'number' => 12
      },
      '13' => {
        'name' => 'avg_speed',
        'number' => 13
      },
      '14' => {
        'name' => 'max_speed',
        'number' => 14
      },
      '15' => {
        'name' => 'avg_heart_rate',
        'number' => 15
      },
      '16' => {
        'name' => 'max_heart_rate',
        'number' => 16
      },
      '17' => {
        'name' => 'avg_cadence',
        'number' => 17
      },
      '18' => {
        'name' => 'max_cadence',
        'number' => 18
      },
      '19' => {
        'name' => 'avg_power',
        'number' => 19
      },
      '2' => {
        'name' => 'start_time',
        'number' => 2
      },
      '20' => {
        'name' => 'max_power',
        'number' => 20
      },
      '21' => {
        'name' => 'total_ascent',
        'number' => 21
      },
      '22' => {
        'name' => 'total_descent',
        'number' => 22
      },
      '23' => {
        'name' => 'intensity',
        'number' => 23
      },
      '24' => {
        'name' => 'lap_trigger',
        'number' => 24
      },
      '25' => {
        'name' => 'sport',
        'number' => 25
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
      },
      '26' => {
        'name' => 'event_group',
        'number' => 26
      },
      '3' => {
        'name' => 'start_position_lat',
        'number' => 3
      },
      '4' => {
        'name' => 'start_position_long',
        'number' => 4
      },
      '5' => {
        'name' => 'end_position_lat',
        'number' => 5
      },
      '6' => {
        'name' => 'end_position_long',
        'number' => 6
      },
      '7' => {
        'name' => 'total_elapsed_time',
        'number' => 7
      },
      '8' => {
        'name' => 'total_timer_time',
        'number' => 8
      },
      '9' => {
        'name' => 'total_distance',
        'number' => 9
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
        'number' => 1
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
        'number' => 0
      },
      '1' => {
        'name' => 'position_long',
        'number' => 1
      },
      '10' => {
        'name' => 'resistance',
        'number' => 10
      },
      '11' => {
        'name' => 'time_from_course',
        'number' => 11
      },
      '12' => {
        'name' => 'cycle_length',
        'number' => 12
      },
      '13' => {
        'name' => 'temperature',
        'number' => 13
      },
      '2' => {
        'name' => 'altitude',
        'number' => 2
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253
      },
      '3' => {
        'name' => 'heart_rate',
        'number' => 3
      },
      '4' => {
        'name' => 'cadence',
        'number' => 4
      },
      '5' => {
        'name' => 'distance',
        'number' => 5
      },
      '6' => {
        'name' => 'speed',
        'number' => 6
      },
      '7' => {
        'name' => 'power',
        'number' => 7
      },
      '8' => {
        'name' => 'compressed_speed_distance',
        'number' => 8
      },
      '9' => {
        'name' => 'grade',
        'number' => 9
      },
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
  },
  '21' => {
    'context' => 'ACTIVITY FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'event',
        'number' => 0
      },
      '1' => {
        'name' => 'event_type',
        'number' => 1
      },
      '2' => {
        'name' => 'data16',
        'number' => 2
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253
      },
      '3' => {
        'name' => 'data',
        'number' => 3
      },
      '4' => {
        'name' => 'event_group',
        'number' => 4
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
        'name' => 'device_index',
        'number' => 0
      },
      '1' => {
        'name' => 'device_type',
        'number' => 1
      },
      '10' => {
        'name' => 'battery_voltage',
        'number' => 10
      },
      '11' => {
        'name' => 'battery_status',
        'number' => 11
      },
      '2' => {
        'name' => 'manufacturer',
        'number' => 2
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253
      },
      '3' => {
        'name' => 'serial_number',
        'number' => 3
      },
      '4' => {
        'name' => 'product',
        'number' => 4
      },
      '5' => {
        'name' => 'software_version',
        'number' => 5
      },
      '6' => {
        'name' => 'hardware_version',
        'number' => 6
      },
      '7' => {
        'name' => 'cum_operating_time',
        'number' => 7
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
        'number' => 4
      },
      '5' => {
        'name' => 'capabilities',
        'number' => 5
      },
      '6' => {
        'name' => 'num_valid_steps',
        'number' => 6
      },
      '8' => {
        'name' => 'wkt_name',
        'number' => 8
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
        'number' => 0
      },
      '1' => {
        'name' => 'duration_type',
        'number' => 1
      },
      '2' => {
        'name' => 'duration_value',
        'number' => 2
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
      },
      '3' => {
        'name' => 'target_type',
        'number' => 3
      },
      '4' => {
        'name' => 'target_value',
        'number' => 4
      },
      '5' => {
        'name' => 'custom_target_value_low',
        'number' => 5
      },
      '6' => {
        'name' => 'custom_target_value_high',
        'number' => 6
      },
      '7' => {
        'name' => 'intensity',
        'number' => 7
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
        'number' => 0
      },
      '1' => {
        'name' => 'gender',
        'number' => 1
      },
      '10' => {
        'name' => 'default_max_biking_heart_rate',
        'number' => 10
      },
      '11' => {
        'name' => 'default_max_heart_rate',
        'number' => 11
      },
      '12' => {
        'name' => 'hr_setting',
        'number' => 12
      },
      '13' => {
        'name' => 'speed_setting',
        'number' => 13
      },
      '14' => {
        'name' => 'dist_setting',
        'number' => 14
      },
      '16' => {
        'name' => 'power_setting',
        'number' => 16
      },
      '17' => {
        'name' => 'activity_class',
        'number' => 17
      },
      '18' => {
        'name' => 'position_setting',
        'number' => 18
      },
      '2' => {
        'name' => 'age',
        'number' => 2
      },
      '21' => {
        'name' => 'temperature_setting',
        'number' => 21
      },
      '22' => {
        'name' => 'local_id',
        'number' => 22
      },
      '23' => {
        'name' => 'global_id',
        'number' => 23
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
      },
      '3' => {
        'name' => 'height',
        'number' => 3
      },
      '4' => {
        'name' => 'weight',
        'number' => 4
      },
      '5' => {
        'name' => 'language',
        'number' => 5
      },
      '6' => {
        'name' => 'elev_setting',
        'number' => 6
      },
      '7' => {
        'name' => 'weight_setting',
        'number' => 7
      },
      '8' => {
        'name' => 'resting_heart_rate',
        'number' => 8
      },
      '9' => {
        'name' => 'default_max_running_heart_rate',
        'number' => 9
      },
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
  },
  '30' => {
    'context' => 'WEIGHT SCALE FILE MESSAGES',
    'fields' => {
      '0' => {
        'name' => 'weight',
        'number' => 0
      },
      '1' => {
        'name' => 'percent_fat',
        'number' => 1
      },
      '10' => {
        'name' => 'metabolic_age',
        'number' => 10
      },
      '11' => {
        'name' => 'visceral_fat_rating',
        'number' => 11
      },
      '12' => {
        'name' => 'user_profile_index',
        'number' => 12
      },
      '2' => {
        'name' => 'percent_hydration',
        'number' => 2
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253
      },
      '3' => {
        'name' => 'visceral_fat_mass',
        'number' => 3
      },
      '4' => {
        'name' => 'bone_mass',
        'number' => 4
      },
      '5' => {
        'name' => 'muscle_mass',
        'number' => 5
      },
      '7' => {
        'name' => 'basal_met',
        'number' => 7
      },
      '8' => {
        'name' => 'physique_rating',
        'number' => 8
      },
      '9' => {
        'name' => 'active_met',
        'number' => 9
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
        'number' => 4
      },
      '5' => {
        'name' => 'name',
        'number' => 5
      },
      '6' => {
        'name' => 'capabilities',
        'number' => 6
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
        'number' => 1
      },
      '2' => {
        'name' => 'position_lat',
        'number' => 2
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
      },
      '3' => {
        'name' => 'position_long',
        'number' => 3
      },
      '4' => {
        'name' => 'distance',
        'number' => 4
      },
      '5' => {
        'name' => 'type',
        'number' => 5
      },
      '6' => {
        'name' => 'name',
        'number' => 6
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
      '253' => {
        'name' => 'timestamp',
        'number' => 253
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
      },
      '3' => {
        'name' => 'sport',
        'number' => 3
      },
      '4' => {
        'name' => 'elapsed_time',
        'number' => 4
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
        'number' => 0
      },
      '1' => {
        'name' => 'num_sessions',
        'number' => 1
      },
      '2' => {
        'name' => 'type',
        'number' => 2
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253
      },
      '3' => {
        'name' => 'event',
        'number' => 3
      },
      '4' => {
        'name' => 'event_type',
        'number' => 4
      },
      '5' => {
        'name' => 'local_timestamp',
        'number' => 5
      },
      '6' => {
        'name' => 'event_group',
        'number' => 6
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
        'number' => 254
      },
      '3' => {
        'name' => 'version',
        'number' => 3
      },
      '5' => {
        'name' => 'part_number',
        'number' => 5
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
        'number' => 0
      },
      '1' => {
        'name' => 'flags',
        'number' => 1
      },
      '2' => {
        'name' => 'directory',
        'number' => 2
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
      },
      '3' => {
        'name' => 'max_count',
        'number' => 3
      },
      '4' => {
        'name' => 'max_size',
        'number' => 4
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
        'number' => 0
      },
      '1' => {
        'name' => 'mesg_num',
        'number' => 1
      },
      '2' => {
        'name' => 'count_type',
        'number' => 2
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
      },
      '3' => {
        'name' => 'count',
        'number' => 3
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
        'number' => 0
      },
      '1' => {
        'name' => 'mesg_num',
        'number' => 1
      },
      '2' => {
        'name' => 'field_num',
        'number' => 2
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
      },
      '3' => {
        'name' => 'count',
        'number' => 3
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
        'number' => 0
      },
      '1' => {
        'name' => 'hrm_ant_id',
        'number' => 1
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
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
        'number' => 0
      },
      '1' => {
        'name' => 'hardware_version',
        'number' => 1
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
        'number' => 0
      },
      '1' => {
        'name' => 'sdm_ant_id',
        'number' => 1
      },
      '2' => {
        'name' => 'sdm_cal_factor',
        'number' => 2
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
      },
      '3' => {
        'name' => 'odometer',
        'number' => 3
      },
      '4' => {
        'name' => 'speed_source',
        'number' => 4
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
        'number' => 0
      },
      '1' => {
        'name' => 'diastolic_pressure',
        'number' => 1
      },
      '2' => {
        'name' => 'mean_arterial_pressure',
        'number' => 2
      },
      '253' => {
        'name' => 'timestamp',
        'number' => 253
      },
      '3' => {
        'name' => 'map_3_sample_mean',
        'number' => 3
      },
      '4' => {
        'name' => 'map_morning_values',
        'number' => 4
      },
      '5' => {
        'name' => 'map_evening_values',
        'number' => 5
      },
      '6' => {
        'name' => 'heart_rate',
        'number' => 6
      },
      '7' => {
        'name' => 'heart_rate_type',
        'number' => 7
      },
      '8' => {
        'name' => 'status',
        'number' => 8
      },
      '9' => {
        'name' => 'user_profile_index',
        'number' => 9
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
        'number' => 0
      },
      '1' => {
        'name' => 'sport',
        'number' => 1
      },
      '10' => {
        'name' => 'bike_weight',
        'number' => 10
      },
      '11' => {
        'name' => 'power_cal_factor',
        'number' => 11
      },
      '12' => {
        'name' => 'auto_wheel_cal',
        'number' => 12
      },
      '13' => {
        'name' => 'auto_power_zero',
        'number' => 13
      },
      '14' => {
        'name' => 'id',
        'number' => 14
      },
      '15' => {
        'name' => 'spd_enabled',
        'number' => 15
      },
      '16' => {
        'name' => 'cad_enabled',
        'number' => 16
      },
      '17' => {
        'name' => 'spdcad_enabled',
        'number' => 17
      },
      '18' => {
        'name' => 'power_enabled',
        'number' => 18
      },
      '2' => {
        'name' => 'sub_sport',
        'number' => 2
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
      },
      '3' => {
        'name' => 'odometer',
        'number' => 3
      },
      '4' => {
        'name' => 'bike_spd_ant_id',
        'number' => 4
      },
      '5' => {
        'name' => 'bike_cad_ant_id',
        'number' => 5
      },
      '6' => {
        'name' => 'bike_spdcad_ant_id',
        'number' => 6
      },
      '7' => {
        'name' => 'bike_power_ant_id',
        'number' => 7
      },
      '8' => {
        'name' => 'custom_wheelsize',
        'number' => 8
      },
      '9' => {
        'name' => 'auto_wheelsize',
        'number' => 9
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
        'number' => 1
      },
      '2' => {
        'name' => 'threshold_heart_rate',
        'number' => 2
      },
      '3' => {
        'name' => 'functional_threshold_power',
        'number' => 3
      },
      '5' => {
        'name' => 'hr_calc_type',
        'number' => 5
      },
      '7' => {
        'name' => 'pwr_calc_type',
        'number' => 7
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
        'number' => 1
      },
      '2' => {
        'name' => 'name',
        'number' => 2
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
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
        'number' => 1
      },
      '2' => {
        'name' => 'name',
        'number' => 2
      },
      '254' => {
        'name' => 'message_index',
        'number' => 254
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
$profile->{'0'}{'fields'}{'manufacturer'} = $profile->{'0'}{'fields'}{'1'};
$profile->{'0'}{'fields'}{'number'} = $profile->{'0'}{'fields'}{'5'};
$profile->{'0'}{'fields'}{'product'} = $profile->{'0'}{'fields'}{'2'};
$profile->{'0'}{'fields'}{'serial_number'} = $profile->{'0'}{'fields'}{'3'};
$profile->{'0'}{'fields'}{'time_created'} = $profile->{'0'}{'fields'}{'4'};
$profile->{'0'}{'fields'}{'type'} = $profile->{'0'}{'fields'}{'0'};
$profile->{'1'}{'fields'}{'languages'} = $profile->{'1'}{'fields'}{'0'};
$profile->{'1'}{'fields'}{'sports'} = $profile->{'1'}{'fields'}{'1'};
$profile->{'1'}{'fields'}{'workouts_supported'} = $profile->{'1'}{'fields'}{'21'};
$profile->{'10'}{'fields'}{'calories'} = $profile->{'10'}{'fields'}{'2'};
$profile->{'10'}{'fields'}{'fat_calories'} = $profile->{'10'}{'fields'}{'3'};
$profile->{'10'}{'fields'}{'high_bpm'} = $profile->{'10'}{'fields'}{'1'};
$profile->{'10'}{'fields'}{'message_index'} = $profile->{'10'}{'fields'}{'254'};
$profile->{'12'}{'fields'}{'name'} = $profile->{'12'}{'fields'}{'3'};
$profile->{'12'}{'fields'}{'sport'} = $profile->{'12'}{'fields'}{'0'};
$profile->{'12'}{'fields'}{'sub_sport'} = $profile->{'12'}{'fields'}{'1'};
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
$profile->{'2'}{'fields'}{'utc_offset'} = $profile->{'2'}{'fields'}{'1'};
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
$profile->{'21'}{'fields'}{'data'} = $profile->{'21'}{'fields'}{'3'};
$profile->{'21'}{'fields'}{'data16'} = $profile->{'21'}{'fields'}{'2'};
$profile->{'21'}{'fields'}{'event'} = $profile->{'21'}{'fields'}{'0'};
$profile->{'21'}{'fields'}{'event_group'} = $profile->{'21'}{'fields'}{'4'};
$profile->{'21'}{'fields'}{'event_type'} = $profile->{'21'}{'fields'}{'1'};
$profile->{'21'}{'fields'}{'timestamp'} = $profile->{'21'}{'fields'}{'253'};
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
$profile->{'26'}{'fields'}{'capabilities'} = $profile->{'26'}{'fields'}{'5'};
$profile->{'26'}{'fields'}{'num_valid_steps'} = $profile->{'26'}{'fields'}{'6'};
$profile->{'26'}{'fields'}{'sport'} = $profile->{'26'}{'fields'}{'4'};
$profile->{'26'}{'fields'}{'wkt_name'} = $profile->{'26'}{'fields'}{'8'};
$profile->{'27'}{'fields'}{'custom_target_value_high'} = $profile->{'27'}{'fields'}{'6'};
$profile->{'27'}{'fields'}{'custom_target_value_low'} = $profile->{'27'}{'fields'}{'5'};
$profile->{'27'}{'fields'}{'duration_type'} = $profile->{'27'}{'fields'}{'1'};
$profile->{'27'}{'fields'}{'duration_value'} = $profile->{'27'}{'fields'}{'2'};
$profile->{'27'}{'fields'}{'intensity'} = $profile->{'27'}{'fields'}{'7'};
$profile->{'27'}{'fields'}{'message_index'} = $profile->{'27'}{'fields'}{'254'};
$profile->{'27'}{'fields'}{'target_type'} = $profile->{'27'}{'fields'}{'3'};
$profile->{'27'}{'fields'}{'target_value'} = $profile->{'27'}{'fields'}{'4'};
$profile->{'27'}{'fields'}{'wkt_step_name'} = $profile->{'27'}{'fields'}{'0'};
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
$profile->{'31'}{'fields'}{'capabilities'} = $profile->{'31'}{'fields'}{'6'};
$profile->{'31'}{'fields'}{'name'} = $profile->{'31'}{'fields'}{'5'};
$profile->{'31'}{'fields'}{'sport'} = $profile->{'31'}{'fields'}{'4'};
$profile->{'32'}{'fields'}{'distance'} = $profile->{'32'}{'fields'}{'4'};
$profile->{'32'}{'fields'}{'message_index'} = $profile->{'32'}{'fields'}{'254'};
$profile->{'32'}{'fields'}{'name'} = $profile->{'32'}{'fields'}{'6'};
$profile->{'32'}{'fields'}{'position_lat'} = $profile->{'32'}{'fields'}{'2'};
$profile->{'32'}{'fields'}{'position_long'} = $profile->{'32'}{'fields'}{'3'};
$profile->{'32'}{'fields'}{'timestamp'} = $profile->{'32'}{'fields'}{'1'};
$profile->{'32'}{'fields'}{'type'} = $profile->{'32'}{'fields'}{'5'};
$profile->{'33'}{'fields'}{'calories'} = $profile->{'33'}{'fields'}{'2'};
$profile->{'33'}{'fields'}{'distance'} = $profile->{'33'}{'fields'}{'1'};
$profile->{'33'}{'fields'}{'elapsed_time'} = $profile->{'33'}{'fields'}{'4'};
$profile->{'33'}{'fields'}{'message_index'} = $profile->{'33'}{'fields'}{'254'};
$profile->{'33'}{'fields'}{'sport'} = $profile->{'33'}{'fields'}{'3'};
$profile->{'33'}{'fields'}{'timer_time'} = $profile->{'33'}{'fields'}{'0'};
$profile->{'33'}{'fields'}{'timestamp'} = $profile->{'33'}{'fields'}{'253'};
$profile->{'34'}{'fields'}{'event'} = $profile->{'34'}{'fields'}{'3'};
$profile->{'34'}{'fields'}{'event_group'} = $profile->{'34'}{'fields'}{'6'};
$profile->{'34'}{'fields'}{'event_type'} = $profile->{'34'}{'fields'}{'4'};
$profile->{'34'}{'fields'}{'local_timestamp'} = $profile->{'34'}{'fields'}{'5'};
$profile->{'34'}{'fields'}{'num_sessions'} = $profile->{'34'}{'fields'}{'1'};
$profile->{'34'}{'fields'}{'timestamp'} = $profile->{'34'}{'fields'}{'253'};
$profile->{'34'}{'fields'}{'total_timer_time'} = $profile->{'34'}{'fields'}{'0'};
$profile->{'34'}{'fields'}{'type'} = $profile->{'34'}{'fields'}{'2'};
$profile->{'35'}{'fields'}{'message_index'} = $profile->{'35'}{'fields'}{'254'};
$profile->{'35'}{'fields'}{'part_number'} = $profile->{'35'}{'fields'}{'5'};
$profile->{'35'}{'fields'}{'version'} = $profile->{'35'}{'fields'}{'3'};
$profile->{'37'}{'fields'}{'directory'} = $profile->{'37'}{'fields'}{'2'};
$profile->{'37'}{'fields'}{'flags'} = $profile->{'37'}{'fields'}{'1'};
$profile->{'37'}{'fields'}{'max_count'} = $profile->{'37'}{'fields'}{'3'};
$profile->{'37'}{'fields'}{'max_size'} = $profile->{'37'}{'fields'}{'4'};
$profile->{'37'}{'fields'}{'message_index'} = $profile->{'37'}{'fields'}{'254'};
$profile->{'37'}{'fields'}{'type'} = $profile->{'37'}{'fields'}{'0'};
$profile->{'38'}{'fields'}{'count'} = $profile->{'38'}{'fields'}{'3'};
$profile->{'38'}{'fields'}{'count_type'} = $profile->{'38'}{'fields'}{'2'};
$profile->{'38'}{'fields'}{'file'} = $profile->{'38'}{'fields'}{'0'};
$profile->{'38'}{'fields'}{'mesg_num'} = $profile->{'38'}{'fields'}{'1'};
$profile->{'38'}{'fields'}{'message_index'} = $profile->{'38'}{'fields'}{'254'};
$profile->{'39'}{'fields'}{'count'} = $profile->{'39'}{'fields'}{'3'};
$profile->{'39'}{'fields'}{'field_num'} = $profile->{'39'}{'fields'}{'2'};
$profile->{'39'}{'fields'}{'file'} = $profile->{'39'}{'fields'}{'0'};
$profile->{'39'}{'fields'}{'mesg_num'} = $profile->{'39'}{'fields'}{'1'};
$profile->{'39'}{'fields'}{'message_index'} = $profile->{'39'}{'fields'}{'254'};
$profile->{'4'}{'fields'}{'enabled'} = $profile->{'4'}{'fields'}{'0'};
$profile->{'4'}{'fields'}{'hrm_ant_id'} = $profile->{'4'}{'fields'}{'1'};
$profile->{'4'}{'fields'}{'message_index'} = $profile->{'4'}{'fields'}{'254'};
$profile->{'49'}{'fields'}{'hardware_version'} = $profile->{'49'}{'fields'}{'1'};
$profile->{'49'}{'fields'}{'software_version'} = $profile->{'49'}{'fields'}{'0'};
$profile->{'5'}{'fields'}{'enabled'} = $profile->{'5'}{'fields'}{'0'};
$profile->{'5'}{'fields'}{'message_index'} = $profile->{'5'}{'fields'}{'254'};
$profile->{'5'}{'fields'}{'odometer'} = $profile->{'5'}{'fields'}{'3'};
$profile->{'5'}{'fields'}{'sdm_ant_id'} = $profile->{'5'}{'fields'}{'1'};
$profile->{'5'}{'fields'}{'sdm_cal_factor'} = $profile->{'5'}{'fields'}{'2'};
$profile->{'5'}{'fields'}{'speed_source'} = $profile->{'5'}{'fields'}{'4'};
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
$profile->{'7'}{'fields'}{'functional_threshold_power'} = $profile->{'7'}{'fields'}{'3'};
$profile->{'7'}{'fields'}{'hr_calc_type'} = $profile->{'7'}{'fields'}{'5'};
$profile->{'7'}{'fields'}{'max_heart_rate'} = $profile->{'7'}{'fields'}{'1'};
$profile->{'7'}{'fields'}{'pwr_calc_type'} = $profile->{'7'}{'fields'}{'7'};
$profile->{'7'}{'fields'}{'threshold_heart_rate'} = $profile->{'7'}{'fields'}{'2'};
$profile->{'8'}{'fields'}{'high_bpm'} = $profile->{'8'}{'fields'}{'1'};
$profile->{'8'}{'fields'}{'message_index'} = $profile->{'8'}{'fields'}{'254'};
$profile->{'8'}{'fields'}{'name'} = $profile->{'8'}{'fields'}{'2'};
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

sub base_types {
    return $base_types;
}

sub profile {
    return $profile;
}

1;
__END__
=cut
