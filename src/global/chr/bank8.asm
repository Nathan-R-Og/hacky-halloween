.segment        "CHR8": absolute
    ;title screen gfx
    .incbin "../../edit/presents_gfx_bin.bin"

    ;the only REAL thing that's shared
    ;the globe that spins
    .incbin "../../edit/earth_gfx_bin.bin"

    ;JP ends here in padding
    .ifndef VER_JP
    ;the crazy melody effect in US
    ;its one tile copied across 64 times so whatever man
    .repeat 4, ArgX
        .repeat 64
            .incbin "../../split/us/chr/8/us2.bin", (ArgX*64*16), $10
        .endrepeat
    .endrepeat
    .endif
