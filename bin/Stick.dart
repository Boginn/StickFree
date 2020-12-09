import 'FamiliarVoice.dart';
import 'functions.dart';
import 'rooms.dart';
import 'Strings.dart';

class Stick {
  // Keep Score
  int stickScore = 0;
  bool win = false;
  // Familiar Voice
  FamiliarVoice famVoice = FamiliarVoice();

  //Inventory
  List<Items> inventory = [
    Items.KoolAid,
    Items.Map,
    Items.ChessManual,
    Items.Key
  ];
  // ChessManual
  bool isCorrectContinuation;
  // Flashlight
  bool isFlashlight = false;
  // LobbyLock
  bool isTriangle = false;
  bool isSquare = false;
  bool isCircle = false;
  // Gargoyle
  bool canDisturbGargoyle() => (isFlashlight &&
      inventory.contains(Items.ChessManual) &&
      balconyRoom.investigated);

  void Investigate(Room cRoom) {
    // is Look Around to the user

    // Check if the room is dark and if the flashlight is on
    if (!cRoom.isLit && !isFlashlight) {
      print(sCantSee);
      // Check if already investigated
    } else if (cRoom.investigated) {
      print(cRoom.roomDescriptions['Investigated']);
      // Leave a message if there are any items yet to be picked up
      if (cRoom.visibleItems.isNotEmpty) {
        print(sItemsAvailable);
      }
      // Else investigate
    } else {
      // Reveal items, toggle investigated
      cRoom.toggleInvestigated(cRoom);

      // Interpret based on room
      // FirstRoom
      if (cRoom == firstRoom) {
        // Update room description
        cRoom.sAvailableRooms.replaceRange(0, 1, ["A door marked 'Lobby'"]);
      }
      // ClosetRoom
      if (cRoom == closetRoom) {
        // Update room description in other rooms
        cRoom.availableRooms[cRoom.availableRooms.indexOf(secondRoom)]
            .sAvailableRooms
            .replaceRange(
                secondRoom.availableRooms.indexOf(closetRoom),
                secondRoom.availableRooms.indexOf(closetRoom) + 1,
                ['The door to the closet']);
      }
      // SmokeRoom
      if (cRoom == smokeRoom) {
        // Update room description in other rooms
        cRoom.availableRooms[cRoom.availableRooms.indexOf(secondRoom)]
            .sAvailableRooms
            .replaceRange(
                secondRoom.availableRooms.indexOf(smokeRoom),
                secondRoom.availableRooms.indexOf(smokeRoom) + 1,
                ['The door to the smokey room.']);
      }
      // DarkRoom
      if (cRoom == darkRoom) {
        // Update room description
        cRoom.roomDescriptions['Explored'] = "It\'s the dark hallway.";
        // Update room description in other rooms
        cRoom.availableRooms[cRoom.availableRooms.indexOf(livingRoom)]
            .sAvailableRooms
            .replaceRange(
                livingRoom.availableRooms.indexOf(darkRoom),
                livingRoom.availableRooms.indexOf(darkRoom) + 1,
                ['The door to the dark room']);
        // Seed chessRoom
        darkRoom.availableRooms
            .insert(darkRoom.availableRooms.indexOf(darkRoom), chessRoom);
        darkRoom.sAvailableRooms.insert(
            darkRoom.availableRooms.indexOf(darkRoom) - 1,
            'The door at the end of the hallway');
      }
      // ChessRoom
      if (cRoom == chessRoom) {
        // Update room description in other rooms
        cRoom.availableRooms[cRoom.availableRooms.indexOf(darkRoom)]
            .sAvailableRooms
            .replaceRange(
                firstRoom.availableRooms.indexOf(chessRoom),
                firstRoom.availableRooms.indexOf(chessRoom) + 1,
                ['The door to the chess hall']);
      }
      // LivingRoom
      if (cRoom == livingRoom) {
        // Update room description in other rooms
        cRoom.availableRooms[cRoom.availableRooms.indexOf(firstRoom)]
            .sAvailableRooms
            .replaceRange(
                firstRoom.availableRooms.indexOf(livingRoom),
                firstRoom.availableRooms.indexOf(livingRoom) + 1,
                ['The door to the living room']);
      }
      // SecondRoom
      if (cRoom == secondRoom) {
        // Update room description in other rooms
        cRoom.availableRooms[cRoom.availableRooms.indexOf(firstRoom)]
            .sAvailableRooms
            .replaceRange(
                firstRoom.availableRooms.indexOf(secondRoom),
                firstRoom.availableRooms.indexOf(secondRoom) + 1,
                ['The door to a similar room']);
      }
    }
    //Score
    stickScore += 20;
    DisplayOptions();
    DisplayScore();
  }

