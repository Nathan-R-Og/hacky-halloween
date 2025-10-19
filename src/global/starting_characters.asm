;initial character data
;us blanks out initial names but adds 4 new args
;jp has temp names but blanks out those args

;i added 100 to each maxhp/maxpp because i thought
;that would make things more interesting
;all of the others stats are base lvl 30 based on
;the new level curve
party_data:

;ninten
Ninten_Data:
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 265,210,76,78
;fight, speed, wisdom, strength, force
.byte 76,78,81,72,75
;level
.byte 30
;exp
.faraddr 22000 ;far addrs are meant for segments but also i want a 3 byte keyword :)
;hp, pp
.word 265,210
;name pointer (why exactly?)
.addr Ninten_Data+party_info::name
;?
.byte $00,$00
;object type if lead?
.byte OBJ_TYPE::PLAYER
;object_m_bitfield1 | object_m_oam
.byte (OBJECT_M_BF1_INTERACTABLE | OBJECT_M_BF1_CHANGEDIR) | 4
;sprite
.addr SPRITEDEF_0
;items
.byte 19,47,50,51,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte 0,0,0,0

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif

;psi table
.byte %01000000, %11000000
.byte %11110110, %00000000
.byte %11111111, %00000000
.byte %00000000, %00000000

;default name
.ifdef VER_JP
;Boy A
kanafix "しょうねんA",0,stopText
.else
.byte "Ninten",0,stopText
.endif

;ana
Ana_Data:
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 206,272,18,42
;fight, speed, wisdom, strength, force
.byte 18,42,110,44,121
;level
.byte 30
;exp
.faraddr 22000
;hp, pp
.word 206,272
;name pointer (why exactly?)
.addr Ana_Data+party_info::name
;?
.byte $00,$00
;object type if lead?
.byte OBJ_TYPE::PLAYER
;object_m_bitfield1 | object_m_oam
.byte (OBJECT_M_BF1_INTERACTABLE | OBJECT_M_BF1_CHANGEDIR) | 4
;sprite
.addr SPRITEDEF_8
;items
.byte 22,47,50,52,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte 0,0,0,0

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif
;psi table
.byte %01000000, %01110000
.byte %11111111, %11111111
.byte %00000000, %11111100
.byte %11101110, %00000000

;default name
.ifdef VER_JP
;Girl B
kanafix "しょうじょB",0,stopText
.else
.byte "Ana",0,0,0,0,stopText
.endif

;lloyd
Lloyd_Data:
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 271,0,55,34
;fight, speed, wisdom, strength, force
.byte 55,34,126,74,49
;level
.byte 30
;exp
.faraddr 22000
;hp, pp
.word 271,0
;name pointer (why exactly?)
.addr Lloyd_Data+party_info::name
;?
.byte $00,$00
;object type if lead?
.byte OBJ_TYPE::PLAYER
;object_m_bitfield1 | object_m_oam
.byte (OBJECT_M_BF1_INTERACTABLE | OBJECT_M_BF1_CHANGEDIR) | 4
;sprite
.addr SPRITEDEF_10
;items
.byte 15,47,50,53,34,$00,$00,$00
;weapon, coin, ring, pendant
.byte 0,0,0,0

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif

;psi table
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000

;default name
.ifdef VER_JP
;Boy C
kanafix "しょうねんC",0,stopText
.else
.byte "Lloyd",0,0,stopText
.endif

;teddy
Teddy_Data:
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 292,0,140,100
;off def actually 170 168 but thats a little too high i think
;fight, speed, wisdom, strength, force
.byte 92,90,27,88,68
;level
.byte 30
;exp
.faraddr 22000
;hp, pp
.word 292,0
;name pointer (why exactly?)
.addr Teddy_Data+party_info::name
;?
.byte $00,$00
;object type if lead?
.byte OBJ_TYPE::PLAYER
;object_m_bitfield1 | object_m_oam
.byte (OBJECT_M_BF1_INTERACTABLE | OBJECT_M_BF1_CHANGEDIR) | 4
;sprite
.addr SPRITEDEF_18
;items
.byte 13,47,50,54,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte 0,0,0,0

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif

;psi table
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000

;default name
.ifdef VER_JP
;Boy D
kanafix "しょうねんD",0,stopText
.else
.byte "Teddy",0,0,stopText
.endif

;pippi
Pippi_Data:
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 32,0,9,9
;fight, speed, wisdom, strength, force
.byte 9,9,2,6,4
;level
.byte 1
;exp
.faraddr 0
;hp, pp
.word 32,0
;name pointer (why exactly?)
.addr Pippi_Data+party_info::name
;?
.byte $00,$00
;object type if lead?
.byte OBJ_TYPE::PLAYER
;object_m_bitfield1 | object_m_oam
.byte (OBJECT_M_BF1_INTERACTABLE | OBJECT_M_BF1_CHANGEDIR) | 4
;sprite
.addr SPRITEDEF_20
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif

;psi table
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000

;default name
.ifdef VER_JP
;Pippi
kanafix "ピッピ",0,0,0,0,stopText
.else
.byte "Pippi",0,0,stopText
.endif

;eve
EVE_Data:
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 999,0,999,999
;fight, speed, wisdom, strength, force
.byte 255,255,255,255,255
;level
.byte 99
;exp
.faraddr 1000000
;hp, pp
.word 999,0
;name pointer (why exactly?)
.addr EVE_Data+party_info::name
;?
.byte $00,$00
;object type if lead?
.byte OBJ_TYPE::PLAYER
;object_m_bitfield1 | object_m_oam
.byte (OBJECT_M_BF1_CHANGEDIR | OBJECT_M_BF1_HIGHPRIORITY) | 10
;sprite
.addr SPRITEDEF_58
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif

;psi table
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000

;default name
.ifdef VER_JP
;EVE
kanafix "イヴ",0,0,0,0,0,stopText
.else
.byte "EVE",0,0,0,0,stopText
.endif

;flying man
FlyingMan_Data:
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 50,0,30,30
;fight, speed, wisdom, strength, force
.byte 30,30,30,30,30
;level
.byte 99
;exp
.faraddr 1000000
;hp, pp
.word 30,0
;name pointer (why exactly?)
.addr FlyingMan_Data+party_info::name
;?
.byte $00,$00
;object type if lead?
.byte OBJ_TYPE::PLAYER
;object_m_bitfield1 | object_m_oam
.byte (OBJECT_M_BF1_INTERACTABLE | OBJECT_M_BF1_CHANGEDIR) | 4
;sprite
.addr SPRITEDEF_50
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif

;psi table
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000

;default name
.ifdef VER_JP
;Flying Man
kanafix "フライングマン",stopText
.else
.byte "FlynMan",stopText
.endif
