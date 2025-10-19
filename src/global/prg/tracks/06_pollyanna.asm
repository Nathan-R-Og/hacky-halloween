mus_pollyanna_pulse1:
.addr mus_pollyanna_pulse1_timbre
B28_1BC3:
.addr mus_pollyanna_pulse_t2
.addr mus_pollyanna_pulse_t2
.addr mus_pollyanna_pulse_t3
.addr mus_pollyanna_pulse_t4
.addr -1
.addr B28_1BC3

mus_pollyanna_pulse2:
.addr mus_pollyanna_pulse2_timbre
.addr -1
.addr B28_1BC3

mus_pollyanna_triangle:
.addr mus_pollyanna_triangle_t1
.addr mus_pollyanna_triangle_t2
.addr mus_pollyanna_triangle_t3
.addr -1
.addr mus_pollyanna_triangle

mus_pollyanna_noise:
.addr mus_pollyanna_noise_t1
.addr mus_pollyanna_noise_t1
.addr mus_pollyanna_noise_t2
.addr mus_pollyanna_noise_t2
.addr mus_pollyanna_noise_t1
.addr mus_pollyanna_noise_t1
.addr mus_pollyanna_noise_t2
.addr mus_pollyanna_noise_t2
.addr mus_pollyanna_noise_t1
.addr mus_pollyanna_noise_t1
.addr mus_pollyanna_noise_t1
.addr mus_pollyanna_noise_t1
.addr mus_pollyanna_noise_t1
.addr mus_pollyanna_noise_t1
.addr mus_pollyanna_noise_t1
.addr mus_pollyanna_noise_t1
.addr mus_pollyanna_noise_t3
.addr -1
.addr mus_pollyanna_noise

mus_pollyanna_pulse1_timbre:
Set_Timbre 5, 2, timbre_c_square SQTD_50, 1, SQTV_ISVOL, 3
Track_End

mus_pollyanna_pulse_t2:
Note_Length nl_eighth


Note_C 5
Note_B 4
Note_A 4
Note_G 4
Note_A 4
Note_F 4
Note_E 4
Note_D 4

Note_C 5
Note_B 4
Note_A 4
Note_G 4
Note_A 4
Note_F 4
Note_E 4
Note_D 4


Note_Length nl_d_eighth
Note_C 4
Note_D 4
Note_E 4
Note_F 4
Note_C 4
Note_D 4
Note_Length nl_eighth
Note_E 4
Note_F 4
Note_E 4

Note_Length nl_d_eighth
Note_C 4
Note_D 4
Note_E 4
Note_F 4
Note_C 4
Note_D 4
Note_Length nl_eighth
Note_E 4
Note_F 4
Note_E 4


Track_End

mus_pollyanna_pulse2_timbre:
Set_Timbre 5, 9, timbre_c_square SQTD_50, 1, SQTV_ISVOL, 2
Note_Length nl_eighth
Note_Rest
Track_End

mus_pollyanna_pulse_t3:
Note_Length nl_eighth
Note_C 4
Note_E 4
Note_G 4
Note_Length nl_quarter
Note_F 4
Note_E 4
Note_Length nl_eighth
Note_D 4
Note_Length nl_quarter
Note_E 4
Note_Length nl_eighth
Note_D 4
Note_C 4
Note_Rest
Note_Length nl_quarter
Note_A 3
Note_Length nl_eighth
Note_C 4

Note_Length nl_d_quarter
Note_C 4
Note_Length nl_sixteenth
Note_D 4
Note_C 4
Note_Length nl_quarter
Note_B 3
Note_E 3
Note_Length nl_half
Note_B 3
Note_A 3

Note_Length nl_eighth
Note_D 4
Note_F 4
Note_D 4
Note_B 3
Note_Length nl_quarter
Note_C 4
Note_Length nl_eighth
Note_E 4
Note_F 4
Note_A 4
Note_G 4
Note_E 4
Note_A 3
Note_Length nl_quarter
Note_D 4
Note_B 3

Note_Length nl_d_quarter
Note_C 4
Note_Length nl_sixteenth
Note_E 4
Note_D 4
Note_Length nl_quarter
Note_C 4
Note_Length nl_eighth
Note_A 3
Note_B 3
Note_Length nl_quarter
Note_E 4
Note_D 4
Note_B 3
Note_C 4

