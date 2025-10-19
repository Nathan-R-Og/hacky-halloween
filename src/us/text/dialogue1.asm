.segment        "CHR10": absolute

MSG_SYS_SYSERROR:
.byte   "System Error!!!",newLine
.byte   stopText

MSG_MYHOME_MINNIE_INVASION:
.byte   "*Sorry honey,",newLine
.byte   " you need some time",newLine
.byte   " outside!",newLine
.byte   pauseText
.byte   "*Go have some fun!"
.byte   stopText

MSG_MYHOME_MINNIE_INVASION_FIGHT:
.byte   "*Beat it kid! The town",newLine
.byte   " is under",newLine
.byte   " construction."
.byte   stopText

MSG_MYHOME_MINNIE_INVASION_FIGHT_2:
.byte   "*Scram!"
.byte   stopText

MSG_MYHOME_JUICE:
.byte   "*I only eat Snickers.",newLine
.byte   " I am always hungry."
.byte   stopText

MSG_MYHOME_MIMMIE_INVASION:
.byte   "*I'm out for my",newLine
.byte   " brother.",newLine
.byte   pauseText
.byte   "*Turns out he's",newLine
.byte   " scared of clowns."
.byte   stopText

MSG_MYHOME_MIMMIE_INVASION_FIGHT:
.byte   "*Do you know that",newLine
.byte   " story about a dog?",newLine
.byte   pauseText
.byte   "*Yeah, that's",newLine
.byte   " happening to me",newLine
.byte   " right now."
.byte   stopText

MSG_MYHOME_MIMMIE:
.byte   "*Boo! Haha . got you"
.byte   stopText

MSG_MYHOME_MOM_INVASION:
.byte   "*Can I have a piece",newLine
.byte   " of your candy?",newLine
.byte   stopText
MSG_MYHOME_MOM:
.byte   "*Darn. Worth a try."
.byte   stopText
MSG_MYHOME_MOM_HURT:
.byte   "*Thanks!"
.byte   stopText
MSG_MYHOME_MOM_EAT:
.byte   "*Hey! You don't",newLine
.byte   " have any!"
.byte   stopText

MSG_PHONE_NEXTLVL:
.byte   "*Well, the next",newLine
.byte   " level",newLine
.byte   " requires...",newLine
.byte   stopText

MSG_MYHOME_PHONE:
.byte   "*With my inate father",newLine
.byte   " senses, I can feel",newLine
.byte   " that you've gotten",newLine
.byte   pauseText
.byte   " into a pretty sticky",newLine
.byte   " situation.",newLine
.byte   pauseText
.byte   "*Why you'd do this",newLine
.byte   " on Halloween of all",newLine
.byte   " things is beyond me.",newLine
.byte   pauseText
.byte   "*I'm sure you have",newLine
.byte   " your reasons. Just",newLine
.byte   " stay safe.",newLine
.byte   pauseText
.byte   "*I just hope you",newLine
.byte   " didn't get into ",newLine
.byte   " anything shady.",newLine
.byte   pauseText
.byte   "*Make sure you and",newLine
.byte   " your friends equip",newLine
.byte   " your things again.",newLine
.byte   pauseText
.byte   "*",nintenName,", go",newLine
.byte   " for it!!",newLine
.byte   pauseText
.byte   "*But remember to come",newLine
.byte   " back and check on",newLine
.byte   " our family.",newLine
.byte   pauseText
.byte   "*Bye.",newLine
.byte   pauseText
.byte   "*Oh... phone me, and",newLine
.byte   " I will SAVE your",newLine
.byte   " progress.",newLine
.byte   stopText

