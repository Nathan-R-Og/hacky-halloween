.segment        "CREDITS": absolute

Credits_Entry:
    jsr credits_cmd_fade_out

    jsr PpuSync

    lda #0
    sta MIRROR

    lda #0
    sta UNK_EC

    lda UNK_E7
    and #%10111111
    sta UNK_E7

    lda #0
    sta UNK_E8
    sta UNK_E9

    ;reset Base nametable address
    lda ram_PPUCTRL
    and #%11111100
    ldx #$10
    ldy #8
    sta ram_PPUCTRL
    stx scroll_y
    sty scroll_x

    ;clear music?
    lda #$ff
    jsr PlayMusic

    jsr WaitFrame

    ;load pointer
    lda #.LOBYTE(Credits_Script)
    sta UNK_40
    lda #.HIBYTE(Credits_Script)
    sta UNK_40+1

    @B26_0042:

    ;if byte == 0, loop
    ldy #0
    lda (UNK_40), y
    beq force_loop

    jsr do_credits_eval
    clc
    tya
    adc UNK_40
    sta UNK_40
    lda #$00
    adc UNK_40+1
    sta UNK_40+1
    jmp @B26_0042

    force_loop:
    jmp start_game_real

Credits_Entry_2:
    ldx #120
    jsr WaitXFrames_Min1

    jsr PpuSync

    lda #1
    sta MIRROR

    lda #0
    sta UNK_EC

    lda UNK_E7
    and #%10111111
    sta UNK_E7

    lda #0
    sta UNK_E8
    sta UNK_E9

    ;reset Base nametable address
    lda ram_PPUCTRL
    and #%11111100
    ldx #0
    ldy #$C0
    sta ram_PPUCTRL
    stx scroll_y
    sty scroll_x

    ;clear music?
    lda #$ff
    jsr PlayMusic

    jsr WaitFrame

    ;load pointer
    lda #.LOBYTE(ActualCredits_Script)
    sta UNK_40
    lda #.HIBYTE(ActualCredits_Script)
    sta UNK_40+1

    @B26_0042:

    ;if byte == 0, loop
    ldy #0
    lda (UNK_40), y
    beq @force_loop

    jsr do_credits_eval
    clc
    tya
    adc UNK_40
    sta UNK_40
    lda #$00
    adc UNK_40+1
    sta UNK_40+1
    jmp @B26_0042

    @force_loop:
    jmp @force_loop

do_credits_eval:
    ;x = a * 2
    asl a
    tax

    ;jmp credits_lut[a]
    lda credits_lut+1, x
    pha
    lda credits_lut, x
    pha
    rts

credits_lut:
    .addr start_game_real-1 ; [00]                      - END, locks up the game
    .addr credits_cmd_delay-1 ; [01 XX]                   - Wait XX frames
    .addr credits_cmd_unk2-1 ; [02 XX]                   - Waits for a specific input??
    .addr credits_cmd_fade_out-1 ; [03]                      - Fades out
    .addr credits_cmd_load_tilesets-1 ; [04 AA BB CC DD]          - CHR bankswitch (R2, R3, R0, R1)
    .addr credits_cmd_load_bg2map-1 ; [05 AA BB CC DD (XX*BB)]  - Load nametable tile data
    .addr credits_cmd_set_metatileprops-1 ; [06 AA BB CC DD (XX*BB)]  - Load metatile properites
    .addr credits_cmd_set_palette-1 ; [07 (XX*10)]              - Set color palette
    .addr credits_cmd_unk8-1 ; [08 XXXX]                 - Unconditional jump
    .addr credits_cmd_init_sprite-1 ; [09 AA BB CC DD EE FF GG] - Init "Sprite" object
    .addr credits_cmd_move_sprite-1 ; [0A AA BB CC DD EE]       - Edit "Sprite" object
    .addr credits_cmd_play_sfx-1 ; [0B XX]                   - Play music XX? Sfx? idk
    .addr credits_cmd_load_secondarytilesets-1 ; [0C XX]                   - CHR bankswitch (R1)
    .addr credits_cmd_set_alltilesets-1 ; [0D AA BB CC DD EE FF]    - CHR bankswitch (R4, R5, R2, R3, R0, R1)
    .addr credits_cmd_begin_loop-1 ; [0E XX]                   - Set $47 loop variable
    .addr credits_cmd_end_loop-1 ; [0F XXXX]                 - Conditional branch on $47. Decrement it and branch if still not zero
    .addr credits_cmd_clear_sprite-1 ; [10 XX]                   - Wait frame then remove OAM entry?
    .addr credits_cmd_draw_text-1 ; [11 AA BB (CC*??)]        - Display text
    .addr credits_cmd_draw_text_xy-1 ; [12 AA BB CC DD]          - Display text with a position
    .addr credits_cmd_fade_in-1 ; [13]                      - Fades in