Track_End


mus_pollyanna_pulse_t4:
Note_Length nl_quarter
Note_C 6
Note_Length nl_sixteenth
Note_Rest
Note_Length nl_quarter
Note_A 5
Note_Length nl_sixteenth
Note_Rest
Note_Length nl_quarter
Note_B 5
Note_Length nl_sixteenth
Note_Rest
Note_Length nl_quarter
Note_G 5
Note_Length nl_sixteenth
Note_Rest

Note_Length nl_quarter
Note_Rest
Note_Rest
Note_Rest


Track_End


mus_pollyanna_triangle_t1:
.byte $9F,$A0,$00
Note_Length nl_whole
Note_Rest
Note_Rest
Note_Rest

Note_Rest
Note_Rest
Note_Length nl_half
Note_Rest
Track_End

mus_pollyanna_triangle_t2:
Note_Length nl_quarter
Note_A 5+1
Note_G 5+1
Note_Length nl_half
Note_E 5+1
Note_C 5+1

Note_F 4+1
Note_Length nl_sixteenth
Note_G 4+1
Note_Length nl_d_eighth
Note_B 4+1

Note_Length nl_d_quarter
Note_F 4+1
Note_Length nl_eighth
Note_A 4+1
Note_C 5+1
Note_B 4+1
Note_Length nl_half

Note_F 4+1
Note_Length nl_sixteenth
Note_G 4+1
Note_Length nl_d_eighth
Note_B 4+1

Note_Length nl_d_quarter
Note_F 4+1
Note_Length nl_eighth
Note_A 4+1
Note_C 5+1
Note_B 4+1

Track_End

mus_pollyanna_triangle_t3:
Note_Length nl_d_quarter
Note_Rest
Note_Length nl_quarter
Note_F 4+1
Note_E 4+1
Note_C 4+1
Note_D 4+1
Note_C 4+1
Note_A 3+1
Note_Length nl_eighth
Note_Rest

Note_Length nl_half
Note_Rest
Note_Length nl_quarter
Note_B 3+1
Note_D 4+1
Note_E 4+1
Note_A 3+1
Note_G 3+1
Note_F 3+1

Note_Length nl_half
Note_Rest
Note_Length nl_quarter
Note_E 4+1
Note_Length nl_eighth
Note_G 4+1
Note_A 4+1
Note_C 5+1
Note_B 4+1
Note_C 5+1
Note_A 4+1
Note_Length nl_quarter
Note_F 4+1
Note_Length nl_eighth
Note_D 4+1
Note_E 4+1

Note_Length nl_d_quarter
Note_E 4+1
Note_Length nl_sixteenth
Note_G 4+1
Note_F 4+1
Note_Length nl_quarter
Note_E 4+1
Note_D 4+1
Note_G 4+1
Note_F 4+1
Note_G 4+1
Note_E 4+1

Note_Length nl_whole
Note_Rest
Note_Rest

Track_End

mus_pollyanna_noise_t1:
Note_Length nl_quarter
Note_Noise 1, 0 ;kick
Note_Noise 2, 0 ;snare
Note_Length nl_eighth
Note_Noise 1, 0
Note_Noise 2, 0
Note_Length nl_quarter
Note_Noise 0, 2
Track_End

mus_pollyanna_noise_t2:
Note_Length nl_d_eighth
Note_Noise 2, 0 ;snare
Note_Noise 1, 0 ;kick
Note_Noise 2, 0 ;snare
Note_Noise 1, 0 ;kick
Note_Noise 2, 0 ;snare
Note_Noise 1, 0 ;kick
Note_Length nl_eighth
Note_Noise 2, 0 ;snare
Note_Noise 1, 0 ;kick
Note_Noise 1, 0 ;kick
Track_End

mus_pollyanna_noise_t3:
Note_Length nl_d_quarter
Note_Noise 0, $13
Note_Noise 0, $13
Note_Noise 0, $13
Note_Noise 0, $13
Note_Length nl_half
Note_Noise 0, 1 ;rest
Track_End