  Room Open(Room cRoom) {
    // Display options
    print(sOpen);
    for (int i = 0; i < cRoom.sAvailableRooms.length; i++) {
      print('\t[${i + 1}] ' + cRoom.sAvailableRooms[i]);
    }
    // Get input
    int input = getIntAnswer(cRoom.availableRooms.length) - 1;

    // Interpret based on room
    // FirstRoom
    if (cRoom == firstRoom &&
        (input) == cRoom.availableRooms.indexOf(lobbyRoom)) {
      if (isTriangle && isSquare && isCircle) {
        cRoom.availableRooms[input].locked = false;
        print(sOpenLobby);
        //Score
        stickScore += 100;
        return cRoom.availableRooms[input];
      } else {
        print(sOpenLobbyLocked);
        return cRoom;
      }
    }
    // SecondRoom
    if (cRoom == secondRoom &&
        (input) == cRoom.availableRooms.indexOf(smokeRoom)) {
      if (!cRoom.availableRooms[input].locked) {
        return cRoom.availableRooms[input];
      } else {
        print(sOpenSmokeLocked);
        return cRoom;
      }
    }
    // LivingRoom
    if (cRoom == livingRoom &&
        (input) == cRoom.availableRooms.indexOf(balconyRoom)) {
      if (!cRoom.availableRooms[input].locked) {
        return cRoom.availableRooms[input];
      } else {
        print(sOpenBalconyLocked);
        return cRoom;
      }
    }
    // DarkRoom
    if (cRoom == darkRoom) {
      // isLit procedure
      if (!cRoom.isLit) {
        // Check if trying to go back or staying
        if (input != cRoom.availableRooms.indexOf(darkRoom) &&
            input != cRoom.availableRooms.indexOf(livingRoom)) {
          // If not check if the flashlight is on
          if (isFlashlight) {
            // Check if locked
            if (!cRoom.availableRooms[input].locked) {
              return cRoom.availableRooms[input];
            } else {
              print(sOpenChessRoomLocked);
              return cRoom;
            }
            // If the flashlight is off, return to same room
          } else {
            print(sCantSee);
            return cRoom;
          }
        }
      }
    }
    // LobbyRoom
    if (cRoom == lobbyRoom) {
      if (input == cRoom.availableRooms.indexOf(exitRoom)) {
        print(sCantExit);
        return cRoom;
      }
    }

    return cRoom.availableRooms[input];
  }

  void PickUp(Room cRoom) {
    // Check if dark or fire
    if (cRoom.whichRoom == Rooms.DarkRoom && !isFlashlight) {
      print(sCantSee);
    } else if (cRoom.whichRoom == Rooms.SmokeRoom && cRoom.isFire) {
      print(sFire);
    } else {
      // Check if anything is available to pick up
      if (cRoom.visibleItems.isEmpty) {
        print(sPickUpNothing);
      } else {
        // Display options
        print(sPickUp);
        for (int i = 0; i < cRoom.visibleItems.length; i++) {
          print('\t[${i + 1}] ' +
              cRoom.visibleItems[i].toString().split('.').last);
        }
        // Get input
        int input = getIntAnswer(cRoom.visibleItems.length) - 1;
        // Add to inventory, remove from world
        inventory.add(cRoom.visibleItems[input]);
        print(
            'You put the ${cRoom.visibleItems[input].toString().split('.').last} in your pocket.');
        cRoom.removePickedUpItem(cRoom.visibleItems[input]);
        //Score
        stickScore += 20;
      }
    }
  }