credits_cmd_delay:
    ;get next byte
    iny
    lda (UNK_40), y

    ;x = a
    tax

    ;do ppu syncs until x == 0
    @loop:
    lda pad1_press
    bne @exit


    jsr PpuSync
    lda #1
    sta UNK_E5
    dex
    bne @loop

    ;get next byte
    iny

    ;bye
    rts

    @exit:
    ldy #0
    lda #.LOBYTE(Credits_end)
    sta UNK_40
    lda #.HIBYTE(Credits_end)
    sta UNK_40+1

    rts

;wait until button pressed?
credits_cmd_unk2:
    ;get next byte
    iny
    lda scroll_x

    sbc (UNK_40), y
    ;reset Base nametable address
    sta scroll_x

    iny

    ;bye
    rts

credits_cmd_fade_out:
    jsr OT0_DefaultTransition
    jsr B31_1d5e
    jsr B31_1d80

    ;set y to after this
    ldy #1

    ;bye
    rts

credits_cmd_set_alltilesets:
    ;get next byte
    iny
    lda (UNK_40), y

    ;swap to that bank
    ldx #BANK::CHR1800
    jsr BANK_SWAP

    ;get next byte
    iny
    lda (UNK_40), y

    ;swap to that bank
    ldx #BANK::CHR1C00
    jsr BANK_SWAP
    ;fallthrough

credits_cmd_load_tilesets:
    ;get next byte
    iny
    lda (UNK_40), y

    ;swap to that bank
    ldx #BANK::CHR1000
    jsr BANK_SWAP

    ;get next byte
    iny
    lda (UNK_40), y

    ;swap to that bank
    ldx #BANK::CHR1400
    jsr BANK_SWAP

    ;get next byte
    iny
    lda (UNK_40), y

    ;swap to that bank
    ldx #BANK::CHR0000
    jsr BANK_SWAP

    credits_cmd_load_secondarytilesets:
    ;get next byte
    iny
    lda (UNK_40), y

    ;swap to that bank
    ldx #BANK::CHR0800
    jsr BANK_SWAP

    ;goto next byte
    iny

    ;byte
    rts

credits_cmd_set_metatileprops:
    lda #$08
    bne B26_00f5
    credits_cmd_load_bg2map:
    lda #$20
    B26_00f5:
    sta UNK_43
    jsr PpuSync
    lda #$05
    sta nmi_queue ; TODO: UNKNOWN NMI COMMAND
    ldy #$04
    lda (UNK_40), y
    sta UNK_42
    dey
    lda (UNK_40), y
    sta nmi_queue+1
    dey
    lda (UNK_40), y
    sta nmi_queue+2
    dey
    lda (UNK_40), y
    sta nmi_queue+3
    ldy #$05
    B26_0119:
    ldx #$00
    B26_011b:
    lda (UNK_40), y
    sta nmi_queue+4, x
    iny
    bne B26_0125
    inc UNK_41
    B26_0125:
    inx
    cpx nmi_queue+1
    bne B26_011b
    lda #.LOBYTE($8000)
    sta nmi_queue+4, x
    sta UNK_E5+1
    lda #.HIBYTE($8000)
    sta UNK_E5
    dec UNK_42
    beq B26_0151
    jsr PpuSync
    clc
    lda UNK_43
    adc nmi_queue+3
    sta nmi_queue+3
    lda #$00
    adc nmi_queue+2
    sta nmi_queue+2
    jmp B26_0119
    B26_0151:
    rts

credits_cmd_set_palette:
    jsr PpuSync

    ;palette size
    ldy #$10

    ldx #$0f
    @loop:
    ;read/write byte
    lda (UNK_40), y
    sta palette_queue, x

    ;copy and write default sprite palette
    lda credits_generic_sprite_pal, x
    sta palette_queue+$10, x

    dey
    dex
    bpl @loop

    ;get transparency of first bg, copy to sprite transparency
    ;emergency case basically
    ;lda palette_queue
    ;sta palette_queue+$10
    ;sta palette_queue+$14
    ;sta palette_queue+$18
    ;sta palette_queue+$1c

    lda #4
    sta nmi_queue ; UPDATE_PALETTE

    lda #0
    sta nmi_queue+1 ; END
    sta UNK_E5+1 ;.LOBYTE($8000)
    lda #.HIBYTE($8000)
    sta UNK_E5

    ;set to after command
    ldy #$11

    ;bye
    rts

