/*            Display           */
String sTitleScreen = "\n"
    "                                                        "
    "\n         |                           *@     @(    @@"
    "\n         |     STICK                  @@     @@   (@"
    "\n         |        FREE            @@@, @@@@@@@@@ %@@"
    "\n         O                        (@(  @     @@@@"
    "\n                                   @(  @     @."
    "\n       @%%%%@                    @@      @ @."
    "\n      @  O O @             (@@@@@@@@@@@@@@@@@(@@@@@@@@("
    "\n       @  o @              (@@,,,,,,,,,,,,,,,@@@,@    *@("
    "\n         @@                (@@                  (@  @, @@"
    "\n       @@%%@@              (@@@)@@@@@@@@@@@      @( ,@  @"
    "\n      @  @%  @             (@@@ K O O L @@@@     @   (@ (@"
    "\n      @  %@   @            (@@@@@@  A I D @@@    @   (@ %@"
    "\n      @  @%    @           (@@@@@@@@@@@@@(@@@@   @   (@  @"
    "\n         %@                (@@                   @   @   @"
    "\n         @@                (@@                  @ @@(  @@"
    "\n        @  @               (@@@@@@@@@@@@@@@@@@@@@@  ,,@@%"
    "\n       @@   @@             (((((((((((((((((((((()@("
    "\n                           (@@@@@@@@@@@@@@@@@@@@@@"
    "\n                                              "
    "\n  (c) Finnbogi Jökull Pétursson               ";

void DisplayOptionsDefault() {
  print('\t[L] Look Around\t\t\t[O] Open');
  print('\t[P] Pick Up\t\t\t[U] Use');
  print('\t[E] Examine\t\t\t[Q] Quit');
}

void DisplayOptionsAlt() {
  print('\t[1] Look Around\t\t\t[2] Open');
  print('\t[3] Pick Up\t\t\t[4] Use');
  print('\t[E] Examine\t\t\t[Q] Quit');
}

void DisplayYesNo() {
  print('\t[Y/N]');
}

void DisplayMap() {
  print("\n         +-------+"
      "\n         |       |             +----+                  +-------------+"
      "\n         |       |             |    |                  |             |"
      "\n         |       |             |    |                  |             |"
      "\n         +---^^--+             +-^^-+                  +---^^--------+"
      "\n    +--+ +---vv------------+ +---vv---------------+ +------vv---------+"
      "\n    |  <->                 | |                    | |                 |"
      "\n    +----|                 <->   I woke up        <->                 |"
      "\n    |                      | |         here?      | |              + +|"
      "\n    +-K------------O------+ +---O------------L---+ |             +   |"
      "\n     +-------------------+                          |              + +|"
      "\n     |   +___________+   |                          |        +++      |"
      "\n     |   |__|__|__|__|   <--I--M--M--O--R--T--A--L-->        +++      |"
      "\n     |   |__|__|__|__|   <-------------------------->                 |"
      "\n     |   |__|__|__|__|   |                          +-----------------+"
      "\n     |   |__|__|__|__|   |  "
      "\n     |   +¯¯¯¯¯¯¯¯¯¯¯+   |"
      "\n     +--A------I------D--+");
}

/*            Actions           */
String sPickUp = 'What would you like to pick up?';
String sPickUpNothing = 'You don\'t see anything worth picking up.';
String sOpen = 'What would you like to open?';
String sInventory = 'You check your pockets. Select something to examine it.';
String sCommit =
    'You know how to play chess but you can\'t possibly memorize more than one line at a time.\nCommit the continuation to memory?';

String sCantSee = 'You can\'t see what you\'re doing.';
String sCantExit = 'It\'s further down than you can see. Better not jump.';
String sFire = 'You can\'t, there\'s a fire!';

String sYouWin =
    'You escaped, you are stick free. The voice is gone from your head.';
String sGameOver = 'Game Over.';
String sExtraLife =
    'Losing all your progress can be frustrating. You are not immortal but you\'ve been granted an extra life should you decide to take it.\nBe careful now, you won\'t get another chance.';
String sAcceptRes = 'Accept resurrection?';

/*            Items           */
/*Examine*/
String sExamineKoolAid =
    'It\'s the kool-aid. Everyone consumed their kool-aid except you.';
