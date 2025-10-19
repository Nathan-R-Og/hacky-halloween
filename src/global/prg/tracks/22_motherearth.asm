mus_mother_earth_pulse2:
.addr B29_1B3B
@loop:
.addr motherearth_pulserrrr
.addr -1
.addr @loop

mus_mother_earth_pulse1:
.addr B29_1B92
@lopper:
.addr mus_mother_earth_pulse12
.addr -1
.addr @lopper

mus_mother_earth_triangle:
.addr B29_1C0D
@loop:
.addr motherearth_trilooper
.addr -1
.addr @loop

mus_mother_earth_noise:
.addr B29_1C3F
@mus_mother_earth_noise2:
.addr mus_mother_earth_looper
.addr -1
.addr @mus_mother_earth_noise2

B29_1B3B:
Set_Timbre 5, 7, timbre_c_square SQTD_50, 1, SQTV_ISVOL, 3
Note_Repeat 7
    Note_Length nl_whole
    Note_Rest
Note_End_Repeat

Note_Length nl_quarter
    Note_Rest
Note_B 4 ;4a
Note_C 5 ;50
Note_D 5 ;5a

Track_End

motherearth_pulserrrr:
Set_Timbre 5, 7, timbre_c_square SQTD_75, 1, SQTV_ISVOL, 4
Note_Length nl_quarter
Note_B 4 ;$4a
Note_Length nl_sixteenth
Note_D 5 ;$4a
Note_Rest
Note_D 5 ;$4a
Note_Rest
Note_Length nl_quarter
Note_B 4 ;$4a
Note_G 4 ;$4a

Note_GS 4 ;$4a
Note_C 5 ;$4a
Note_Length nl_half
Note_F 4 ;$4a

Note_Length nl_quarter
Note_DS 4 ;$4C
Note_E 4 ;$4C
Note_FS 4 ;$4C
Note_A 4 ;$

Note_Length nl_eighth
Note_G 5 ;50
Note_Rest
Note_G 5 ;50
Note_Rest
Note_Length nl_sixteenth
Note_GS 5 ;50
Note_Rest
Note_GS 5 ;50
Note_Rest
Note_G 5 ;50
Note_Rest
Note_Length nl_eighth
Note_Rest



Note_Length nl_quarter
Note_B 4 ;$4a
Note_Length nl_sixteenth
Note_D 5 ;$4a
Note_Rest
Note_D 5 ;$4a
Note_Rest
Note_Length nl_quarter
Note_B 4 ;$4a
Note_G 4 ;$4a

Note_GS 4 ;$4a
Note_C 5 ;$4a
Note_Length nl_half
Note_F 4 ;$4a

Note_Length nl_quarter
Note_DS 4 ;$4C
Note_E 4 ;$4C
Note_FS 4 ;$4C
Note_A 4 ;$

Note_Length nl_eighth
Note_G 5 ;50
Note_Rest
Note_G 5 ;50
Note_Rest
Note_Length nl_sixteenth
Note_GS 5 ;50
Note_Rest
Note_GS 5 ;50
Note_Rest
Note_AS 5 ;50
Note_Rest
Note_Length nl_eighth
Note_Rest


Track_End

B29_1B92:
Set_Timbre 5, $14, timbre_c_square SQTD_75, 1, SQTV_ISVOL, 1
Note_Length nl_quarter
Note_Rest
Note_B 5 ;$62
Note_Length nl_half
Note_D 6 ;$68
Note_Length nl_quarter
Note_Rest
Note_B 5 ;$62
Note_Length nl_half
Note_D 6 ;$68
Note_Length nl_quarter
Note_Rest
Note_B 5 ;$62
Note_Length nl_half
Note_D 6 ;$68
Note_Length nl_quarter
Note_Rest
Note_G 5 ;5a
Note_Length nl_half
Note_B 5 ;$62

Note_Length nl_quarter
Note_Rest
Note_B 5 ;$62
Note_Length nl_half
Note_D 6 ;$68

Set_NLT NLT18-Tempo_Lengths
Note_Length nl_quarter
Note_Rest
Note_G 5 ;$62
Note_Length nl_half
Note_B 5 ;$68