  void Use(Room cRoom) {
    // Display inventory
    for (int i = 0; i < inventory.length; i++) {
      print('\t[${i + 1}] ' + inventory[i].toString().split('.').last);
    }
    // Get input
    int input = getIntAnswer(inventory.length) - 1;
    // Interpret according to item
    if (inventory[input] == Items.KoolAid) {
      UseItemFurther(Items.KoolAid, 'Drink the KoolAid?', DrinkTheKoolAid);
      if (cRoom.whichRoom == Rooms.SmokeRoom && cRoom.isFire) {
        UseItemFurther(
            Items.KoolAid,
            'Hold up, did you want to try putting out the flame with the KoolAid?',
            PourTheKoolAid);
      }
    } else if (inventory[input] == Items.RubberChicken) {
      if (cRoom.whichRoom == Rooms.Lobby && cRoom.investigated) {
        print(sUseRubberChickenCorrect);
        //Score
        stickScore += 50;
        win = true;
      } else {
        print(sNoUse);
      }
    } else if (inventory[input] == Items.Triangle) {
      if (cRoom.whichRoom == Rooms.FirstRoom) {
        print(sUseTriangleCorrect);
        isTriangle = true;
        //Score
        stickScore += 10;
        UnlockLobby();
        inventory.remove(Items.Triangle);
        sOpenLobbyLocked =
            'You\'re fairly sure you just need to put the rest of the shapes in place';
      } else {
        print(sNoUse);
      }
    } else if (inventory[input] == Items.Square) {
      if (cRoom.whichRoom == Rooms.FirstRoom) {
        print(sUseSquareCorrect);
        isSquare = true;
        //Score
        stickScore + 10;
        UnlockLobby();
        inventory.remove(Items.Square);
        sOpenLobbyLocked =
            'You\'re fairly sure you just need to put the rest of the shapes in place';
      } else {
        print(sNoUse);
      }
    } else if (inventory[input] == Items.Circle) {
      if (cRoom.whichRoom == Rooms.FirstRoom) {
        print(sUseCircleCorrect);
        isCircle = true;
        //Score
        stickScore += 10;
        UnlockLobby();
        inventory.remove(Items.Circle);
        sOpenLobbyLocked =
            'You\'re fairly sure you just need to put the rest of the shapes in place';
      } else {
        print(sNoUse);
      }
    } else if (inventory[input] == Items.Flashlight) {
      if (!isFlashlight) {
        print(sUseFlashlightOn);
        isFlashlight = true;
        //Score
        stickScore += 5;
      } else {
        print(sUseFlashlightOff);
        isFlashlight = false;
        //Score
        stickScore -= 20;
      }
    } else if (inventory[input] == Items.ChessManual) {
      print(sUseChessManual);
      UseItemFurther(Items.ChessManual, 'Read the index?', ReadChessManual);
    } else if (inventory[input] == Items.Key) {
      if (cRoom.whichRoom == Rooms.LivingRoom) {
        print(sKeyCorrect);
        //Score
        stickScore += 20;
        // Unlock
        cRoom.availableRooms[cRoom.availableRooms.indexOf(balconyRoom)].locked =
            false;
      } else {
        print(sUseKey);
      }
    } else if (inventory[input] == Items.Knob) {
      if (cRoom.whichRoom == Rooms.DarkRoom && isFlashlight) {
        print(sKnobCorrect);
        inventory.remove(Items.Knob);
        //Score
        stickScore += 20;
        // Unlock
        cRoom.availableRooms[cRoom.availableRooms.indexOf(chessRoom)].locked =
            false;
        //Score
        stickScore += 50;
      } else {
        print(sNoUse);
      }
    } else if (inventory[input] == Items.NotationBook) {
      if (cRoom.whichRoom == Rooms.ChessRoom) {
        if (isCorrectContinuation == null) {
          print(sNoContinuation);
        } else if (!isCorrectContinuation) {
          Prompt(sUseNotationBookAlmostCorrect.split('%').first);
          famVoice.sayRightOrWrong(false);
          //Score
          stickScore -= 50;
          print(sUseNotationBookAlmostCorrect.split('%').last);
        } else {
          Prompt(sUseNotationBookCorrect.split('%').first);
          famVoice.sayRightOrWrong(true);
          //Score
          stickScore += 500;
          print(sUseNotationBookCorrect.split('%').last);
          cRoom.visibleItems.add(Items.Circle);
          // Update room description
          cRoom.roomDescriptions['Investigated'] =
              'It\'s the hall that had the chess board.';
        }
      } else {
        print(sUseNotationBook);
      }
    } else if (inventory[input] == Items.Map) {
      print(sExamineUseMap);
      UseItemFurther(Items.Map, 'Look at the map?', UseMap);
    } else if (inventory[input] == Items.Cloth) {
      if (cRoom.whichRoom == Rooms.SecondRoom) {
        // Unlock
        print(sUseClothCorrect);
        //Score
        stickScore += 20;
        cRoom.availableRooms[cRoom.availableRooms.indexOf(smokeRoom)].locked =
            false;
      } else {
        print(sNoUse);
      }
    }
    DisplayOptions();
    DisplayScore();
  }

