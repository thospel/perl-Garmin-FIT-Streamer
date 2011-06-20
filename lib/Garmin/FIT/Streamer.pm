package Garmin::FIT::Streamer;
use strict;
use warnings;

our $VERSION = '1.000';

use Carp;

use Data::Dumper;
$Data::Dumper::Indent = 1;
$Data::Dumper::Sortkeys = 1;

my %profile = (
    0xfff	=> "invalid",
    0	=> {
        name	=> "file_id",
        fields	=> {
            0	=> {
                name	=> "type",
            },
            1	=> {
                name	=> "manufacturer",
            },
            2	=> {
                name	=> "product",
            },
            3	=> {
                name	=> "serial_number",
            },
            4	=> {
                name	=> "time_created",
            },
            5	=> {
                name	=> "number",
            },
        },
    },
    49	=> {
        name	=> "file_creator",
        fields	=> {
            0	=> {
                name	=> "software_version",
            },
            1	=> {
                name	=> "hardware_version",
            },
        },
    },
    35	=> {
        name	=> "software",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            3	=> {
                name	=> "version",
            },
            5	=> {
                name	=> "part_number,",
            },
        },
    },
    1	=> {
        name	=> "capabilities",
        fields	=> {
            0	=> {
                name	=> "languages",
            },
            1	=> {
                name	=> "sports",
            },
            21	=> {
                name	=> "workouts_supported",
            },
        },
    },
    37	=> {
        name	=> "file_capabilities",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            0	=> {
                name	=> "type",
            },
            1	=> {
                name	=> "flags",
            },
            2	=> {
                name	=> "directory,",
            },
            3	=> {
                name	=> "max_count",
            },
            4	=> {
                name	=> "max_size",
            },
        },
    },
    38	=> {
        name	=> "mesg_capabilities",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            0	=> {
                name	=> "file",
            },
            1	=> {
                name	=> "mesg_num",
            },
            2	=> {
                name	=> "count_type",
            },
            3	=> {
                name	=> "count",
            },
        },
    },
    39	=> {
        name	=> "field_capabilities",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            0	=> {
                name	=> "file",
            },
            1	=> {
                name	=> "mesg_num",
            },
            2	=> {
                name	=> "field_num",
            },
            3	=> {
                name	=> "count",
            },
        },
    },
    2	=> {
        name	=> "device_settings",
        fields	=> {
            1	=> {
                name	=> "utc_offset",
            },
        },
    },
    3	=> {
        name	=> "user_profile",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            0	=> {
                name	=> "friendly_name,",
            },
            1	=> {
                name	=> "gender",
            },
            2	=> {
                name	=> "age",
            },
            3	=> {
                name	=> "height",
            },
            4	=> {
                name	=> "weight",
            },
            5	=> {
                name	=> "language",
            },
            6	=> {
                name	=> "elev_setting",
            },
            7	=> {
                name	=> "weight_setting",
            },
            8	=> {
                name	=> "resting_heart_rate",
            },
            9	=> {
                name	=> "default_max_running_heart_rate",
            },
            10	=> {
                name	=> "default_max_biking_heart_rate",
            },
            11	=> {
                name	=> "default_max_heart_rate",
            },
            12	=> {
                name	=> "hr_setting",
            },
            13	=> {
                name	=> "speed_setting",
            },
            14	=> {
                name	=> "dist_setting",
            },
            16	=> {
                name	=> "power_setting",
            },
            17	=> {
                name	=> "activity_class",
            },
            18	=> {
                name	=> "position_setting",
            },
            21	=> {
                name	=> "temperature_setting",
            },
            22	=> {
                name	=> "local_id",
            },
            23	=> {
                name	=> "global_id",
            },
        },
    },
    4	=> {
        name	=> "hrm_profile",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            0	=> {
                name	=> "enabled",
            },
            1	=> {
                name	=> "hrm_ant_id",
            },
        },
    },
    5	=> {
        name	=> "sdm_profile",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            0	=> {
                name	=> "enabled",
            },
            1	=> {
                name	=> "sdm_ant_id",
            },
            2	=> {
                name	=> "sdm_cal_factor",
            },
            3	=> {
                name	=> "odometer",
            },
            4	=> {
                name	=> "speed_source",
            },
        },
    },
    6	=> {
        name	=> "bike_profile",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            0	=> {
                name	=> "name,",
            },
            1	=> {
                name	=> "sport",
            },
            2	=> {
                name	=> "sub_sport",
            },
            3	=> {
                name	=> "odometer",
            },
            4	=> {
                name	=> "bike_spd_ant_id",
            },
            5	=> {
                name	=> "bike_cad_ant_id",
            },
            6	=> {
                name	=> "bike_spdcad_ant_id",
            },
            7	=> {
                name	=> "bike_power_ant_id",
            },
            8	=> {
                name	=> "custom_wheelsize",
            },
            9	=> {
                name	=> "auto_wheelsize",
            },
            10	=> {
                name	=> "bike_weight",
            },
            11	=> {
                name	=> "power_cal_factor",
            },
            12	=> {
                name	=> "auto_wheel_cal",
            },
            13	=> {
                name	=> "auto_power_zero",
            },
            14	=> {
                name	=> "id",
            },
            15	=> {
                name	=> "spd_enabled",
            },
            16	=> {
                name	=> "cad_enabled",
            },
            17	=> {
                name	=> "spdcad_enabled",
            },
            18	=> {
                name	=> "power_enabled",
            },
        },
    },
    7	=> {
        name	=> "zones_target",
        fields	=> {
            1	=> {
                name	=> "max_heart_rate",
            },
            2	=> {
                name	=> "threshold_heart_rate",
            },
            3	=> {
                name	=> "functional_threshold_power",
            },
            5	=> {
                name	=> "hr_calc_type",
            },
            7	=> {
                name	=> "pwr_calc_type",
            },
        },
    },
    12	=> {
        name	=> "sport",
        fields	=> {
            0	=> {
                name	=> "sport",
            },
            1	=> {
                name	=> "sub_sport",
            },
            3	=> {
                name	=> "name,",
            },
        },
    },
    8	=> {
        name	=> "hr_zone",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            1	=> {
                name	=> "high_bpm",
            },
            2	=> {
                name	=> "name",
            },
        },
    },
    9	=> {
        name	=> "power_zone",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            1	=> {
                name	=> "high_value",
            },
            2	=> {
                name	=> "name",
            },
        },
    },
    10	=> {
        name	=> "met_zone",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            1	=> {
                name	=> "high_bpm",
            },
            2	=> {
                name	=> "calories",
            },
            3	=> {
                name	=> "fat_calories",
            },
        },
    },
    15	=> {
        name	=> "goal",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            0	=> {
                name	=> "sport",
            },
            1	=> {
                name	=> "sub_sport",
            },
            2	=> {
                name	=> "start_date",
            },
            3	=> {
                name	=> "end_date",
            },
            4	=> {
                name	=> "type",
            },
            5	=> {
                name	=> "value",
            },
            6	=> {
                name	=> "repeat",
            },
            7	=> {
                name	=> "target_value",
            },
            8	=> {
                name	=> "recurrence",
            },
            9	=> {
                name	=> "recurrence_value",
            },
            10	=> {
                name	=> "enabled",
            },
        },
    },
    34	=> {
        name	=> "activity",
        fields	=> {
            253	=> {
                name	=> "timestamp",
            },
            0	=> {
                name	=> "total_timer_time",
            },
            1	=> {
                name	=> "num_sessions",
            },
            2	=> {
                name	=> "type",
            },
            3	=> {
                name	=> "event",
            },
            4	=> {
                name	=> "event_type",
            },
            5	=> {
                name	=> "local_timestamp",
            },
            6	=> {
                name	=> "event_group",
            },
        },
    },
    18	=> {
        name	=> "session",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            253	=> {
                name	=> "timestamp",
            },
            0	=> {
                name	=> "event",
            },
            1	=> {
                name	=> "event_type",
            },
            2	=> {
                name	=> "start_time",
            },
            3	=> {
                name	=> "start_position_lat",
            },
            4	=> {
                name	=> "start_position_long",
            },
            5	=> {
                name	=> "sport",
            },
            6	=> {
                name	=> "sub_sport",
            },
            7	=> {
                name	=> "total_elapsed_time",
            },
            8	=> {
                name	=> "total_timer_time",
            },
            9	=> {
                name	=> "total_distance",
            },
            10	=> {
                name	=> "total_cycles",
                alt_name	=> "total_strides",
            },
            11	=> {
                name	=> "total_calories",
            },
            13	=> {
                name	=> "total_fat_calories",
            },
            14	=> {
                name	=> "avg_speed",
            },
            15	=> {
                name	=> "max_speed",
            },
            16	=> {
                name	=> "avg_heart_rate",
            },
            17	=> {
                name	=> "max_heart_rate",
            },
            18	=> {
                name	=> "avg_cadence",
                alt_name	=> "avg_running_cadance",
            },
            19	=> {
                name	=> "max_cadence",
                alt_name	=> "max_running_cadance",
            },
            20	=> {
                name	=> "avg_power",
            },
            21	=> {
                name	=> "max_power",
            },
            22	=> {
                name	=> "total_ascent",
            },
            23	=> {
                name	=> "total_descent",
            },
            24	=> {
                name	=> "total_training_effect",
            },
            25	=> {
                name	=> "first_lap_index",
            },
            26	=> {
                name	=> "num_laps",
            },
            27	=> {
                name	=> "event_group",
            },
            28	=> {
                name	=> "trigger",
            },
            29	=> {
                name	=> "nec_lat",
            },
            30	=> {
                name	=> "nec_long",
            },
            31	=> {
                name	=> "swc_lat",
            },
            32	=> {
                name	=> "swc_long",
            },
        },
    },
    19	=> {
        name	=> "lap",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            253	=> {
                name	=> "timestamp",
            },
            0	=> {
                name	=> "event",
            },
            1	=> {
                name	=> "event_type",
            },
            2	=> {
                name	=> "start_time",
            },
            3	=> {
                name	=> "start_position_lat",
            },
            4	=> {
                name	=> "start_position_long",
            },
            5	=> {
                name	=> "end_position_lat",
            },
            6	=> {
                name	=> "end_position_long",
            },
            7	=> {
                name	=> "total_elapsed_time",
            },
            8	=> {
                name	=> "total_timer_time",
            },
            9	=> {
                name	=> "total_distance",
            },
            10	=> {
                name	=> "total_cycles",
                alt_name	=> "total_strides",
            },
            11	=> {
                name	=> "total_calories",
            },
            12	=> {
                name	=> "total_fat_calories",
            },
            13	=> {
                name	=> "avg_speed",
            },
            14	=> {
                name	=> "max_speed",
            },
            15	=> {
                name	=> "avg_heart_rate",
            },
            16	=> {
                name	=> "max_heart_rate",
            },
            17	=> {
                name	=> "avg_cadence",
            },
            18	=> {
                name	=> "max_cadence",
                alt_name	=> "max_running_cadance",
            },
            19	=> {
                name	=> "avg_power",
            },
            20	=> {
                name	=> "max_power",
            },
            21	=> {
                name	=> "total_ascent",
            },
            22	=> {
                name	=> "total_descent",
            },
            23	=> {
                name	=> "intensity",
            },
            24	=> {
                name	=> "lap_trigger",
            },
            25	=> {
                name	=> "sport",
            },
            26	=> {
                name	=> "event_group",
            },
        },
    },
    20	=> {
        name	=> "record",
        fields	=> {
            253	=> {
                name	=> "timestamp",
            },
            0	=> {
                name	=> "position_lat",
            },
            1	=> {
                name	=> "position_long",
            },
            2	=> {
                name	=> "altitude",
            },
            3	=> {
                name	=> "heart_rate",
            },
            4	=> {
                name	=> "cadence",
            },
            5	=> {
                name	=> "distance",
            },
            6	=> {
                name	=> "speed",
            },
            7	=> {
                name	=> "power",
            },
            8	=> {
                name	=> "compressed_speed_distance",
            },
            9	=> {
                name	=> "grade",
            },
            10	=> {
                name	=> "resistance",
            },
            11	=> {
                name	=> "time_from_course",
            },
            12	=> {
                name	=> "cycle_length",
            },
            13	=> {
                name	=> "temperature",
            },
        },
    },
    21	=> {
        name	=> "event",
        fields	=> {
            253	=> {
                name	=> "timestamp",
            },
            0	=> {
                name	=> "event",
            },
            1	=> {
                name	=> "event_type",
            },
            2	=> {
                name	=> "data16",
            },
            3	=> {
                name	=> "data",
                discriminant	=> 1,
                # Stuff....
            },
            4	=> {
                name	=> "event_group",
            },
        },
    },
    23	=> {
        name	=> "device_info",
        fields	=> {
            253	=> {
                name	=> "timestamp",
            },
            0	=> {
                name	=> "device_index",
            },
            1	=> {
                name	=> "device_type",
            },
            2	=> {
                name	=> "manufacturer",
            },
            3	=> {
                name	=> "serial_number",
            },
            4	=> {
                name	=> "product",
            },
            5	=> {
                name	=> "software_version",
            },
            6	=> {
                name	=> "hardware_version",
            },
            7	=> {
                name	=> "cum_operating_time",
            },
            10	=> {
                name	=> "battery_voltage",
            },
            11	=> {
                name	=> "battery_status",
            },
        },
    },
    31	=> {
        name	=> "course",
        fields	=> {
            4	=> {
                name	=> "sport",
            },
            5	=> {
                name	=> "name,",
            },
            6	=> {
                name	=> "capabilities",
            },
        },
    },
    32	=> {
        name	=> "course_point",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            1	=> {
                name	=> "timestamp",
            },
            2	=> {
                name	=> "position_lat",
            },
            3	=> {
                name	=> "position_long",
            },
            4	=> {
                name	=> "distance",
            },
            5	=> {
                name	=> "type",
            },
            6	=> {
                name	=> "name,",
            },
        },
    },
    26	=> {
        name	=> "workout",
        fields	=> {
            4	=> {
                name	=> "sport",
            },
            5	=> {
                name	=> "capabilities",
            },
            6	=> {
                name	=> "num_valid_steps",
            },
            8	=> {
                name	=> "wkt_name,",
            },
        },
    },
    27	=> {
        name	=> "workout_step",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            0	=> {
                name	=> "wkt_step_name,",
            },
            1	=> {
                name	=> "duration_type",
            },
            2	=> {
                name	=> "duration_value",
                discriminant	=> 1,
            },
            3	=> {
                name	=> "target_type",
            },
            4	=> {
                name	=> "target_value",
                discriminant	=> 3,
            },
            5	=> {
                name	=> "custom_target_value_low",
                # discriminant	=> ????
            },
            6	=> {
                name	=> "custom_target_value_high",
                # discriminant	=> ????
            },
            7	=> {
                name	=> "intensity",
            },
        },
    },
    33	=> {
        name	=> "totals",
        fields	=> {
            254	=> {
                name	=> "message_index",
            },
            253	=> {
                name	=> "timestamp",
            },
            0	=> {
                name	=> "timer_time",
            },
            1	=> {
                name	=> "distance",
            },
            2	=> {
                name	=> "calories",
            },
            3	=> {
                name	=> "sport",
            },
            4	=> {
                name	=> "elapsed_time",
            },
        },
    },
    30	=> {
        name	=> "weight_scale",
        fields	=> {
            253	=> {
                name	=> "timestamp",
            },
            0	=> {
                name	=> "weight",
            },
            1	=> {
                name	=> "percent_fat",
            },
            2	=> {
                name	=> "percent_hydration",
            },
            3	=> {
                name	=> "visceral_fat_mass",
            },
            4	=> {
                name	=> "bone_mass",
            },
            5	=> {
                name	=> "muscle_mass",
            },
            7	=> {
                name	=> "basal_met",
            },
            8	=> {
                name	=> "physique_rating",
            },
            9	=> {
                name	=> "active_met",
            },
            10	=> {
                name	=> "metabolic_age",
            },
            11	=> {
                name	=> "visceral_fat_rating",
            },
            12	=> {
                name	=> "user_profile_index",
            },
        },
    },
    51	=> {
        name	=> "blood_pressure",
        fields	=> {
            253	=> {
                name	=> "timestamp",
            },
            0	=> {
                name	=> "systolic_pressure",
            },
            1	=> {
                name	=> "diastolic_pressure",
            },
            2	=> {
                name	=> "mean_arterial_pressure",
            },
            3	=> {
                name	=> "map_3_sample_mean",
            },
            4	=> {
                name	=> "map_morning_values",
            },
            5	=> {
                name	=> "map_evening_values",
            },
            6	=> {
                name	=> "heart_rate",
            },
            7	=> {
                name	=> "heart_rate_type",
            },
            8	=> {
                name	=> "status",
            },
            9	=> {
                name	=> "user_profile_index",
            },
        }
       });