credits_cmd_init_sprite:
    jsr PpuSync

    ;get next byte (Slot)
    iny
    lda (UNK_40), y

    ;x = a * 8
    asl a
    asl a
    asl a
    tax

    ;write byte
    lda (UNK_40), y
    and #%10000000
    sta shadow_something+1, x

    ;get next byte (????)
    iny
    lda (UNK_40), y
    sta shadow_something, x

    ;get next byte (X pos)
    iny
    lda (UNK_40), y
    sta shadow_something+2, x

    ;get next byte (Y pos)
    iny
    lda (UNK_40), y
    sta shadow_something+3, x

    ;get next addr (sprite pointer)
    iny
    lda (UNK_40), y
    sta shadow_something+6, x
    iny
    lda (UNK_40), y
    sta shadow_something+7, x

    ;?
    lda #0
    sta shadow_something+4, x
    sta shadow_something+5, x

    ;set to after macro
    ldy #7

    ;bye
    rts

credits_cmd_move_sprite:
    jsr PpuSync

    ;get next byte (Slot)
    iny
    lda (UNK_40), y

    ;x = a * 8
    asl a
    asl a
    asl a
    tax

    ;clear
    clc

    ;get next word (def move)
    iny
    lda (UNK_40), y
    adc shadow_something+6, x
    sta shadow_something+6, x
    iny
    lda (UNK_40), y
    adc shadow_something+7, x
    sta shadow_something+7, x

    ;get next byte (move x)
    iny
    lda (UNK_40), y
    sta shadow_something+4, x

    ;get next byte (move y)
    iny
    lda (UNK_40), y
    sta shadow_something+5, x

    ;bye
    ldy #6
    rts

credits_cmd_play_sfx:
    ;get and play byte
    iny
    lda (UNK_40), y
    jsr PlayMusic

    ;bye
    iny
    rts

credits_cmd_begin_loop:
    ;write byte to $47
    iny
    lda (UNK_40), y
    sta UNK_47

    ;bye
    iny
    rts

credits_cmd_end_loop:
    ;loop count down
    dec UNK_47
    ;if loop count == 0, do a jump to this pointer
    bne credits_cmd_unk8
    ;else, bye
    ldy #3
    rts

credits_cmd_unk8:
    ;push addr to stack
    ;this is some funky stuff because this is a subroutine so it has to write over the data
    ;it is BASICALLY a push to the stack. so
    ;whatever
    iny
    lda (UNK_40), y
    pha
    iny
    lda (UNK_40), y
    sta UNK_40+1
    pla
    sta UNK_40
    ldy #0
    rts

credits_cmd_clear_sprite:
    jsr PpuSync

    ;get byte
    iny
    lda (UNK_40), y

    ;x = a * 8
    asl a
    asl a
    asl a
    tax

    ;reset
    lda #0
    sta shadow_something, x
    iny
    rts

credits_cmd_draw_text:
    ;get next word
    iny
    lda (UNK_40), y
    sta UNK_74
    iny
    lda (UNK_40), y
    sta UNK_73

    lda #2
    sta UNK_76
    lda #$13
    sta UNK_76+1

    lda #$1c
    sta UNK_70
    lda #0
    sta UNK_71

    @loop:
    jsr GetTextData

    jsr B30_06db
    cmp #0
    beq @break
    ldy #0
    lda (UNK_74), y
    cmp #0
    bne @loop

    @break:
    jsr PpuSync

    lda #8
    sta nmi_queue ; PPU_FILL

    lda #7
    sta nmi_queue+1 ; Fill 7 bytes...

    lda #.LOBYTE($23e9)
    sta nmi_queue+3
    lda #.HIBYTE($23e9)
    sta nmi_queue+2 ; at $23E9...

    lda #$ff
    sta nmi_queue+4 ; with $FF

    lda #0
    sta nmi_queue+5 ; END

    ldx #2
    @loop2:
    lda #.LOBYTE($8000)
    sta UNK_E5+1
    lda #.HIBYTE($8000)
    sta UNK_E5

    dex
    beq @break2
    jsr PpuSync

    clc

    lda #8
    adc nmi_queue+3
    sta nmi_queue+3
    lda #0
    adc nmi_queue+2
    sta nmi_queue+2
    jmp @loop2

    @break2:
    ldy #$03
    rts

credits_cmd_draw_text_xy:
    ;get next umsg
    iny
    lda (UNK_40), y
    sta UNK_74
    iny
    lda (UNK_40), y
    sta UNK_73

    ;get next byte (x pos)
    iny
    lda (UNK_40), y
    sta UNK_76

    ;get next byte (y pos)
    iny
    lda (UNK_40), y
    sta UNK_76+1

    lda #0
    sta UNK_70
    sta UNK_71

    jsr GetTextData
    jsr B30_06db

    ;bye
    ldy #$05
    rts

