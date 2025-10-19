mus_yucca_desert_pulse1:
.addr B28_1A74
.addr B28_1A74
.addr B28_1A74
.addr B28_1A742
.addr mus_yucca_desert_wait
.addr 0

mus_yucca_desert_pulse2:
.addr B28_1AE6
.addr B28_1AE6
.addr B28_1AE6
.addr B28_1AE6
.addr B28_1AE6
.addr B28_1AE6
.addr B28_1AE6
.addr B28_1AE6
.addr B28_1AE62
.addr B28_1AE62
.addr B28_1AE62
.addr B28_1AE62
.addr B28_1AE62
.addr B28_1AE62
.addr mus_yucca_desert_wait
.addr 0

mus_yucca_desert_triangle:
.addr B28_1B93
.addr 0

mus_yucca_desert_noise:
.addr B28_1BAC
.addr B28_1BAC
.addr B28_1BAC
.addr B28_1BAC
.addr B28_1BAC
.addr B28_1BAC
.addr B28_1BAC
.addr B28_1BAC
.addr B28_1BAC2
.addr 0

mus_yucca_desert_wait:
Note_Length nl_whole
Note_Rest
Note_Rest

B28_1A74:
Set_Timbre 5, 5+1, timbre_c_square SQTD_50, 1, SQTV_ISVOL, 10
Note_Length nl_whole
Note_E 3
Note_E 3
Note_Length nl_half
Note_A 3
Note_E 3
Note_FS 3
Note_GS 3
Track_End

B28_1A742:
Note_Length nl_whole
Note_E 3
Note_E 3
Note_Length nl_d_half
Note_A 3
Note_Length nl_d_quarter
Note_FS 3
Note_E 3
Note_Length nl_half
Note_E 3


Note_Length nl_whole
Note_E 3
Note_E 3
Note_E 3
Note_E 3
Note_E 3
Note_E 3
Note_Rest
Note_Rest

Track_End

B28_1AE6:
Set_Timbre 5, 5+1, timbre_c_square SQTD_25, 1, SQTV_ISVOL, 8
Note_Length nl_eighth
Note_A 3
Note_Repeat 3
Note_Rest
Note_Rest
Note_GS 3
Note_A 3
Note_End_Repeat
Note_Rest
Note_B 3
Note_Rest

Track_End

B28_1AE62:
Note_CS 3
Note_Rest
Note_CS 3
Note_Rest
Note_Rest
Note_Rest
Note_Rest
Note_B 2

Track_End

B28_1B93:
Set_Timbre 5, 0, timbre_c_triangle 0, 0
Note_Length nl_whole
Note_Rest
Note_Rest
Note_Rest
Note_Rest
Note_Rest
Note_Rest
Note_Rest
Note_Rest

Note_Length nl_sixteenth
Note_E 5+1
Note_CS 5+1
Note_B 4+1
Note_GS 4+1
Note_Length nl_quarter
Note_FS 4+1
Note_Length nl_eighth
Note_GS 4+1
Note_A 4+1
Note_Length nl_quarter
Note_CS 5+1
Note_Length nl_eighth
Note_B 4+1
Note_GS 4+1
Note_Length nl_quarter
Note_FS 4+1
Note_FS 4+1
Note_E 4+1

Note_Length nl_eighth
Note_FS 4+1
Note_A 4+1
Note_D 5+1
Note_CS 5+1
Note_Length nl_d_quarter
Note_B 4+1
Note_Length nl_eighth
Note_CS 5+1
Note_Length nl_quarter
Note_E 5+1
Note_CS 5+1
Note_A 4+1
Note_FS 4+1

Note_Length nl_sixteenth
Note_E 5+1
Note_CS 5+1
Note_B 4+1
Note_GS 4+1
Note_Length nl_quarter
Note_FS 4+1
Note_Length nl_eighth
Note_GS 4+1
Note_A 4+1
Note_Length nl_quarter
Note_CS 5+1
Note_Length nl_eighth
Note_B 4+1
Note_GS 4+1
Note_Length nl_quarter
Note_FS 4+1
Note_FS 4+1
Note_E 4+1

Note_Length nl_quarter
Note_E 5+1
Note_FS 4+1
Note_GS 4+1
Note_A 4+1
Note_Length nl_d_half
Note_GS 4+1
Note_Length nl_quarter
Note_FS 4+1

Note_Length nl_whole
Note_G 4+1
Note_G 4+1
Note_G 4+1
Note_G 4+1
Note_A 4+1
Note_Length nl_half
Note_A 2+1
Note_Length nl_eighth
Note_A 2+1
Note_Length nl_sixteenth
Note_GS 2+1
Note_FS 2+1
Note_DS 2+1
Note_C 2+1
Note_Rest
Note_Rest

Note_Length nl_whole
Note_A 2+1
Note_A 2+1

Track_End

B28_1BAC:
    Note_Length nl_quarter
    Note_Noise 1, 0 ;kick
    Note_Noise 1, 0 ;kick
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare
    Note_Noise 1, 0 ;kick
    Note_Noise 1, 0 ;kick
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare
    Track_End

B28_1BAC2:
    Note_Length nl_half
    Note_Noise 0, $19
    Note_Length nl_quarter
    Note_Noise 0, 1 ;rest
    Note_Length nl_half
    Note_Noise 0, $19
    Note_Length nl_quarter
    Note_Noise 0, 1 ;rest
    Note_Length nl_half
    Note_Noise 0, 1 ;rest

    Note_Noise 0, $19
    Note_Length nl_quarter
    Note_Noise 0, 1 ;rest
    Note_Length nl_half
    Note_Noise 0, $19
    Note_Length nl_quarter
    Note_Noise 0, 1 ;rest
    Note_Length nl_half
    Note_Noise 0, 1 ;rest


    Note_Noise 0, 1 ;rest
    Note_Noise 0, 1 ;rest
    Note_Noise 0, $19
    Note_Noise 0, 1 ;rest

    Note_Length nl_whole
    Note_Noise 0, 1 ;rest
    Note_Noise 0, 1 ;rest


    Track_End