mus_epiloguejp_pulse1_start:
.addr mus_epiloguejp_2mwait_pitch
.addr mus_epiloguejp_pulse1_phrase01
.addr mus_epiloguejp_pulse1_phrase01
mus_epiloguejp_pulse1_loop:
.addr mus_epiloguejp_pulse1_phrase01
.addr mus_epiloguejp_pulse1_phrase01
.addr mus_epiloguejp_pulse1_phrase01
.addr mus_epiloguejp_pulse1_phrase01
.addr mus_epiloguejp_pulse1_phrase02
.addr mus_epiloguejp_pulse1_phrase02
.addr mus_epiloguejp_pulse1_phrase04
.addr mus_epiloguejp_pulse1_phrase01
.addr mus_epiloguejp_pulse1_phrase05
.addr -1
.addr mus_epiloguejp_pulse1_loop

mus_epiloguejp_pulse2_start:
.addr mus_epiloguejp_pulse2_phrase01
.addr mus_epiloguejp_pulse2_phrase01
.addr mus_epiloguejp_pulse2_phrase01
mus_epiloguejp_pulse2_loop:
.addr mus_epiloguejp_pulse2_phrase01
.addr mus_epiloguejp_pulse2_phrase01
.addr mus_epiloguejp_pulse2_phrase01
.addr mus_epiloguejp_pulse2_phrase01
.addr mus_epiloguejp_pulse2_phrase01
.addr mus_epiloguejp_pulse2_phrase01
.addr mus_epiloguejp_pulse2_phrase01
.addr mus_epiloguejp_pulse2_phrase01
.addr mus_epiloguejp_pulse2_rest
.addr mus_epiloguejp_pulse2_phrase01
.addr mus_epiloguejp_pulse2_phrase01
.addr -1
.addr mus_epiloguejp_pulse2_loop

mus_epiloguejp_triangle_start:
.addr mus_epiloguejp_2mwait_pitch
.addr mus_epiloguejp_2mwait_pitch
.addr mus_epiloguejp_2mwait_pitch
mus_epiloguejp_triangle_loop:
.addr mus_epiloguejp_triangle_phrase01
.addr mus_epiloguejp_triangle_phrase02
.addr mus_epiloguejp_triangle_phrase01
.addr mus_epiloguejp_triangle_phrase03
.addr mus_epiloguejp_triangle_phrase04
.addr mus_epiloguejp_2mwait_pitch
.addr mus_epiloguejp_2mwait_pitch
.addr -1
.addr mus_epiloguejp_triangle_loop

mus_epiloguejp_noise_start:
.addr mus_epiloguejp_2mwait_noise
.addr mus_epiloguejp_2mwait_noise
.addr mus_epiloguejp_2mwait_noise
mus_epiloguejp_noise_loop:
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase02
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase01
.addr -1
.addr mus_epiloguejp_noise_loop

mus_epiloguejp_2mwait_pitch:
    Note_Length nl_whole
    Note_Rest
    Note_Rest
    Note_Rest
    Note_Rest
    Track_End

mus_epiloguejp_2mwait_noise:
    Note_Length nl_whole
    Note_Noise 0, 1; rest
    Note_Noise 0, 1; rest
    Note_Noise 0, 1; rest
    Note_Noise 0, 1; rest
    Track_End


mus_epiloguejp_pulse1_phrase01:
    Set_Timbre 5, 0, timbre_c_square SQTD_12_5, 1, SQTV_ISVOL, $a
    Note_Length nl_whole
    Note_E 2
    Note_E 2
    Note_A 2
    Note_A 2

    Track_End

mus_epiloguejp_pulse1_phrase02:
    Note_Length nl_whole
    Note_E 2
    Note_E 2
    Note_Length nl_d_half
    Note_A 2
    Note_Length nl_d_quarter
    Note_FS 2
    Note_Length nl_this_thing
    Note_E 2

    Track_End

mus_epiloguejp_pulse1_phrase04:
    Note_Repeat 4
        Note_Length nl_whole
        Note_E 2
        Note_GS 2
    Note_End_Repeat
    ;fallthrough
mus_epiloguejp_pulse2_rest:
    Note_Length nl_whole
    Note_Rest
    Note_Rest

    Track_End

mus_epiloguejp_pulse1_phrase05:
    Note_E 3
    Note_Length nl_half
    Note_CS 3
    Note_DS 3

    Note_B 2
    Note_E 2
    Note_Length nl_d_quarter
    Note_FS 2
    Note_Length nl_eighth
    Note_DS 2
    Note_Length nl_half
    Note_E 2

    Track_End

mus_epiloguejp_pulse2_phrase01:
Note_Repeat 8
    Set_Timbre 5, 0, timbre_c_square SQTD_50, 1, SQTV_ISVOL, 2
    Note_Length nl_eighth
    Note_A 6
    Set_Timbre 5, 0, timbre_c_square SQTD_50, 1, SQTV_ISVOL, 1
    Note_A 6
    Set_Timbre 5, 0, timbre_c_square SQTD_50, 1, SQTV_ISVOL, 0
    Note_A 6
    Note_Rest