credits_cmd_fade_in:
    jsr RestoreAndUpdatePalette

    ;bye
    ldy #1
    rts

credits_generic_sprite_pal:
    .byte $0f, $0f, $00, $30
    .byte $0f, $0f, $16, $37
    .byte $0f, $0f, $24, $37
    .byte $0f, $0f, $12, $37

.define ENDING_CMD_00_END .byte 0

.define ENDING_CMD_01_DELAY(frames) .byte 1, frames

.define ENDING_CMD_02(arg1) .byte 2, arg1

.define ENDING_CMD_03_FADEOUT .byte 3

.macro ENDING_CMD_04_LOADTILESETS arg1, arg2, arg3, arg4
    .byte 4
    .byte arg1
    .byte arg2
    .byte arg3
    .byte arg4
.endmacro

.macro ENDING_CMD_05_LOADBG2MAP arg1, arg2, arg3
    .byte 5
    .addr arg1
    .byte arg2, arg3
.endmacro

.macro ENDING_CMD_06_SETMETATILEPROPERTIES arg1, arg2, arg3
    .byte 6
    .addr arg1
    .byte arg2, arg3
.endmacro

.define ENDING_CMD_07_SETPAL .byte 7

.macro ENDING_CMD_08 arg1
    .byte 8
    .word arg1
.endmacro

.macro ENDING_CMD_09_INITSPRITE id, tiles, arg_x, arg_y, sprite_pointer
    .byte 9, id, tiles
    .byte arg_x,arg_y
    .addr sprite_pointer
.endmacro

.macro ENDING_CMD_0A_MOVESPRITE id, arg2, arg3, arg4
    .byte $A, id
    .word arg2
    .byte arg3, arg4
.endmacro

.define ENDING_CMD_0B_PLAYSFX(arg1) .byte $B, arg1

.define ENDING_CMD_0C_LOADSECONDARYSPRITETILES(arg1) .byte $C, arg1

.macro ENDING_CMD_0D_SETALLTILESETS arg1, arg2, arg3, arg4, arg5, arg6
    .byte $D
    .byte arg1, arg2
    .byte arg3, arg4
    .byte arg5, arg6
.endmacro

.define ENDING_CMD_0E_BEGINLOOP(iterations) .byte $E, iterations

.macro ENDING_CMD_0F_ENDLOOP pointer
    .byte $F
    .addr pointer
.endmacro

.define ENDING_CMD_10_CLEARSPRITE(arg1) .byte $10, arg1

.macro ENDING_CMD_11_DRAWTEXT stringId
    .byte $11
    .word stringId
.endmacro

.macro ENDING_CMD_12_DRAWTEXTXY stringId, arg_x, arg_y
    .byte $12
    .word stringId
    .byte arg_x,arg_y
.endmacro

.define ENDING_CMD_13_FADEIN .byte $13