MSG_PHONE_END:
.byte   "*Slam.",newLine
.byte   stopText
MSG_PHONE_INTRO:
.byte   "*This is your Dad.",newLine
.byte   stopText
MSG_PHONE_NEWMONEY:
.byte   "*I've psychically",newLine
.byte   " given you $",cashDeposit,newLine
.byte   " candy.",newLine
.byte   pauseText
.byte   "*After the amount",newLine
.byte   " you've eaten,",newLine
.byte   pauseText
.byte   "*you have",newLine
.byte   " $"
.byte   print_number wallet_money, 2, 0
.byte   ".",newLine
.byte   pauseText
.byte   "*Use your candy",newLine
.byte   " wisely.",newLine
.byte   stopText
MSG_PHONE_RESETPROMPT:
.byte   "*Now son, it's not",newLine
.byte   " my business, but",newLine
.byte   " why not rest?",newLine
.byte   stopText
MSG_PHONE_SAVE_YES:
.byte   "*I see. ",newLine
.byte   " I'll SAVE your",newLine
.byte   " progress.",newLine
.byte   stopText
MSG_PHONE_SAVE_NO:
.byte   "*I see.",newLine
.byte   " I know, Podunk",newLine
.byte   " faces a crisis.",newLine
.byte   stopText
MSG_PHONE_SAVED_RESETPROMPT:
.byte   "*OK...But, I was",newLine
.byte   " thinking of going",newLine
.byte   " to sleep now.",newLine
.byte   pauseText
.byte   "*I've SAVEd your",newLine
.byte   " progress, so far.",newLine
.byte   pauseText
.byte   "*Good night.",newLine
.byte   stopText
MSG_PHONE_RESET_YES:
.byte   "*See you later!",newLine
.byte   pauseText
.byte   "*Remember, push in",newLine
.byte   " and hold RESET,",newLine
.byte   pauseText
.byte   "*while turning the",newLine
.byte   " POWER off. OK?",newLine
.byte   stopText
MSG_PHONE_RESET_NO:
.byte   "*Just like your",newLine
.byte   " Mom, you never",newLine
.byte   " want to stop.",newLine
.byte   pauseText
.byte   "*Please don't push",newLine
.byte   " yourself so hard.",newLine
.byte   stopText
MSG_PHONE_SAVEPROMPT:
.byte   "*By the way, do",newLine
.byte   " you want to SAVE?",newLine
.byte   stopText
MSG_PHONE_GOODLUCK:
.byte   "*Good luck.",newLine
.byte   stopText

MSG_PODUNK_PIPPIMOM_THANKS:
.byte   "*my broter and i",newLine
.byte   " r chekig our hal"
.byte   stopText

MSG_PODUNK_CEMETERYGUY1:
.byte   "*Don't tell my",newLine
.byte   " brother, but all",newLine
.byte   " we got are rocks."
.byte   stopText

MSG_PODUNK_CEMETERYGUY2:
.byte   "*Is it just me, or",newLine
.byte   " did these houses",newLine
.byte   " not exist before?"
.byte   stopText

MSG_PODUNK_SCAREDGUY1:
.byte   "*Glad these kids are",newLine
.byte   " having fun.",newLine
.byte   pauseText
.byte   "*Back in my day, we",newLine
.byte   " would throw eggs at",newLine
.byte   " people's houses.",newLine
.byte   pauseText
.byte   "*I'm old!"
.byte   stopText

MSG_PODUNK_SCAREDGUY2:
.byte   "*No one has came out",newLine
.byte   " of the mansion yet.",newLine
.byte   pauseText
.byte   "*G-G-G-G-Gulp!"
.byte   stopText

MSG_PODUNK_SCAREDGUY3:
.byte   "*If you find any candy",newLine
.byte   " in the mansion, can",newLine
.byte   " you save some for me?",newLine
.byte   "*Thanks."
.byte   stopText

MSG_PODUNK_SCAREDGUY4:
.byte   " HAUNTED HOUSE",newLine
.byte   "      OF",newLine
.byte   "    HORROR",newLine
.byte   pauseText
.byte   " Take your chance",newLine
.byte   " against the HORROR",newLine
.byte   " within!"
.byte   stopText

MSG_PODUNK_SCAREDGUY5:
.byte   "*Hey guys.",newLine
.byte   "*Y'all want a",newLine
.byte   " fourth?",newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY6:
.byte   "*Sweet!",newLine
.byte   pauseText
.byte   "*Sorry in advance,",newLine
.byte   " you won't be able",newLine
.byte   " to see my stats.",newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY7:
.byte   "*That's fair.",newLine
.byte   stopText

MSG_PODUNK_ZOMBIE:
.byte   " Welcome to the",newLine
.byte   " Corn Maize!",newLine
.byte   pauseText
.byte   " Don't get lost!",newLine
.byte   " Don't get lost!",newLine
.byte   " Don't get lost!",newLine
.byte   pauseText
.byte   " Don't get lost!",newLine
.byte   stopText
MSG_PODUNK_ZOMBIE2:
.byte   " ?!?!",newLine
.byte   stopText