Set_NLT NLTC-Tempo_Lengths
Note_Length nl_quarter
Note_Rest
Note_E 5 ;$62
Note_Length nl_half
Note_A 5 ;$68

Note_Length nl_quarter
Note_Rest
Note_Length nl_eighth
Note_GS 5 ;5a
Note_F 5 ;5a
Note_Length nl_quarter
Note_GS 5 ;5a
Note_Length nl_quarter
Note_B 5 ;$62

Track_End

mus_mother_earth_pulse12:
Note_Repeat 8
    Note_Length nl_sixteenth
    Note_CS 5
    Note_Rest
    Note_Length nl_eighth
    Note_Rest
Note_End_Repeat

Note_Repeat 2
    Note_Length nl_sixteenth
    Note_B 4
    Note_Rest
    Note_Length nl_eighth
    Note_Rest
Note_End_Repeat

Note_Length nl_sixteenth
Note_C 5
Note_Rest
Note_C 5
Note_Rest

Note_B 4
Note_Rest
Note_Length nl_eighth
Note_Rest

Note_D 5
Note_Rest
Note_D 5
Note_Rest

Note_Length nl_sixteenth
Note_D 5
Note_Rest
Note_D 5
Note_Rest

Note_F 5
Note_Rest
Note_Length nl_eighth
Note_Rest

Note_Repeat 8
    Note_Length nl_sixteenth
    Note_CS 5
    Note_Rest
    Note_Length nl_eighth
    Note_Rest
Note_End_Repeat

Note_Repeat 2
    Note_Length nl_sixteenth
    Note_B 4
    Note_Rest
    Note_Length nl_eighth
    Note_Rest
Note_End_Repeat

Note_Length nl_sixteenth
Note_C 5
Note_Rest
Note_C 5
Note_Rest

Note_B 4
Note_Rest
Note_Length nl_eighth
Note_Rest

Note_D 5
Note_Rest
Note_D 5
Note_Rest

Note_Length nl_sixteenth
Note_D 5
Note_Rest
Note_D 5
Note_Rest

Note_GS 5
Note_Rest
Note_Length nl_eighth
Note_Rest

Track_End

B29_1C0D:
Set_Timbre 5, 0, timbre_c_triangle 0, 0
Note_Length nl_whole
Note_G 4+1 ;5a
Note_FS 4+1 ;58
Note_F 4+1 ;56
Note_E 4+1 ;54

Note_Length nl_whole
Note_G 4+1 ;5a
Set_NLT NLT18-Tempo_Lengths
Note_Length nl_whole
Note_F 4+1 ;58
Set_NLT NLTC-Tempo_Lengths
Note_Length nl_whole
Note_D 4+1 ;56
Note_F 4+1 ;54

Track_End

motherearth_trilooper:
Note_Length nl_quarter
Note_G 3+1 ;42
Note_FS 3+1 ;40
Note_Length nl_sixteenth
Note_E 3+1 ;3e
Note_Rest
Note_E 3+1 ;3e
Note_Rest
Note_Length nl_quarter
Note_D 3+1 ;3c

Note_G 3+1 ;42
Note_FS 3+1 ;40
Note_Length nl_eighth
Note_G 3+1 ;3e
Note_Rest
Note_G 3+1 ;3e
Note_Rest

Note_Length nl_whole
Note_F 3+1 ;42

Note_Length nl_half
Note_CS 3+1 ;42
Note_B 2+1 ;42

Track_End

B29_1C3F:
Note_Repeat 7

Note_Length nl_half
Note_Noise 0, 1
Note_Noise 0, 4
Note_End_Repeat

Note_Length nl_eighth
Note_Noise 0, 4
Note_Noise 0, 1
Note_Length nl_eighth
Note_Noise 0, 4
Note_Noise 0, 1

Note_Length nl_eighth
Note_Noise 1, 0
Note_Noise 1, 0
Note_Length nl_sixteenth
Note_Noise 1, 0
Note_Noise 1, 0
Note_Noise 1, 0
Note_Noise 1, 0

Track_End

mus_mother_earth_looper:
Note_Length nl_eighth
Note_Noise 2, 1
Note_Noise 0, 1
Note_Noise 1, 1
Note_Noise 0, 1

Track_End