;byte code begin
Credits_Script:
    ENDING_CMD_0B_PLAYSFX 8
    ENDING_CMD_04_LOADTILESETS $02, $00, $D0, $D2
    ENDING_CMD_05_LOADBG2MAP $2088, 20, 16
        .byte $6E,$6E,$69,$6A,$69,$6A,$67,$68,$6E,$6E,$63,$46,$43,$43,$47,$6E,$69,$6A,$67,$68
        .byte $6E,$6E,$6B,$6C,$6B,$6C,$69,$6A,$6E,$48,$49,$4A,$46,$4B,$4C,$6E,$6B,$6C,$69,$6A
        .byte $6E,$6E,$75,$76,$6E,$6E,$69,$6A,$4D,$49,$62,$62,$4E,$4F,$60,$6E,$6E,$6E,$69,$6A
        .byte $6E,$6E,$77,$78,$6E,$6E,$6B,$6C,$51,$54,$54,$54,$52,$5E,$61,$6E,$67,$68,$6B,$6C
        .byte $6E,$6F,$6E,$6E,$6E,$6E,$6E,$6F,$51,$54,$7E,$7F,$52,$5F,$53,$6E,$69,$6A,$6E,$6E
        .byte $6F,$6E,$6E,$6E,$6E,$6E,$6F,$6E,$51,$55,$5A,$5B,$56,$57,$6E,$6E,$6B,$6C,$6E,$6E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$36,$2D,$3A,$2E,$2E,$2E,$2E,$2E,$2E,$2E
        .byte $2F,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$36,$2D,$3A,$2E,$2E,$2E,$2E,$2F,$2E,$2E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$30,$2D,$33,$2E,$2E,$2E,$2E,$2E,$2E,$2F,$2E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$36,$2D,$3A,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
        .byte $2E,$2E,$2E,$2F,$2E,$2F,$2E,$2E,$2E,$36,$37,$2E,$2E,$2F,$2E,$2E,$2E,$2E,$2E,$2E
        .byte $2E,$2E,$2F,$2E,$2E,$2E,$2E,$2E,$3B,$2D,$2D,$3A,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
        .byte $0C,$0C,$07,$09,$09,$0A,$2E,$2E,$3B,$2D,$37,$2E,$2E,$2E,$2E,$2F,$07,$09,$09,$09
        .byte $0C,$0C,$08,$09,$09,$0B,$2E,$2E,$2E,$32,$2D,$31,$2E,$2F,$2F,$2E,$08,$09,$09,$09
        .byte $27,$28,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$36,$2D,$3A,$2E,$2E,$2E,$2E,$2E,$2E,$2E
        .byte $29,$2A,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$36,$2D,$3A,$2E,$2E,$2E,$2E,$2E,$2E,$2E
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, 5, 4
        .byte $C8,$8A,$55,$55,$AA
        .byte $22,$08,$05,$05,$22
        .byte $80,$20,$00,$20,$08
        .byte $20,$00,$00,$0A,$00
    ;ninten
    ENDING_CMD_09_INITSPRITE 0, $04, $70, $20, SPRITEDEF_CREDITS_ninten_d1
    ;ana
    ENDING_CMD_09_INITSPRITE 1, $04, $70, $30, SPRITEDEF_CREDITS_ana_u1
    ;lloyd
    ENDING_CMD_09_INITSPRITE 2, $04, $60, $30, SPRITEDEF_CREDITS_lloyd_u1
    ;teddy
    ENDING_CMD_09_INITSPRITE 3, $04, $80, $30, SPRITEDEF_18
    ;dog
    ENDING_CMD_09_INITSPRITE 4, $04, $30, $40, SPRITEDEF_CREDITS_UNK36
    ENDING_CMD_11_DRAWTEXT UMSG::CREDITS_1
    ENDING_CMD_07_SETPAL
        .byte $0F,$3A,$18,$38
        .byte $0F,$3A,$00,$20
        .byte $0F,$3A,$24,$1A
        .byte $0F,$3A,$30,$12
    ENDING_CMD_01_DELAY 240

    ;face down
    ENDING_CMD_0A_MOVESPRITE 1, 4*2, 0, 0
    ENDING_CMD_0A_MOVESPRITE 2, 4*2, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_1C-SPRITEDEF_18, 0, 0
    ENDING_CMD_01_DELAY 120

    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_6-SPRITEDEF_CREDITS_ninten_d1, 0, 0
    ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_E-SPRITEDEF_CREDITS_ana_d1, 0, 0
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_16-SPRITEDEF_CREDITS_lloyd_d1, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, 2*4, 0, 0
    ENDING_CMD_04_LOADTILESETS $02, $00, $60, $d2
    ENDING_CMD_07_SETPAL
        .byte $0F,$28,$16,$36
        .byte $0F,$28,$29,$37
        .byte $0F,$28,$06,$17
        .byte $0F,$28,$30,$13
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_CREDITS_ninten_u1-SPRITEDEF_6, 0, 0
    ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_CREDITS_ana_u1-SPRITEDEF_E, 0, 0
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_CREDITS_lloyd_u1-SPRITEDEF_16, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, -6*4, 0, 0
    ENDING_CMD_04_LOADTILESETS $02, $00, $D0, $D2
    ENDING_CMD_07_SETPAL
        .byte $0F,$3A,$18,$38
        .byte $0F,$3A,$00,$20
        .byte $0F,$3A,$24,$1A
        .byte $0F,$3A,$30,$12


    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_2-SPRITEDEF_CREDITS_ninten_u1, 0, 0
    ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_A-SPRITEDEF_CREDITS_ana_u1, 0, 0
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_12-SPRITEDEF_CREDITS_lloyd_u1, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, 2*4, 0, 0
    ENDING_CMD_04_LOADTILESETS $02, $00, $60, $d2
    ENDING_CMD_07_SETPAL
        .byte $0F,$28,$16,$36
        .byte $0F,$28,$29,$37
        .byte $0F,$28,$06,$17
        .byte $0F,$28,$30,$13
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_CREDITS_ninten_d1-SPRITEDEF_2, 0, 0
    ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_CREDITS_ana_d1-SPRITEDEF_A, 0, 0
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_CREDITS_lloyd_d1-SPRITEDEF_12, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, 2*4, 0, 0
    ENDING_CMD_04_LOADTILESETS $02, $00, $D0, $D2
    ENDING_CMD_07_SETPAL
        .byte $0F,$3A,$18,$38
        .byte $0F,$3A,$00,$20
        .byte $0F,$3A,$24,$1A
        .byte $0F,$3A,$30,$12
    ENDING_CMD_01_DELAY 8

    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_NINTENDOWN1-SPRITEDEF_CREDITS_ninten_d1, 0, 0
    ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_C-SPRITEDEF_CREDITS_ana_d1, 0, 0
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_14-SPRITEDEF_CREDITS_lloyd_d1, 0, 0

    ENDING_CMD_04_LOADTILESETS $02, $00, $60, $d2
    ENDING_CMD_07_SETPAL
        .byte $0F,$28,$16,$36
        .byte $0F,$28,$29,$37
        .byte $0F,$28,$06,$17
        .byte $0F,$28,$30,$13
    ENDING_CMD_01_DELAY 4

    ENDING_CMD_01_DELAY 180
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30


    ;scene 2
    ENDING_CMD_04_LOADTILESETS $08, $00, $60, $64
    ENDING_CMD_05_LOADBG2MAP $2088, 20, 16
        .byte $2E,$2E,$27,$28,$39,$3A,$05,$05,$07,$08,$05,$3B,$05,$05,$3D,$3E,$2E,$2E,$27,$28
        .byte $25,$0D,$29,$2A,$22,$23,$23,$0A,$0B,$0C,$08,$3F,$23,$23,$3C,$20,$2E,$2E,$29,$2A
        .byte $27,$28,$2B,$2C,$11,$2D,$0E,$0B,$1C,$1D,$0F,$10,$2D,$12,$14,$21,$27,$28,$29,$2A
        .byte $29,$2A,$27,$28,$11,$2D,$26,$2D,$2D,$2D,$12,$1E,$2D,$12,$24,$13,$29,$2A,$2B,$2C
        .byte $29,$2A,$29,$2A,$11,$15,$26,$2D,$18,$19,$12,$1F,$15,$16,$17,$2E,$29,$2A,$2E,$2E
        .byte $2B,$2C,$2B,$2C,$2E,$2E,$11,$15,$1A,$1B,$16,$17,$2E,$2E,$2E,$2E,$2B,$2C,$2E,$2E
        .byte $27,$28,$27,$28,$25,$0D,$2E,$2E,$25,$0D,$2E,$2E,$25,$0D,$25,$0D,$27,$28,$27,$28
        .byte $29,$2A,$29,$2A,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$25,$0D,$2E,$29,$2A,$29,$2A
        .byte $2B,$2C,$29,$2A,$2E,$2E,$25,$0D,$2E,$2E,$25,$0D,$2E,$2E,$27,$28,$29,$2A,$29,$2A
        .byte $27,$28,$2B,$2C,$2E,$2E,$2E,$2E,$25,$0D,$2E,$2E,$2E,$2E,$29,$2A,$2B,$2C,$2B,$2C
        .byte $29,$2A,$2E,$2E,$2E,$2E,$25,$0D,$25,$0D,$2E,$2E,$25,$0D,$29,$2A,$2E,$2E,$27,$28
        .byte $2B,$2C,$25,$0D,$2E,$2E,$2E,$25,$0D,$2E,$2E,$2E,$2E,$2E,$2B,$2C,$27,$28,$29,$2A
        .byte $0D,$2E,$25,$0D,$25,$0D,$25,$0D,$2E,$25,$0D,$2E,$2E,$25,$0D,$2E,$29,$2A,$29,$2A
        .byte $25,$0D,$2E,$2E,$2E,$25,$0D,$2E,$25,$0D,$25,$0D,$25,$0D,$25,$0D,$2B,$2C,$2B,$2C
        .byte $25,$0D,$2E,$2E,$25,$0D,$2E,$2E,$25,$0D,$2E,$2E,$25,$0D,$2E,$2E,$25,$0D,$2E,$2E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, 5, 4
        .byte $AA,$FF,$FF,$FF,$A8
        .byte $AA,$AF,$AD,$AF,$A2
        .byte $AA,$AA,$AA,$AA,$AA
        .byte $AA,$AA,$AA,$AA,$AA
    ENDING_CMD_09_INITSPRITE 7, $04, $80, $20, SPRITEDEF_SCREAMER+(4*4)
    ENDING_CMD_09_INITSPRITE 5, $04, $40, $30, SPRITEDEF_CLOWN+(4*4)
    ENDING_CMD_09_INITSPRITE 6, $04, $80, $30, SPRITEDEF_WOLF
    ENDING_CMD_09_INITSPRITE 8, $04, $40, $40, SPRITEDEF_WOLF
    ENDING_CMD_09_INITSPRITE 9, $04, $30, $50, SPRITEDEF_DRACULA+(2*4)
    ENDING_CMD_09_INITSPRITE 3, $04, $60, $50, SPRITEDEF_ROBOT+(2*4)
    ENDING_CMD_09_INITSPRITE 4, $04, $70, $50, SPRITEDEF_SCREAMER+(6*4)
    ENDING_CMD_09_INITSPRITE $A, $04, $90, $50, SPRITEDEF_CLOWN+(4*4)
    ENDING_CMD_09_INITSPRITE $B, $04, $90, $60, SPRITEDEF_WOLF
    ENDING_CMD_11_DRAWTEXT UMSG::CREDITS_2
    ENDING_CMD_07_SETPAL
        .byte $0F,$28,$16,$36
        .byte $0F,$28,$29,$37
        .byte $0F,$28,$06,$17
        .byte $0F,$28,$30,$13
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 60
    ENDING_CMD_0E_BEGINLOOP $02
    CREDITS_loop_unk2C:
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK106-SPRITEDEF_CREDITS_UNK105, -1, 1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK110-SPRITEDEF_CREDITS_UNK109, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK100-SPRITEDEF_CREDITS_UNK99, -1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK87-SPRITEDEF_CREDITS_UNK85, 0, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK99-SPRITEDEF_CREDITS_UNK106, -1, 1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK111-SPRITEDEF_CREDITS_UNK110, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK99-SPRITEDEF_CREDITS_UNK100, -1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK100-SPRITEDEF_CREDITS_UNK99, -1, -1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK110-SPRITEDEF_CREDITS_UNK111, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK100-SPRITEDEF_CREDITS_UNK99, 1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK89-SPRITEDEF_CREDITS_UNK87, 0, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK101-SPRITEDEF_CREDITS_UNK100, -1, -1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK109-SPRITEDEF_CREDITS_UNK110, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK99-SPRITEDEF_CREDITS_UNK100, 1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK100-SPRITEDEF_CREDITS_UNK101, 1, 1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK110-SPRITEDEF_CREDITS_UNK109, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK100-SPRITEDEF_CREDITS_UNK99, -1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK87-SPRITEDEF_CREDITS_UNK89, 0, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK99-SPRITEDEF_CREDITS_UNK100, 1, 1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK111-SPRITEDEF_CREDITS_UNK110, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK99-SPRITEDEF_CREDITS_UNK100, -1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK106-SPRITEDEF_CREDITS_UNK99, 1, -1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK110-SPRITEDEF_CREDITS_UNK111, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK100-SPRITEDEF_CREDITS_UNK99, 1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK85-SPRITEDEF_CREDITS_UNK87, 0, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK105-SPRITEDEF_CREDITS_UNK106, 1, -1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK109-SPRITEDEF_CREDITS_UNK110, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK99-SPRITEDEF_CREDITS_UNK100, 1, 0
        ENDING_CMD_01_DELAY 8
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk2C
    ENDING_CMD_0A_MOVESPRITE 4, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 5, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 6, 0, 0, 0
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30

    ;scene 3
    ENDING_CMD_04_LOADTILESETS $D4, $D5, $D4, $D6

    ENDING_CMD_05_LOADBG2MAP $2088, 20, 16
    .incbin "../../edit/house1_tiles.bin"
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, 5, 4
    .res 20, %01010101
    ENDING_CMD_11_DRAWTEXT UMSG::CREDITS_4
    ENDING_CMD_07_SETPAL
        .byte $0f,$0f,$0f,$0f
        .byte $0f,$22,$06,$17
        .byte $0f,$22,$06,$17
        .byte $0F,$0f,$30,$30

    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 64
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 10

    ;scene 4
    ENDING_CMD_04_LOADTILESETS $D6, $D7, $D4, $D6

    ENDING_CMD_05_LOADBG2MAP $2088, 20, 16
    .incbin "../../edit/house2_tiles.bin"
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, 5, 4
    .res 20, %01010101
    ENDING_CMD_11_DRAWTEXT UMSG::CREDITS_5
    ENDING_CMD_07_SETPAL
        .byte $0f,$0f,$0f,$0f
        .byte $0f,$11,$06,$04
        .byte $0f,$11,$06,$04
        .byte $0F,$0f,$30,$30
    ENDING_CMD_01_DELAY 240

    ENDING_CMD_0E_BEGINLOOP 2
    CREDITS_loop_flash:
    ENDING_CMD_01_DELAY 2
    ENDING_CMD_07_SETPAL
        .byte $0f,$0f,$0f,$0f
        .byte $0f,$21,$16,$14
        .byte $0f,$21,$16,$14
        .byte $0F,$0f,$30,$30
    ENDING_CMD_01_DELAY 2
    ENDING_CMD_07_SETPAL
        .byte $0f,$0f,$0f,$0f
        .byte $0f,$11,$06,$04
        .byte $0f,$11,$06,$04
        .byte $0F,$0f,$30,$30
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_flash

