;only changes here is that in jp, there are unused choicers
;4 options all of which say "POISON"
;very ominous


;not JUST teleport defs, by the way!
;name, (posX << 6)| music, (posY << 6)| startDirection, msgPrice
.macro choicerDef name, music, posX, direction, posY, msgPrice
    .addr name
    .word (posX << 6) | music
    .word (posY << 6) | direction
    .word msgPrice
.endmacro

;ACTUAL heroes.
choicerDef CHOICER_NUM2,0,0,0,0,0 ;2
choicerDef CHOICER_NUM4,0,0,0,0,0 ;4
choicerDef CHOICER_NUM6,0,0,0,0,0 ;6
choicerDef CHOICER_NUM8,0,0,0,0,0 ;8
choicerDef CHOICER_NUM3,0,0,0,0,0 ;3
choicerDef CHOICER_NUM5,0,0,0,0,0 ;5
choicerDef CHOICER_NUM12,0,0,0,0,0 ;12
choicerDef CHOICER_NUMPI,0,0,0,0,0 ;3.14
choicerDef CHOICER_NUM13,0,0,0,0,0 ;13
choicerDef CHOICER_SCIENTIST2,0,0,0,0,0 ;Idk
choicerDef CHOICER_SCIENTIST1,0,0,0,0,0 ;Yes
choicerDef CHOICER_HINTS3,0,0,0,0,0 ;No

.repeat 4
choicerDef INAME_NULL,0,0,0,0,0
.endrepeat

;trainstuff
;union station
choicerDef CHOICER_NUM13,$14,$13E,5,$14F,16
choicerDef CHOICER_NUM13,$14,$13E,5,$14F,25
choicerDef CHOICER_NUM13,$14,$13E,5,$14F,36
;reindeer station
choicerDef CHOICER_NUM13,$14,$205,6,$33F,16
;spookane station
choicerDef CHOICER_NUM13,$14,$2AD,6,$33F,25
;snowman station
choicerDef CHOICER_NUM13,$14,$35B,6,$3DF,36
;reindeer station 2
choicerDef CHOICER_NUM13,$14,$206,2,$33F,9
choicerDef CHOICER_NUM13,$14,$206,2,$33F,20
;spookane station 2
choicerDef CHOICER_NUM13,$14,$2AD,6,$33F,9
choicerDef CHOICER_NUM13,$14,$2AE,2,$33F,11
;snowman station 2
choicerDef CHOICER_NUM13,$14,$35B,6,$3DF,20
choicerDef CHOICER_NUM13,$14,$35B,6,$3DF,11

;flight plan choicers
choicerDef CHOICER_FLIGHTPLANSA,0,0,0,0,5
choicerDef CHOICER_FLIGHTPLANSB,0,0,0,0,10
choicerDef CHOICER_FLIGHTPLANSC,0,0,0,0,15
choicerDef CHOICER_FLIGHTPLANSC,0,0,0,0,15

;hint choicers
choicerDef CHOICER_HINTS2,0,0,0,0,0
choicerDef CHOICER_HINTS3,0,0,0,0,0

;somehow this is the only change? pleasantly surprised
.ifdef VER_JP
choicerDef CHOICER_UNK1,0,0,0,0,0
choicerDef CHOICER_UNK2,0,0,0,0,0
choicerDef CHOICER_UNK3,0,0,0,0,0
choicerDef CHOICER_UNK4,0,0,0,0,0
.else
.repeat 4
choicerDef CHOICER_SCIENTIST1,0,0,0,0,0
.endrepeat
.endif

;scientist gag choicers
choicerDef CHOICER_SCIENTIST1,0,0,0,0,3485
choicerDef CHOICER_SCIENTIST2,0,0,0,0,2775

.repeat $10
choicerDef INAME_NULL,0,0,0,0,0
.endrepeat