my %types = (
    0x00	=> {
        name	=> "enum",
        size	=> 1,
        decoder	=> ["C", "C"],
        invalid	=> 0xff,
        notice	=> 1,
    },
    0x01	=> {
        name	=> "sint8",
        size	=> 1,
        decoder	=> ["c", "c"],
        invalid	=> 0x7f,
        notice	=> 1,
    },
    0x02	=> {
        name	=> "uint8",
        size	=> 1,
        decoder	=> ["C", "C"],
        invalid	=> 0xff,
        notice	=> 1,
    },
    0x83	=> {
        name	=> "sint16",
        size	=> 2,
        decoder	=> ["v!", "n!"],
        invalid	=> 0x7fff,
        notice	=> 1,
    },
    0x84	=> {
        name	=> "uint16",
        size	=> 2,
        decoder	=> ["v", "n"],
        invalid	=> 0xffff,
        notice	=> 1,
    },
    0x85	=> {
        name	=> "sint32",
        size	=> 4,
        decoder	=> ["V!", "N!"],
        invalid	=> 0x7fffffff,
        notice	=> 1,
    },
    0x86	=> {
        name	=> "uint32",
        size	=> 4,
        decoder	=> ["V", "N"],
        invalid	=> 0xffffffff,
        notice	=> 1,
    },
    0x07	=> {
        name	=> "string",
        size	=> 0,
        decoder	=> ["Z", "Z"],
        invalid	=> "",
        notice	=> 1,
    },
    0x88	=> {
        name	=> "float32",
        size	=> 4,
        decoder	=> ["f<", "f>"],
        invalid	=> 0xffffffff,
        notice	=> 1,
    },
    0x89	=> {
        name	=> "float64",
        size	=> 4,
        decoder	=> ["d<", "d>"],
        invalid	=> 0xffffffffffffffff,
        notice	=> 1,
    },
    0x0A	=> {
        name	=> "uint8z",
        size	=> 1,
        decoder	=> ["C", "C"],
        invalid	=> 0x00,
        notice	=> 1,
    },
    0x8B	=> {
        name	=> "uint16z",
        size	=> 2,
        decoder	=> ["v", "n"],
        invalid	=> 0x0000,
        notice	=> 1,
    },
    0x8C	=> {
        name	=> "uint32z",
        size	=> 4,
        decoder	=> ["V", "N"],
        invalid	=> 0x00000000,
        notice	=> 1,
    },
    0x0D	=> {
        name	=> "byte",
        size	=> 0,
        decoder	=> ["a", "a"],
        invalid	=> 0xff,
        notice	=> 1,
    },
);