MSG_PODUNK_NECROMANCERWOMAN1:
.byte   " Talk to the",newLine
.byte   " entry sign.",newLine
.byte   stopText
MSG_PODUNK_NECROMANCERWOMAN2:
.byte   " Not me, idiot.",newLine
.byte   stopText

MSG_PODUNK_WARYGUY:
.byte   "*IM LOST IN THE",newLine
.byte   " CORN MAIIIIIZE"
.byte   stopText

MSG_PODUNK_CANARYGIRL1:
.byte   "*Y'know, I figured",newLine
.byte   " this would be a",newLine
.byte   " cool date spot.",newLine
.byte   pauseText
.byte   "*I may be having",newLine
.byte   " some regrets.",newLine
.byte   stopText

MSG_PODUNK_CANARYGIRL2:
.byte   "*Help!! I was",newLine
.byte   " with my boyfriend",newLine
.byte   " on our date,",newLine
.byte   pauseText
.byte   " but I got lost!",newLine
.byte   " It was going so",newLine
.byte   " well, too!",newLine
.byte   stopText

MSG_PODUNK_CANARYGIRL3:
.byte   "*I am neutral about",newLine
.byte   " these things.(edited)",newLine
.byte   stopText

MSG_PODUNK_CANARYGIRL4:
.byte   "*Wow! I'm really",newLine
.byte   " glad there are no",newLine
.byte   " jumpscares!",newLine
.byte   pauseText
.byte   "*I like atmospheric",newLine
.byte   " horror way better",newLine
.byte   " anyways.",newLine
.byte   stopText

MSG_PODUNK_MAYORGUY:
.byte   "*not a single",newLine
.byte   " jumpscare. Yuck.",newLine
.byte   pauseText
.byte   "*these indie devs",newLine
.byte   " and their",newLine
.byte   " atmospheric horror.",newLine
.byte   stopText

MSG_PODUNK_CONCERNEDGUY:
.byte   "*this attraction",newLine
.byte   " sucks!!!",newLine
.byte   pauseText
.byte   "*literally WHERE",newLine
.byte   " is the skeeball???",newLine
.byte   stopText

MSG_PODUNK_SENSIBLEGUY1:
.byte   "*No dunking chamber???",newLine
.byte   "*What am I supposed",newLine
.byte   " to do with my life!",newLine
.byte   stopText

MSG_PODUNK_SENSIBLEGUY2:
.byte   "*All they have is",newLine
.byte   " storebought candy.",newLine
.byte   pauseText
.byte   "*Where are the knives?",newLine
.byte   " The blades?",newLine
.byte   pauseText
.byte   "*I was hoping to get",newLine
.byte   " some weaponry here.",newLine
.byte   stopText

MSG_PODUNK_EVENTGIRL1:
.byte   "*They don't even have",newLine
.byte   " the latest thing",newLine
.byte   " here! Y'know?",newLine
.byte   pauseText
.byte   "*The thing that keeps",newLine
.byte   " all of our attention",newLine
.byte   " spans in check?",newLine
.byte   pauseText
.byte   "*What was it again...",newLine
.byte   stopText
MSG_PODUNK_EVENTGIRL2:
.byte   "*Exactly! You get it!",newLine
.byte   pauseText
.byte   "*They don't have",newLine
.byte   " ",playerName,".",newLine
.byte   pauseText
.byte   "*What a rip off!",newLine
.byte   stopText

MSG_PODUNK_POLTERGUY:
.byte   "*I've seen it all.",newLine
.byte   " Everything.",newLine
.byte   pauseText
.byte   "*Absolutely every",newLine
.byte   " scare. Every spook.",newLine
.byte   pauseText
.byte   "*You think I'm",newLine
.byte   " talking about HERE?",newLine
.byte   " No. Everywhere.",newLine
.byte   pauseText
.byte   "*Every game. Every",newLine
.byte   " movie. I know all",newLine
.byte   " of the scares.",newLine
.byte   pauseText
.byte   "*I know all of the",newLine
.byte   " creepypastas. You",newLine
.byte   " can't take them.",newLine
.byte   pauseText
.byte   "*What? You just want",newLine
.byte   " the flame?",newLine
.byte   pauseText
.byte   "*LIAR! LIAR! LIAR!",newLine
.byte   "*GO MY BASKET! EAT",newLine
.byte   " THEM ALIVE! HAHAHA!",newLine
.byte   stopText

