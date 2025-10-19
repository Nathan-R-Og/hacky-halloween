;the only difference between jp and us stats is whether or not
;unused slots have blank names


;enemy graphics are divided between every 0x400 bytes.
;its exactly the same size as a tileset. uses the same system? probably
;therefore, some are shared. will be noted accordingly (with _A_)
;these numbers are just n = (ADDR - CHR_START) / 0x400
; (same as tilesets)
.enum ENEMY_GRAPHICS
    NKRSMNST = $20
    DEMON_A_STGHOST_HEART = $21
    ALLINGNOURE_A_FACE = $22
    EOTH_A_EGGER = $23
    EVILSANTA_A_HFCROW = $24
    SPIREAL_A_TOTKID = $25
    ZAMBIE = $26
    SCAREDYCROW = $27
    CRUMBL = $28
    WRAITH = $29
    HORROR = $2a
.endenum

.enum ENEMY_FLAGS
    NONE = 0
    SPRAYS = 1 << 0
    R_PK_BEAM = 1 << 1
    R_DEFDOWN_CONFSLEEP = 1 << 2
    UNK = 1 << 3
    R_PK_THUNDER = 1 << 4
    R_PK_FREEZE = 1 << 5
    R_PK_FIRE = 1 << 6
    GOD = 1 << 7
.endenum

;https://datacrystal.tcrf.net/wiki/EarthBound_Beginnings/Enemy_data
;enemy health can range from 0-$3ff (inclusive)
;ggggsshhhhhhhhhh
.define ething1(health, subpal, gtile) .word (gtile<<12) | (subpal<<10) | health
;enemy pp can range from 0-$3ff (inclusive)
;ggggggpppppppppp
.define ething2(pp, gfx) .word (gfx<<10) | pp
;enemy offense can range from 0-$3ff (inclusive)
;aaafffoooooooooo
.define ething3(offense, finalAction, altitude) .word (altitude<<13) | (finalAction<<10) | offense
;enemy defense can range from 0-$3ff (inclusive)
;uuummmdddddddddd
.define ething4(defense, messageDefeat, unkParam) .word (unkParam<<13) | (messageDefeat<<10) | defense

STATS_START:
STATS_UNKENEMY0:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 300, 0, 0
    ;pp, gfx
    ething2 300, 0
    ;offense, finalAction, altitude
    ething3 300, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 300, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 100, 100, 100, 100, 100
    ;battle actions
    .byte $00,$00,$00,$00,$00,$00,$00,$00
    ;name pointer
    .addr ENAME_NULL
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte 0

STATS_NKRSMONST:
    .byte $00
    ;init status
    .byte $00
    ;flags
    .byte ENEMY_FLAGS::GOD
    ;health, palindex, tilemap
    ething1 600, 0, 0
    ;pp, spr_gfx
    ething2 150, 0
    ;offense, finalAction, altitude
    ething3 200, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 250, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 150, 50, 50, 200, 100
    ;battle actions
    .byte $28,$78+1,5,3,1,2,2,$1b
    ;name pointer
    .addr ENAME_NATHANSTEINSMONSTER
    ;exp
    .word 500
    ;money
    .word 500
    ;item
    .byte 0
    ;graphic page
    .byte ENEMY_GRAPHICS::NKRSMNST

STATS_DEMON:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, palindex, tilemap
    ething1 100, 0, 1
    ;pp, spr_gfx
    ething2 50, 0
    ;offense, finalAction, altitude
    ething3 50, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 100, 5, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 100, 50, 100, 50
    ;battle actions
    .byte $4e+1,$4e+1,$4e+1,$4e+1,$5c+1,$5c+1,1,1
    ;name pointer
    .addr ENAME_DEMON
    ;exp
    .word 50
    ;money
    .word 50
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::DEMON_A_STGHOST_HEART

STATS_STINKYGHOST:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, palindex, tilemap
    ething1 300, 2, 9
    ;pp, spr_gfx
    ething2 50, 0
    ;offense, finalAction, altitude
    ething3 110, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 150, 7, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 50, 50, 50, 100
    ;battle actions
    .byte $35+1,$3e+1,1,$48+1,1,$48+1,$1d,$c
    ;name pointer
    .addr ENAME_STINKYGHOST
    ;exp
    .word 150
    ;money
    .word 150
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::DEMON_A_STGHOST_HEART