  void UseItemFurther(Items item, String description, Function itemFunction) {
    print(description);
    bool answer = getYesNo();
    answer
        ? itemFunction()
        : print('You put the ${item.toString().split('.').last} back.');
  }

  void DrinkTheKoolAid() {
    print(sUseKoolAid);
    DisplayScore();
    Prompt(sGameOver);
    Exit(false);
  }

  void PourTheKoolAid() {
    // Update descriptions. Make Investigate use past tense for the fire.
    smokeRoomDescriptions['Explored'] =
        'It\'s the room that was on fire before.';
    smokeRoomDescriptions['FirstInvestigate'] =
        smokeRoomDescriptions['FirstInvestigate'].replaceRange(34, 35, 'wa');
    smokeRoomDescriptions['FirstInvestigate'] =
        smokeRoomDescriptions['FirstInvestigate']
            .replaceRange(70, 71, ' still ');
    smokeRoomDescriptions['Investigated'] =
        'It\'s smokey but at least there isn\'t a fire burning anymore.';
    smokeRoom.isFire = false;
    inventory.remove(Items.KoolAid);
    Prompt(sUseKoolAidCorrect);
    //Score
    stickScore += 100;
  }

  void UseMap() {
    stickScore += 666;
    DisplayMap();
    Prompt('');
  }

  void ReadChessManual() {
    while (true) {
      // Display Index
      int i = 1;
      for (Map entry in ChessManualEntries) {
        print('\t[0$i] ${entry['Index']}');
        i++;
      }
      print('[0$i] Put the book away.');
      // Get input
      int input = getIntAnswer(ChessManualEntries.length + 1) - 1;
      if (input == i - 1) {
        print('You put the book away.');
        break;
      }
      // Display Content
      print('${ChessManualEntries[input]['Content']}');
      // Ask for commitment
      int chosenIndex = input;
      print(
          'You know how to play chess but you can\'t possibly memorize more than one line at a time.');
      print('Commit the continuation to memory?');

      bool answer = getYesNo();
      if (answer) {
        Prompt('You commit the final continuation of '
            '${ChessManualEntries[chosenIndex]['Index'].toString().split(',').first} to your memory.');
        // Check if input is correct
        ChessManualEntries[chosenIndex] == ChessManualEntries[4]
            ? isCorrectContinuation = true
            : isCorrectContinuation = false;
      } else {
        print('...');
      }
    }
  }

  void UnlockLobby() {
    if (isTriangle && isSquare && isCircle) {
      lobbyRoom.locked = false;
      print(sOpenLobby);
    }
  }

  void Examine(Room cRoom) {
    // Display inventory
    print(sInventory);
    int i = 0;
    for (i; i < inventory.length; i++) {
      print('\t[${i + 1}] ' + inventory[i].toString().split('.').last);
    }

    // Get input
    int input = getIntAnswer(inventory.length) - 1;

    // Interpret according to item
    if (inventory[input] == Items.KoolAid) {
      print(sExamineKoolAid);
    } else if (inventory[input] == Items.RubberChicken) {
      print(sExamineRubberChicken);
    } else if (inventory[input] == Items.Triangle) {
      print(sExamineTriangle);
    } else if (inventory[input] == Items.Square) {
      print(sExamineSquare);
    } else if (inventory[input] == Items.Circle) {
      print(sExamineCircle);
    } else if (inventory[input] == Items.Flashlight) {
      print(sExamineFlashlight);
    } else if (inventory[input] == Items.ChessManual) {
      print(sExamineChessManual);
    } else if (inventory[input] == Items.Key) {
      print(sExamineKey);
    } else if (inventory[input] == Items.Knob) {
      print(sExamineKnob);
    } else if (inventory[input] == Items.NotationBook) {
      print(sExamineNotationBook);
    } else if (inventory[input] == Items.Map) {
      print(sExamineUseMap);
      UseItemFurther(Items.Map, 'Look at the map?', UseMap);
    }
    DisplayOptions();
    DisplayScore();
  }

  void ScoreKeeper(int score) {
    stickScore += score;
  }

  void DisplayScore() {
    print('\t\t{(o SCORE [$stickScore] o)}');
  }
}