sub new {
    my ($class, %params) = @_;
    my $fit = bless {
    }, $class;
    croak "Unknown parameter ", join(", ", keys %params) if %params;
    $fit->reset;
    return $fit;
}

sub reset {
    my ($fit) = @_;
    $fit->{in_buffer} = "";
    $fit->{in_want} = 12;
    $fit->{in_need} = 12;
    $fit->{in_state} = "get_header";
    $fit->{in_types} = [];
}

sub get_header {
    my $fit = shift;
    my ($len, $protocol, $profile, $size, $type) = unpack("CCvVa4", shift);
    $len == 12 || croak "Invalid header length $len (expected 12)";
    $type eq ".FIT" || croak "Invalid file type (expected .FIT)";
    $fit->{protocol} = $protocol;
    $fit->{profile}  = $profile;
    # 2 more bytes for the CRC
    $fit->{in_want} = $size + 2;
    # Would like a record header
    $fit->{in_need} = 1;
    $fit->{in_state} = "get_record_header";
}

sub get_record_header {
    my $fit = shift;
    my $header = ord shift;
    if ($header & 0x80) {
        my $local_message_type = ($header >> 5) & 0x3;
        my $time_offset = $header & 0x1f;
        die "Abnormal header";
    } else {
        if ($header & 0x40) {
            $fit->{in_type} = $header & 0xf;
            $fit->{in_state} = "get_define_header";
            $fit->{in_need} = 5;
        } else {
            my $local_message_type = $header & 0xf;
            $fit->{in_type} = $fit->{in_types}[$local_message_type] ||
                croak "Local message type $local_message_type used but not defined";
            $fit->{in_state} = "get_data";
            $fit->{in_need}  = $fit->{in_type}{size};
        }
    }
}