STATS_HEART:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, palindex, tilemap
    ething1 150, 0, 5
    ;pp, spr_gfx
    ething2 100, 0
    ;offense, finalAction, altitude
    ething3 100, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 200, 4, 0
    ;fight, speed, wisdom, strength, force
    .byte 100, 10, 100, 30, 50
    ;battle actions
    .byte 9,$1f,$2a,$41+1,$53+1,$65+1,$81+1,$d+1
    ;name pointer
    .addr ENAME_HEART
    ;exp
    .word 50
    ;money
    .word 50
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::DEMON_A_STGHOST_HEART

STATS_ALLINGNOURE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, palindex, tilemap
    ething1 200, 0, 6
    ;pp, spr_gfx
    ething2 50, 0
    ;offense, finalAction, altitude
    ething3 150, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 200, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 150, 150, 50, 150, 50
    ;battle actions
    .byte $5b+1,$5b+1,$4b+1,$4b+1,$38+1,$26+1,$d+1,$d+1
    ;name pointer
    .addr ENAME_ALLINGNOURE
    ;exp
    .word 100
    ;money
    .word 100
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ALLINGNOURE_A_FACE

STATS_FACE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::GOD
    ;health, palindex, tilemap
    ething1 999, 1, 8
    ;pp, spr_gfx
    ething2 500, 0
    ;offense, finalAction, altitude
    ething3 150, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 250, 7, 0
    ;fight, speed, wisdom, strength, force
    .byte 100, 100, 100, 100, 100
    ;battle actions
    .byte $28,$2a,1,$37+1,1,$41+1,$58+1,2
    ;name pointer
    .addr ENAME_FACE
    ;exp
    .word 800
    ;money
    .word 800
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ALLINGNOURE_A_FACE

STATS_EOTH:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::GOD
    ;health, palindex, tilemap
    ething1 500, 0, 3
    ;pp, spr_gfx
    ething2 100, 0
    ;offense, finalAction, altitude
    ething3 175, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 200, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 150, 150, 100, 150, 175
    ;battle actions
    .byte 3,$1b,$22,$31,$1,$1,$4b+1,$6c+1
    ;name pointer
    .addr ENAME_EYEOFTHEHOLDER
    ;exp
    .word 150
    ;money
    .word 500
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::EOTH_A_EGGER

STATS_EGGER:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, palindex, tilemap
    ething1 120, 1, 5
    ;pp, spr_gfx
    ething2 50, 0
    ;offense, finalAction, altitude
    ething3 40, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 120, 5, 0
    ;fight, speed, wisdom, strength, force
    .byte 100, 30, 100, 20, 70
    ;battle actions
    .byte $41+1,$45+1,$45+1,$5c+1,$5c+1,$29,1,1
    ;name pointer
    .addr ENAME_EGGER
    ;exp
    .word 50
    ;money
    .word 50
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::EOTH_A_EGGER

STATS_EVIL_SANTA:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::GOD
    ;health, palindex, tilemap
    ething1 500, 0, 3
    ;pp, spr_gfx
    ething2 60, 0
    ;offense, finalAction, altitude
    ething3 150, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 400, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 100, 150, 160, 150, 150
    ;battle actions
    .byte 1,$e,$1b,$4b+1,$6a+1,$6c+1,$81+1,$4a+1
    ;name pointer
    .addr ENAME_EVIL_SANTA
    ;exp
    .word 500
    ;money
    .word 1000
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::EVILSANTA_A_HFCROW

STATS_HATEFUL_CROW:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, palindex, tilemap
    ething1 120, 1, 4
    ;pp, spr_gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 125, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 200, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 75, 150, 50, 100, 150
    ;battle actions
    .byte 4,$22,$23,$4b+1,$4e+1,$52+1,$58+1,$4a+1
    ;name pointer
    .addr ENAME_HATEFULCROW
    ;exp
    .word 50
    ;money
    .word 50
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::EVILSANTA_A_HFCROW