Note_End_Repeat

    Track_End

mus_epiloguejp_triangle_phrase01:
    Set_Timbre 5, 0, timbre_c_triangle 0, 0
    Note_Length nl_quarter
    Note_E 5+1
    Note_CS 5+1
    Note_B 4+1
    Note_GS 4+1
    Note_B 4+1
    Note_GS 4+1
    Note_FS 4+1
    Note_E 4+1

    Note_E 5+1
    Note_CS 5+1
    Note_B 4+1
    Note_GS 4+1
    Note_B 4+1
    Note_E 5+1
    Note_FS 4+1
    Note_E 4+1

    Track_End

mus_epiloguejp_triangle_phrase02:
    Note_E 5+1
    Note_CS 5+1
    Note_B 4+1
    Note_GS 4+1
    Note_B 4+1
    Note_GS 4+1
    Note_FS 4+1
    Note_E 4+1

    Note_E 5+1
    Note_CS 5+1
    Note_B 4+1
    Note_E 4+1
    Note_GS 4+1
    Note_A 4+1
    Note_FS 4+1
    Note_E 4+1

    Track_End

mus_epiloguejp_triangle_phrase03:
    Note_E 5+1
    Note_CS 5+1
    Note_B 4+1
    Note_GS 4+1
    Note_B 4+1
    Note_GS 4+1
    Note_FS 4+1
    Note_E 4+1

    Note_E 5+1
    Note_FS 4+1
    Note_GS 4+1
    Note_A 4+1
    Note_GS 4+1
    Note_DS 4+1
    Note_E 4+1
    Note_Length nl_eighth
    Note_Rest
    Note_E 4+1

    Track_End

mus_epiloguejp_triangle_phrase04:
    Note_GS 4+1
    Note_Rest
    Note_Rest
    Note_GS 4+1
    Note_GS 4+1
    Note_A 4+1
    Note_GS 4+1
    Note_Length nl_this_thing
    Note_B 4+1
    Note_Length nl_quarter
    Note_E 4+1

    Note_Length nl_thus_thing
    Note_GS 4+1
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_eighth
    Note_E 4+1

    Note_GS 4+1
    Note_Rest
    Note_Rest
    Note_GS 4+1
    Note_GS 4+1
    Note_B 4+1
    Note_GS 4+1
    Note_Length nl_thes_thing
    Note_E 5+1
    Note_Length nl_d_quarter
    Note_A 4+1
    Note_Length nl_eighth
    Note_E 4+1

    Note_Length nl_thus_thing
    Note_GS 4+1
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_eighth
    Note_E 4+1


    Note_FS 4+1
    Note_Rest
    Note_Rest
    Note_FS 4+1
    Note_FS 4+1
    Note_GS 4+1
    Note_A 4+1
    Note_E 4+1
    Note_Rest
    Note_Length nl_d_half
    Note_Rest
    Note_Length nl_eighth
    Note_E 4+1

    Note_FS 4+1
    Note_Rest
    Note_Rest
    Note_FS 4+1
    Note_CS 5+1
    Note_B 4+1
    Note_GS 4+1
    Note_FS 4+1
    Note_Length nl_half
    Note_GS 4+1
    Note_A 4+1

    Note_Length nl_eighth
    Note_E 4+1
    Note_FS 4+1
    Note_FS 4+1
    Note_Length nl_d_quarter
    Note_GS 4+1
    Note_Length nl_eighth
    Note_E 4+1
    Note_E 4+1
    Note_Length nl_whole
    Note_Rest

    Note_Length nl_eighth
    Note_E 4+1
    Note_FS 4+1
    Note_FS 4+1
    Note_E 4+1
    Note_Length nl_d_quarter
    Note_GS 4+1
    Note_Length nl_eighth
    Note_A 4+1
    Note_Length nl_quarter
    Note_FS 4+1
    Note_Length nl_d_half
    Note_Rest

    ;For Me.
    Note_Length nl_half
    Note_E 4+1
    Note_DS 4+1
    Note_Length nl_whole
    Note_E 4+1

    Track_End

mus_epiloguejp_noise_phrase01:
    Note_Length nl_half
    Note_Noise 2, 0 ;snare
    Note_Noise 0, 2 ;hat
    Note_Length nl_eighth
    Note_Noise 2, 0 ;snare
    Note_Noise 0, 1 ;rest
    Note_Noise 0, 1 ;rest
    Note_Noise 2, 0 ;snare
    Note_Length nl_half
    Note_Noise 0, 2 ;hat

    Track_End

mus_epiloguejp_noise_phrase02:
    Note_Length nl_whole
    Note_Noise 0, 1 ;rest
    Note_Length nl_half
    Note_Noise 0, 1 ;rest
    Note_Length nl_quarter
    Note_Noise 0, 2 ;hat
    Note_Length nl_eighth
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare

    Track_End

