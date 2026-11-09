.ifdef VER_JP

;choicers
CHOICER_NULL:
.byte   stopText

CHOICER_FLIGHTPLANSA:
kanafix "Aコ-ス",stopText
CHOICER_FLIGHTPLANSB:
kanafix "Bコ-ス",stopText
CHOICER_FLIGHTPLANSC:
kanafix "Cコ-ス",stopText
CHOICER_HINTS1:
kanafix "ヒント1",stopText
CHOICER_HINTS2:
kanafix "ヒント2",stopText
CHOICER_HINTS3:
kanafix "ヒント3",stopText
CHOICER_UNK1:
kanafix "どくけし",stopText
CHOICER_UNK2:
kanafix "どくけし",stopText
CHOICER_UNK3:
kanafix "どくけし",stopText
CHOICER_UNK4:
kanafix "どくけし",stopText
CHOICER_SCIENTIST1:
kanafix "ロケット(ほんもの)",stopText
CHOICER_SCIENTIST2:
kanafix "タイムマシン",stopText

;teleport locales
TELEPORT_NULL:
.byte   stopText
TELEPORT_MYHOME:
kanafix "マイホ-ム",stopText
TELEPORT_PODUNK:
kanafix "マザ-ズデイ",stopText
TELEPORT_MERRYSVILLE:
kanafix "サンクスギビング",stopText
TELEPORT_REINDEER:
kanafix "レインディア",stopText
TELEPORT_SPOOKANE:
kanafix "ハロウィ-ン",stopText
TELEPORT_SNOWMAN:
kanafix "スノ-マン",stopText
TELEPORT_YOUNGTOWN:
kanafix "イ-スタ-",stopText
TELEPORT_ELLAY:
kanafix "バレンタイン",stopText
TELEPORT_UNION:
kanafix "サンタクロ-ス",stopText

.else

;choicers
CHOICER_NULL:
.byte 0
CHOICER_FLIGHTPLANSA:
.byte   "FlightplanA",stopText
CHOICER_FLIGHTPLANSB:
.byte   "FlightplanB",stopText
CHOICER_FLIGHTPLANSC:
.byte   "FlightplanC",stopText
CHOICER_HINTS1:
.byte   "Hint 1",stopText
CHOICER_HINTS2:
.byte   "Hint 2",stopText
CHOICER_HINTS3:
.byte   "No",stopText
CHOICER_SCIENTIST1:
.byte   "Yes",stopText
CHOICER_SCIENTIST2:
.byte   "Idk",stopText

;teleport locales
TELEPORT_NULL:
.byte 0
CHOICER_NUM2:
.byte   "2",stopText
CHOICER_NUM4:
.byte   "4",stopText
CHOICER_NUM6:
.byte   "6",stopText
CHOICER_NUM8:
.byte   "8",stopText
CHOICER_NUM3:
.byte   "3",stopText
CHOICER_NUM5:
.byte   "5",stopText
CHOICER_NUM12:
.byte   "12",stopText
CHOICER_NUMPI:
.byte   "3.14",stopText
CHOICER_NUM13:
.byte   "13",stopText

.endif