sub get_define_header {
    my $fit = shift;
    my ($architecture, $num0, $num1, $nr_fields) = unpack("xCCCC", shift);
    my $num =
        $architecture == 0 ? $num0 + $num1 * 256 :
        $architecture == 1 ? $num1 + $num0 * 256 :
        croak "Invalid architecture $architecture";
    $fit->{in_type} = $fit->{in_types}[$fit->{in_type}] = {
        nr_fields	=> $nr_fields || croak("Definition of 0 fields"),
        big_endian	=> $architecture,
        global_nr	=> $num,
        global_type	=> $profile{$num},
    };
    $fit->{in_state} = "get_define_fields";
    $fit->{in_need} = 3*$nr_fields;
}

sub get_define_fields {
    my $fit = shift;
    my @definition = unpack("C*", shift);

    my $in_type = $fit->{in_type};
    my $meta = ref $in_type->{global_type} eq "HASH" ?
        $in_type->{global_type}{fields} : {};
    my $total_size = 0;
    my $decoder = "";
    $in_type->{fields} = \my @fields;
    while (my ($field_nr, $size, $base_type) = splice(@definition, 0, 3)) {
        my $type = $types{$base_type} || die "Unknown type $base_type";
        print STDERR "Type $base_type\n" if $type->{notice};
        if ($type->{size}) {
            $type->{size} == $size || die "Unexpected size $size for base_type $base_type ($type->{name})";
            $decoder .= $type->{decoder}[$in_type->{big_endian}];
        } else {
            $decoder .= $type->{decoder}[$in_type->{big_endian}];
            $decoder .= $size;
        }
        $total_size += $size;
        push @fields, {
            base_type	=> $base_type,
            type	=> $type,
            size	=> $size,
            field_nr	=> $field_nr,
            $meta->{$field_nr} ? (meta	=> $meta->{$field_nr}) : (),
        };
    }
    $in_type->{size} = $total_size;
    $in_type->{decoder} = $decoder;
    # print STDERR Dumper($in_type);

    if ($fit->{in_want} > 2) {
        $fit->{in_need} = 1;
        $fit->{in_state} = "get_record_header";
    } elsif ($fit->{in_want} == 2) {
        $fit->{in_need} = 1;
        $fit->{in_state} = "get_crc";
    } else {
        die "Unexpected EOF";
    }
}

