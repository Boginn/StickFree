/*            Displays           */
void DisplayOptions() {
  print('\t[L] Look Around');
  print('\t[P] Pick Up');
  print('\t[O] Open');
  print('\t[U] Use');
  print('\t[I] Inventory');
  print('\t[Q] Quit');
}


/*            Items           */
String sNoUse = 'That has no possible use here!';

String sExamineKoolAid = 'It\'s the kool-aid. Everyone except you consumed their kool-aid.';
String sExamineRubberChicken = 'It\'s a rubber chicken with a pulley in the middle.';
String sExamineTriangle = 'It\'s a perfect triangle.';
String sExamineSquare = 'It\'s a perfect square.';
String sExamineCircle = 'It\'s a perfect circle.';
String sExamineFlashlight = 'Standard issue. Batteries included.';
String sExamineChessManual = 'A book of romantic chess games.';
String sExamineKey = 'It\'s a single key on a chain.';
String sExamineKnob = 'Looks like a doorknob that fell off.';

String sUseFlashlightOn = 'You turn on the flashlight. It works. Sweet.';
String sUseFlashlightOff = 'You turn the flashlight off. Pity.';
String sUseChessManual = 'You open the book on the bookmark. It\'s an index of famous old chess games.';
String sUseKoolAid = 'You drink the kool-aid. Sweet dreams...';
String sUseKey = 'The key doesnt fit in any lock here.';

String sUseRubberChickenCorrect = 'You slap the rubber chicken with a pulley in the middle on the wire and slide to safety';
String sUseTriangleCorrect = '';
String sUseSquareCorrect = '';
String sUseCircleCorrect = '';
String sKeyCorrect = sOpenBalcony;
String sKnobCorrect = 'You fit the knob on the door. Seems to work.';



/*            Actions           */
String sPickUp = 'These are the items you see. What would you like to pick up?';
String sPickUpNothing = 'You don\'t see anything worth picking up.';
String sOpen = 'What would you like to open?';
String sInventory = 'You check your pockets. Select something to examine it.';
String sCancelInventory = 'You stop rummaging in your pockets.';
String sLookAroundNothing = 'You\'ve already had a look at this room. Nothing changed.';

String sYouWin = 'You escaped, you are stick free. The voice is gone from your head.';
String sGameOver = 'Game Over.';


/*            FirstRoom           */
String sDescFirstRoom = "You're in a well lit room. Disturbing paintings line the walls.\nYou note that there are three doors.";
String sDescFirstRoomExplored = "You\'re back in the first room.";
String sLookAroundFirstRoom = "Besides the art and three doors there is a rubber chicken with a pulley in the middle lying on the floor. \nOne of doors has sign above it that says 'Lobby'.";

String sOpenLobby = 'You insert the ITEMS into their slots and the door opens.';
String sOpenLobbyLocked = 'The door is locked. You see three slots of some sort edged in the door.';

/*            Lobby           */
String sDescLobbyRoom = 'You are in the lobby. The door out is open.';
String sDescLobbyRoomExplored = 'It\'s the lobby.';
String sLookAroundLobby = 'Past the door is a chasm. It would seem you are very high up. There is a wire hanging from the door that goes down to the ground.';

/*            SecondRoom           */
String sDescSecondRoom = 'You enter another room. It looks pretty much the same as the one you woke up in.';
String sDescSecondRoomExplored = 'It\'s the second room that looks like the first room.';
String sLookAroundSecondRoom = 'You spot a single key on a chain next to a triangle shaped... triangle. There is also another door to the left.';

/*            ClosetRoom           */
String sDescClosetRoom = "It's a poorly ventilated and very small closet.";
String sDescClosetRoomExplored = "It's still a poorly ventilated and very small closet.";
String sLookAroundClosetRoom = 'There is nothing in here except a table with a flashlight lying on top of it.';

/*            LivingRoom           */
String sDescLivingRoom = "This must be the living room. There is a fireplace burning and comfy furniture. There's another door to the right and a door to the balcony.";
String sDescLivingRoomExplored = 'You\'re back in the living room.';
String sLookAroundLivingRoom = 'You look around and notice a book on a table.';

String sOpenBalcony = 'The key fits. You open the door.';
String sOpenBalconyLocked  = "It's locked.";

/*            DarkRoom           */
String sDescDarkRoom = 'You step into darkness.';
String sDescDarkRoomExplored = "It\'s inky black.";
String sDescDarkRoomExploredLight = "It\'s inky black.";
String sLookAroundDarkRoom = "It's dark. You can\'t see a thing.";
String sLookAroundDarkRoomLight = 'Now that the flashlight is on you can see that you are in a hallway. There is a door at the end of the hallway.';

/*            BalconyRoom           */
String sDescBalconyRoom = "You step onto the balcony. The view isn\'t much since the sun is down but you get a sense that you're far above see level.";
String sDescBalconyRoomExplored = 'You\'re back on the balcony';
String sLookAroundBalconyRoom = "There\'s a square on the balcony. Literally.";

/*            ChessRoom           */
String sDescChessRoom = 'You enter a large hall featuring an over sized chess board.';
String sDescChessRoomExplored = "It\'s the hall with the chess board.";
String sLookAroundChessRoom = 'You look at the position of the chess pieces.';


/*            Art           */
String ArtTitleScreen = "\n"
    "                                                        "
"\n      @@@%     *@@,                  *@     @(    @@"
"\n      @(  @@ @@@   @@                 @@     @@   (@"
"\n     @@       *%   @@             @@@, @@@@@@@@@ %@@"
"\n     @@@   @@@( @@@               (@(  @     @@@@"
"\n    @@@@@@@@@@@@@@@@@@@            @(  @     @."
"\n    @@@@@@@@@@@@  @@@@@          @@      @ @."
"\n     @@@@@@-O-@@@@@@@@@    (@@@@@@@@@@@@@@@@@(@@@@@@@@("
"\n      %%%%%%@@             (@@,,,,,,,,,,,,,,,@@@,@    *@("
"\n         @@                (@@                  (@  @, @@"
"\n       @@@@@@              (@@@)@@@@@@@@@@@      @( ,@  @"
"\n      @  @@  @             (@@@ K O O L @@@@     @   (@ (@"
"\n      @  @@   @            (@@@@@@  A I D @@@    @   (@ %@"
"\n      @  @@    @           (@@@@@@@@@@@@@(@@@@   @   (@  @"
"\n         @@                (@@                   @   @   @"
"\n         @@                (@@                  @ @@(  @@"
"\n        @  @               (@@@@@@@@@@@@@@@@@@@@@@  ,,@@%"
"\n       @@   @@             (((((((((((((((((((((()@("
"\n                           (@@@@@@@@@@@@@@@@@@@@@@"
"\n                                                  "
;