Credits_end:
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 15
    ENDING_CMD_04_LOADTILESETS $02, $00, $60, $d2
    ENDING_CMD_00_END

ActualCredits_Script:
    ENDING_CMD_0B_PLAYSFX 45
    ENDING_CMD_0D_SETALLTILESETS $dc, $dd, $da, $db, $60, $64

    ENDING_CMD_05_LOADBG2MAP $2000, 32, 32
        incbinRange "../../edit/real_credits.tilemap", 0, $400
    ENDING_CMD_05_LOADBG2MAP $2800, 32, 23
        .incbin "../../edit/real_credits.tilemap", $400


    ENDING_CMD_06_SETMETATILEPROPERTIES $23C0, 8, 8
        .res 8*8, %01010101
    ENDING_CMD_06_SETMETATILEPROPERTIES $2BC0, 8, 8
        .res 8*8, 0
    ENDING_CMD_07_SETPAL
        .byte $0F,$04,$18,$30
        .byte $0F,$02,$0c,$1c
        .byte $0F,$3A,$24,$1A
        .byte $0F,$3A,$30,$12
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ;ninten
    ENDING_CMD_09_INITSPRITE 0, $04, $40, $C0, SPRITEDEF_0
    ;ana
    ENDING_CMD_09_INITSPRITE 1, $04, $58, $C0, SPRITEDEF_8
    ;lloyd
    ENDING_CMD_09_INITSPRITE 2, $04, $78, $C0, SPRITEDEF_10
    ;teddy
    ENDING_CMD_09_INITSPRITE 3, $04, $90, $C0, SPRITEDEF_18


    ENDING_CMD_0E_BEGINLOOP 4
    @walkup:
        ENDING_CMD_0A_MOVESPRITE 0, 4, 0, -1
        ENDING_CMD_0A_MOVESPRITE 1, 4, 0, -1
        ENDING_CMD_0A_MOVESPRITE 2, 4, 0, -1
        ENDING_CMD_0A_MOVESPRITE 3, 4, 0, -1
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 0, -4, 0, -1
        ENDING_CMD_0A_MOVESPRITE 1, -4, 0, -1
        ENDING_CMD_0A_MOVESPRITE 2, -4, 0, -1
        ENDING_CMD_0A_MOVESPRITE 3, -4, 0, -1
        ENDING_CMD_01_DELAY 8
    ENDING_CMD_0F_ENDLOOP @walkup
    ENDING_CMD_0A_MOVESPRITE 0, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 1, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 2, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, 0, 0, 0


    ENDING_CMD_0E_BEGINLOOP 60
    @CREDITS_loop_unk2C:
        ENDING_CMD_02 1
        ENDING_CMD_01_DELAY 2
    ENDING_CMD_0F_ENDLOOP @CREDITS_loop_unk2C

    ENDING_CMD_0A_MOVESPRITE 0, 0, 0, 1
    ENDING_CMD_0A_MOVESPRITE 1, 0, 0, 1
    ENDING_CMD_0A_MOVESPRITE 2, 0, 0, 1
    ENDING_CMD_0A_MOVESPRITE 3, 0, 0, 1
    ENDING_CMD_0E_BEGINLOOP 32
    @looper2:
        ENDING_CMD_02 1
        ENDING_CMD_01_DELAY 2
    ENDING_CMD_0F_ENDLOOP @looper2
    ENDING_CMD_0A_MOVESPRITE 0, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 1, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 2, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, 0, 0, 0

    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240

    ENDING_CMD_05_LOADBG2MAP $2144, 24, 4
        .incbin "../../edit/real_credits_jj.tilemap"
        .res 24, $c0
    ENDING_CMD_06_SETMETATILEPROPERTIES $23D1, 6, 2
        .byte %00000101, %00000101, %00000101, %00000101, %00000101, %00000101
        .byte %01010000, %01010000, %01010000, %01010000, %01010000, %01010000


    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240

    ENDING_CMD_05_LOADBG2MAP $224e, 6, 1
        .byte $e1, $e2, $e3, $e4, $e5, $e6
    ENDING_CMD_05_LOADBG2MAP $2254, 2, 2
        .byte $e7, $e8
        .byte $f7, $f8


    ENDING_CMD_00_END