String sExamineRubberChicken =
    'It\'s a rubber chicken with a pulley in the middle. Hmm.';
String sExamineTriangle = 'It\'s a perfect triangle.';
String sExamineSquare = 'It\'s a perfect square.';
String sExamineCircle = 'It\'s a perfect circle.';
String sExamineFlashlight = 'Standard issue. Batteries included.';
String sExamineChessManual =
    'A book of romantic chess games. You could try reading it.';
String sExamineKey = 'It\'s a single key on a chain.';
String sExamineKnob = 'Looks like a doorknob that fell off.';
String sExamineNotationBook =
    'It is a high quality book used to jot down chess games. A pen is handily attached.\nThe first two lines read: 20. Ke2 Na6, 21. Nxg7+ Kd8. The rest of the book is empty.';
String sExamineUseMap = 'It\'s a map of this place.';
String sExamineCloth =
    'It\'s a piece of cloth. Could keep the heat at bay during hard times.';

/*Use*/
String sNoUse = 'That has no possible use here!';
String sItemsAvailable =
    'There might be something around here you could pick up and use.';

String sUseKoolAid = 'You drink the KoolAid. Sweet dreams...';
String sUseKoolAidCorrect =
    'You pour the KoolAid on the fire patch. Flames be doused, you\'ve done it!';

String sIsFlashlight =
    'Good thing your flashlight is turned on so you can look around.';
String sUseFlashlightOn = 'You turn on the flashlight. It works. Sweet.';
String sUseFlashlightOff = 'You turn the flashlight off. Pity.';

String sUseKey = 'The key doesn\'t fit in any lock here.';
String sKeyCorrect = 'The key fits in the balcony door. It unlocks.';

String sUseChessManual =
    'You open the book on the bookmark. It\'s an index of famous old chess games.';

String sNoContinuation =
    'I would\'nt know what to write, I don\'t have any chess games memorized!';
String sUseNotationBook =
    '$sExamineNotationBook\nYou try to write to the notebook with the pen but nothing happens. Nothing appears on the page.';
String sUseNotationBookAlmostCorrect =
    'As you begin to write down the continuation from your memory, the voice in your head bellows loudly:%Whatever you wrote in the book is erased.';
String sUseNotationBookCorrect =
    'As you write down the continuation from your memory, the pieces on the over sized chess board move in correspondence and the voice in your head speaks:% With the final move annotated the chess board disappears, as if it was a hologram, leaving a circle shaped circle on the floor.';

String sUseRubberChickenCorrect =
    'You slap the rubber chicken with a pulley in the middle on the wire and slide to safety.';

String sUseTriangleCorrect = 'You insert the triangle into the triangle shape.';

String sUseSquareCorrect = 'You insert the square into the square shape.';

String sUseCircleCorrect = 'You insert the circle into the circle shape.';

String sKnobCorrect = 'You fit the knob on the door. Seems to work.';

String sUseClothCorrect =
    'You wrap the cloth around the burning hot doorknob.\nYou should be able to open it now.';

/*            FirstRoom           */
Map firstRoomDescriptions = {
  'FirstExplore':
      'You get up in a well lit room. Disturbing paintings line the walls. One of them depicts a stick figure at the bottom of a hill and a huge rolling black ball at the top of it.\nYou note that there are three doors.',
  'Explored': "You\'re back in the room you woke up in.",
  'FirstInvestigate':
      "Besides the art and three doors there is a rubber chicken with a pulley in the middle lying on the floor. \nOne of doors has sign above it that says 'Lobby'.",
  'Investigated': 'It\'s the room you woke up in. There are three doors.',
};
String sOpenLobby = 'The door to the lobby unlocks!';
String sOpenLobbyLocked =
    'The door, marked \'Lobby\',is locked. You see three slots edged in the door. They are triangle, square and circle shaped.\nIt would remind you of your childhood puzzles if you could remember your childhood...';

/*            Lobby           */
Map lobbyRoomDescriptions = {
  'FirstExplore':
      'You step into what is supposedly the lobby. It\'s an empty room besides the open door on the opposite wall.',
  'Explored': 'It\'s the lobby.',
  'FirstInvestigate':
      'Past the open door is a chasm. It would seem you are very high up. There is a wire hanging from the door that goes down to the ground.',
  'Investigated':
      'There is a chasm before you and a wire hanging from the door. Perhaps you could slide to the other side?',
};