MSG_PODUNK_ZOOGUY:
.byte   "*How many brown",newLine
.byte   " doors are in the",newLine
.byte   " lobby (foyer)?",newLine
.byte   stopText

MSG_PODUNK_BREADGIRL:
.byte   "*WRONG!!!",newLine
.byte   stopText

MSG_PODUNK_PIPPI_MEET_NOYES:
.byte   "*Hmmm.",newLine
.byte   stopText

MSG_TWINKLE_LLOYDBULLY2_LLOYD:
.byte   "*How many flames do",newLine
.byte   " you need to beat",newLine
.byte   " the game?",newLine
.byte   stopText

MSG_REINDEER_DRAGONGIRL_CHECK:
.byte   "*How many party",newLine
.byte   " members can you",newLine
.byte   " have at once?",newLine
.byte   stopText

MSG_PODUNK_CASHCARDWOMAN:
.byte   "*What question number",newLine
.byte   " is this?",newLine
.byte   stopText

MSG_CANARY_MAN:
.byte   "*Is the answer 4?",newLine
.byte   stopText

MSG_CANARY_MAN_BABY:
.byte   "*What number am",newLine
.byte   " I thinking of?",newLine
.byte   stopText

MSG_CANARY_MAN_BABY_NO:
.byte   "(Heh heh, they don't",newLine
.byte   "know I'm thinking ",newLine
.byte   "of 11... Lol...)",newLine
.byte   pauseText
.byte   "*Hey! I can feel you",newLine
.byte   " in my brain! What do",newLine
.byte   " think you're doing?!",newLine
.byte   pauseText
.byte   "*ARGH!!!!",newLine
.byte   stopText

MSG_CANARY_MAN_BABY_YES:
.byte   "*Hello!",newLine
.byte   " It is me,Nathan R.",newLine
.byte   pauseText
.byte   " (As per the Jank Jam",newLine
.byte   " 2 Rules)",newLine
.byte   pauseText
.byte   "*I was making a Hack,",newLine
.byte   " but the code started",newLine
.byte   " eating everything!",newLine
.byte   pauseText
.byte   "*My chips, my dinner",newLine
.byte   " my House, my home,",newLine
.byte   " my wife",newLine
.byte   pauseText
.byte   "*It became a freak!",newLine
.byte   " Can you kids help me",newLine
.byte   " pacify it?",newLine
.byte   pauseText
.byte   "*I found this flame",newLine
.byte   " lying around. You",newLine
.byte   " need those, right?",newLine
.byte   pauseText
.byte   "*Who am I kidding. I'm",newLine
.byte   " making you get them.",newLine
.byte   " L . O . L .",newLine
.byte   pauseText
.byte   "*Whaddya say?",newLine
.byte   stopText

MSG_CANARY_MAN_MELODY:
.byte   "*Take your time.",newLine
.byte   stopText
MSG_CANARY_MAN_MELODY_NO:
.byte   "*Here it comes!!!",newLine
.byte   stopText
MSG_CANARY_MAN_MELODY_YES:
.byte   "*Nice work.",newLine
.byte   stopText

MSG_GRAVEYARD_PIPPI:
.byte   " Trust your heart.",newLine
.byte   stopText

MSG_PODUNK_PIPPI_BRAVE_YES:
.byte   "*LOOK WHAT THE CAT",newLine
.byte   " DRAGGED IN!",newLine
.byte   " HA HA HA",newLine
.byte   stopText
MSG_PODUNK_PIPPI_BRAVE_NO:
.byte   "*IF YOU TAKE ANOTHER",newLine
.byte   " STEP FORWARD, YOU",newLine
.byte   " WILL BE SMITED",newLine
.byte   stopText
MSG_PODUNK_PIPPI_MEET_YES:
.byte   "*I'VE FOLLOWED YOU",newLine
.byte   " HERE TO END YOUR",newLine
.byte   " LIFE.",newLine
.byte   pauseText
.byte   "*YOU'VE TRIED KILLING",newLine
.byte   " ME MUCH TOO OFTEN.",newLine
.byte   stopText
MSG_PODUNK_PIPPI_MEET_NO:
.byte   "*I THINK IT'S ABOUT",newLine
.byte   " TIME I GET A CHANCE.",newLine
.byte   stopText

MSG_ZOO_GATEMONKEY:
.byte   "*WITNESS THE POWER",newLine
.byte   " OF REINCARNATION!",newLine
.byte   stopText