sub get_data {
    my $fit = shift;
    my @fields = @{$fit->{in_type}{fields}};
    my @data = unpack($fit->{in_type}{decoder}, shift);
    my $global_name = $fit->{in_type}{global_type}{name};
    print STDERR "DATA:\n";
    for my $data (@data) {
        print STDERR "  '$data'	($global_name: $fields[0]{meta}{name} $fields[0]{type}{name} \[$fields[0]{field_nr}\])\n";
        $data = undef if $data eq $fields[0]{type}{invalid};
        $data = [$data, shift @fields];
    }
    # print STDERR Dumper(\@data);
    if ($fit->{in_want} > 2) {
        $fit->{in_need} = 1;
        $fit->{in_state} = "get_record_header";
    } elsif ($fit->{in_want} == 2) {
        $fit->{in_need} = 1;
        $fit->{in_state} = "get_crc";
    } else {
        die "Unexpected EOF";
    }
}

sub get_crc {
    my $fit = shift;
    $fit->{in_need} = 1e99;
    $fit->{in_state} = "done";
}

sub add_bytes {
    my $fit = shift;
    $fit->{in_buffer} .= shift;
    while (length $fit->{in_buffer} >= $fit->{in_need}) {
        my $method = $fit->{in_state} || croak "Assertion: No method";
        $fit->{in_want} -= $fit->{in_need};
        $fit->$method(substr($fit->{in_buffer}, 0, $fit->{in_need}, ""));
    }
    return $fit->{in_want} - length $fit->{in_buffer};
}

sub from_handle {
    my ($fit, $fh) = @_;
    my $buffer;
    my $want = $fit->add_bytes("");
    while ($want) {
        my $rc = read($fh, $buffer, $want);
        if ($rc) {
            $want = $fit->add_bytes($buffer);
        } elsif (defined $rc) {
            croak "Unexpected EOF";
        } else {
            croak "Read error: $!";
        }
    }
}

sub from_file {
    my ($fit, $file) = @_;
    defined $file || croak "undefined file";
    open(my $fh, "<", $file) || croak "Could not open '$file': $!";
    binmode $fh;
    eval { $fit->from_handle($fh) };
    die "File '$file': $@" if $@;
    close($fh) || croak "Error closing '$file': $!";
}

sub protocol {
    return shift->{protocol};
}

sub profile {
    return shift->{profile};
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Garmin::FIT::Streamer - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Garmin::FIT::Streamer;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Garmin::FIT::Streamer, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Ton Hospel, E<lt>ton@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Ton Hospel

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