STATS_SPIREAL:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, palindex, tilemap
    ething1 100, 2, 3
    ;pp, spr_gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 100, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 250, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 100, 20, 100, 150
    ;battle actions
    .byte 0,1,1,2,$45+1,$6b+1,$6a+1,$75+1
    ;name pointer
    .addr ENAME_SPIRE_AL
    ;exp
    .word 100
    ;money
    .word 100
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::SPIREAL_A_TOTKID

STATS_TOTKID:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, palindex, tilemap
    ething1 200, 0, 4
    ;pp, spr_gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 150, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 250, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 100, 100, 25, 150, 100
    ;battle actions
    .byte 1,$3b+1,$4e+1,$4b+1,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_TRICKORTRICKKID
    ;exp
    .word 90
    ;money
    .word 90
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::SPIREAL_A_TOTKID

STATS_ZAMBIE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, palindex, tilemap
    ething1 250, 1, 2
    ;pp, spr_gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 100, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 225, 4, 0
    ;fight, speed, wisdom, strength, force
    .byte 100, 100, 25, 150, 100
    ;battle actions
    .byte 3,1,1,$53+1,$4b+1,1,3,1
    ;name pointer
    .addr ENAME_ZAMBIE
    ;exp
    .word 200
    ;money
    .word 100
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ZAMBIE

STATS_SCAREDYCROW:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, palindex, tilemap
    ething1 350, 2, 2
    ;pp, spr_gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 110, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 150, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 100, 100, 50, 150
    ;battle actions
    .byte $47+1,$45+1,$52+1,$50+1,$45+1,$1,$1,$45+1
    ;name pointer
    .addr ENAME_SCAREDYCROW
    ;exp
    .word 150
    ;money
    .word 150
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::SCAREDYCROW

STATS_CRUMBL:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, palindex, tilemap
    ething1 300, 2, 7
    ;pp, spr_gfx
    ething2 100, 0
    ;offense, finalAction, altitude
    ething3 200, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 100, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 100, 50, 100, 50, 100
    ;battle actions
    .byte $43+1,$33+1,$25,$17,$d,1,1,0
    ;name pointer
    .addr ENAME_CRUMBL
    ;exp
    .word 150
    ;money
    .word 200
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::CRUMBL

STATS_WRAITH:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, palindex, tilemap
    ething1 250, 0, 7
    ;pp, spr_gfx
    ething2 25, 0
    ;offense, finalAction, altitude
    ething3 150, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 200, 7, 0
    ;fight, speed, wisdom, strength, force
    .byte 75, 50, 50, 25, 150
    ;battle actions
    .byte 9,$a,$13,$12,$30,$30,$52+1,$52+1
    ;name pointer
    .addr ENAME_WRAITH
    ;exp
    .word 100
    ;money
    .word 100
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::WRAITH

STATS_HORROR:
    .byte $00
    ;init status
    .byte $00
    ;flags
    .byte ENEMY_FLAGS::UNK
    ;health, palindex, tilemap
    ething1 50, 1, $a
    ;pp, spr_gfx
    ething2 0, 1
    ;offense, finalAction, altitude
    ething3 20, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 90, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 200, 180, 180, 255, 180
    ;attacks
    .byte 8,8,8,8,8,8,8,8
    ;name pointer
    .addr ENAME_HORROR
    ;exp
    .word 42
    ;money
    .word 28
    ;item drop
    .byte 0
    ;graphic
    .byte ENEMY_GRAPHICS::HORROR

; .repeat 104
;     .byte $00
;     ;init status
;     .byte $00
;     ;flags
;     .byte ENEMY_FLAGS::UNK
;     ;health, subpal, gtile
;     ething1 50, 1, 4
;     ;pp, gfx
;     ething2 0, 0
;     ;offense, finalAction, altitude
;     ething3 20, 0, 0
;     ;defense, messageDefeat, unkParam
;     ething4 90, 2, 0
;     ;fight, speed, wisdom, strength, force
;     .byte 20, 18, 18, 40, 18
;     ;attacks
;     .byte $01,$5D,$01,$01,$01,$01,$01,$01
;     ;name pointer
;     .addr ENAME_HORROR
;     ;exp
;     .word 42
;     ;money
;     .word 28
;     ;item drop
;     .byte 0
;     ;gfx
;     .byte ENEMY_GRAPHICS::HORROR
; .endrepeat