/*            SecondRoom           */
Map secondRoomDescriptions = {
  'FirstExplore':
      'You enter a room. It looks pretty much the same as the one you woke up in.',
  'Explored':
      'It\'s the room that looks very similar to the room you woke up in.',
  'FirstInvestigate':
      'You spot a single key on a chain next to a triangle shaped... triangle.\nThere are three doors in this room including the one you came through.',
  'Investigated': 'There are three doors.',
};
String sOpenSmokeLocked =
    'Ouch! The doorknob is burning hot. If only you had mittens to protect your stick hands.';

/*            SmokeRoom           */
Map smokeRoomDescriptions = {
  'FirstExplore':
      'Oh no! There\'s a small fire patch in the middle of the room!',
  'Explored': 'It\'s the room with the fire. It\'s slowly burning.',
  'FirstInvestigate':
      'It looks like a burning cigarette is the source of the fire. There is a lot of smoke but you can see a notebook in the corner.',
  'Investigated': 'There\'s a fire burning!',
};

/*            ClosetRoom           */
Map closetRoomDescriptions = {
  'FirstExplore': "It's a poorly ventilated and very small closet.",
  'Explored': "It's still a poorly ventilated and very small closet.",
  'FirstInvestigate':
      'There is nothing in here except a table with a flashlight lying on top of it.',
  'Investigated': 'It\'s probably a flashlight storage.',
};

/*            LivingRoom           */
Map livingRoomDescriptions = {
  'FirstExplore':
      "This must be the living room. There is comfy, but regal, furniture surrounding a burning fireplace.\nThere's another door to the right and a door to the balcony.",
  'Explored': 'You\'re back in the living room.',
  'FirstInvestigate': 'You notice an interesting book on a table.',
  'Investigated': 'There are three doors. One goes to the balcony.',
};
String sOpenBalconyLocked = "It's locked.";

/*            DarkRoom           */
Map darkRoomDescriptions = {
  'FirstExplore': 'You step into darkness.',
  'Explored': "It\'s the dark room.",
  'FirstInvestigate':
      'Since the flashlight is on you can see that you are in a hallway. There is a door at the end of the hallway.',
  'Investigated': 'There\'s nothing in this inky black room except the doors.',
};
String sOpenChessRoomLocked = 'The door doesn\'t even have a doorknob.';

/*            BalconyRoom           */
Map balconyRoomDescriptions = {
  'FirstExplore':
      "You step onto the balcony. It features a mighty gargoyle statue.\nThe view isn\'t much since the sun is down but you get a sense that you're far above sea level.",
  'Explored': 'You\'re back on the balcony',
  'FirstInvestigate':
      "There\'s a square on the balcony. Literally. Also there's a knob.",
  'Investigated':
      'It\'s exactly the kind of balcony where you would find squares and knobs, actually.',
};
String sGargoyleMeet =
    'Suddenly you hear a noise and the mighty gargoyle statue looks at you.';
List<String> sGargAnswers = [
  sGargAskAbout,
  sGargAskChess,
  sGargAskForSomething,
  sGargAskStop
];
String sGargAskAbout = 'What is this place?';
String sGargAskChess = 'What should I learn from this ChessManual?';
String sGargAskForSomething = 'Can I have something?';
String sGargAskStop = 'Never mind. I will go now.';

/*            ChessRoom           */
Map chessRoomDescriptions = {
  'FirstExplore':
      'The doorknob does the trick, it opens the door.\nYou enter a large hall featuring an over sized chess board.',
  'Explored': 'You are in the hall with the chess board.',
  'FirstInvestigate':
      'The chess pieces are about the height of yourself. The room has a loud echo. A groovy piece of cloth is just lying there. Glistening.',
  'Investigated':
      'It\'s the hall with the over sized chess board. The echo is overbearing.',
};

/*            NPC Voice lines           */
// => NPC says: “ “
// Familiar Voice
String sFamRight = 'Yes, become IMMORTAL!';
String sFamWrong = 'Wrong, MORTAL!';
String sFamIntroduceA = 'Why are you running? Don\'t you want to be immortal?.';
String sFamIntroduceB =
    'There is no point in trying to escape... but I suppose it could be a fun game.';
