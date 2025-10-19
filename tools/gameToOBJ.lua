local PLAYER_X = 0x6780+4
local PLAYER_Y = 0x6780+6

function show()
    local x = emu.readWord(PLAYER_X, emu.memType.nesDebug) >> 6
    local y = emu.readWord(PLAYER_Y, emu.memType.nesDebug) >> 6

    emu.drawString(8, 8, string.format("%d, %d", x, y))
    emu.drawString(8, 16, string.format("%x, %x", x, y))
end

emu.addEventCallback(show, emu.eventType.endFrame);