String sFamIntroduceC =
    'When you realize your efforts are futile, just reach into your pocket, drink the kool-aid and claim your IMMORTALITY!';

// Gargoyle
String sGargIntroduce =
    'Oof, you there. The stick with the flashlight. Turn that off immediately and go away, I\'m trying to sleep.';
String sGargChess =
    'If you can\'t even remember the continuation for the immortal game itself then just copy it from the chess manual and write it down in the notation book.\nCertainly don\'t do it here. Go away.';
String sGargAbout =
    'It\'s a fancy place. It used to have plenty patrons. These days it only sees the infrequent square or a knob come by.\nI thought we would reach capacity with this whole immortality business but it seems like it\'s the opposite!';
String sGargMap =
    'Okay. You can have this map.%The gargoyle hands you a map. You put it in your pocket.';
String sGargKoolAid = 'I do have way too much KoolAid. Here you go.';
String sKoolAidYesNo =
    'The gargoyle hands you some KoolAid. You put it in your pocket.%Oh you already have some KoolAid there. I suppose you would\'nt be here if you\'d have gulped it...';
String sGargGreeting = 'What?';
String sGargTurnItOff = 'Really dude. Please turn that off.';
String sGargTurnItOffAgain = 'Don\'t make me ask you again. Turn off the flash';
String sGargLastChance =
    'If you say no one more time that is it!\nI will end our friendship on the saddest terms.\nChoose wisely.';
String sGargNotFriends = 'We\'re not friends. I have nothing to say to you.';

/*            ChessManual           */
List<Map> ChessManualEntries = [
  ChessManualEntry01,
  ChessManualEntry02,
  ChessManualEntry03,
  ChessManualEntry04,
  ChessManualEntry05,
  ChessManualEntry06,
];
Map ChessManualEntry01 = {
  'Index': 'Mikhail Botvinnik vs. José Raul Capablanca, Rotterdam 1938',
  'Content':
      'This game was played in a tournament in 1938, featuring the strongest chess players of the time. \n...37. Kh4 Qe4+ \n38. Kxh5 Qe2+ \n39. Kh4 Qe4+ \n40. g4 Qe1+ \n41. Kh5'
};
Map ChessManualEntry02 = {
  'Index': 'Gersz Rotlewi vs. Akiba Rubinstein, Lodz 1907',
  'Content':
      'It features a brilliant queen and rook sacrifice by Rubinstein to force mate. \n...23. gxh4 Rd2!!, \n24. Qxd2 Bxe4+ \n25. Qg2 Rh3!'
};
Map ChessManualEntry03 = {
  'Index': 'Adolf Anderssen vs. Jean Dufresne, 1852 (The EVERGREEN Game)',
  'Content':
      'An informal game. Although defensive resources for Black have since been found, Anderssen\'s combination with the White pieces remains much admired. \n...20. Rxe7+! Nxe7?, \n21. Qxd7+!! Kxd7, \n22. Bf5+ Ke8, \n23. Bd7+ Kf8, \n24. Bxe7#'
};
Map ChessManualEntry04 = {
  'Index': 'Paul Morphy vs. Duke Karl/Count Isouard, Paris 1858',
  'Content':
      'What chess player can fail to smile at \n...10.Nxb5!, \n13.Rxd7!, \n16.Qb8+!!?'
};
Map ChessManualEntry05 = {
  'Index': 'Adolf Anderssen vs. Lionel Kieseritzky, 1851 (The IMMORTAL Game)',
  'Content':
      'White sacrificed a queen, two rooks and a bishop to mate Black with only three pieces - a masterpiece by Anderssen and one of the most famous chess games of all time. \n...20. Ke2 Na6, \n21. Nxg7+ Kd8, \n22. Qf6+! Nxf6, \n23. Be7#'
};
Map ChessManualEntry06 = {
  'Index': 'McDonnell vs. La Bourdonnais, 1834',
  'Content':
      'This was a rare occasion where a defensive game is celebrated as brilliancy. Euwe demonstrates an excellent counter-attack. Max Euwe\'s prize-winning effort against Geller from the famous Zurich 1953 tournament has more than stood the test of time. \n...32. Qc4 Qe1! \n33. Rc1 d2 \n34. Qc5 Rg8 \n35. Rd1 e3, \n36. Qc3 Qxd1! \n37. Rxd1 e2'
};
