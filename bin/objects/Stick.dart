import '../Strings.dart';
import '../functions.dart';
import 'RoomSeeds.dart';
import 'FamiliarVoice.dart';

class Stick {
  // Keep Score
  int stickScore = 0;
  bool win = false;
  // Familiar Voice
  FamiliarVoice famVoice = FamiliarVoice();

  //Inventory
  List<Items> inventory = [
    Items.KoolAid,
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
  bool canDisturbGargoyle(cRoom) => (isFlashlight &&
      inventory.contains(Items.ChessManual) &&
      balconyRoom.isInvestigated &&
      cRoom == balconyRoom);

  void DisplayScore() {
    print('\t\t{( SCORE [$stickScore] )}');
  }

  void Investigate(Room cRoom) {
    // is Look Around to the user

    // Check if the room is dark and if the flashlight is on
    if (!cRoom.isLit && !isFlashlight) {
      print(sCantSee);
      // Check if already investigated
    } else if (cRoom.isInvestigated) {
      cRoom.displayInvestigateDesc(cRoom.isInvestigated);
      // Leave a message if there are any items yet to be picked up
      if (cRoom.visibleItems.isNotEmpty) {
        print(sItemsAvailable);
      }
      // Else investigate
    } else {
      // On first investigation
      // Reveal items, toggle investigated
      cRoom.displayInvestigateDesc(cRoom.isInvestigated);
      cRoom.toggleInvestigated();

      //Score
      stickScore += 20;

      // Update descriptions
      if (cRoom == firstRoom) {
        cRoom.insertDoorDescription(lobbyRoom, "A door marked 'Lobby'");
      }
      if (cRoom == darkRoom) {
        cRoom.updateRoomInvestigateDesc(
            investigated: cRoom.isInvestigated,
            description: 'It\'s the dark hallway.');
        // Seed chessRoom
        cRoom.seedSpawn(chessRoom, 'The door at the end of the hallway');
      }
    }

    DisplayOptions();
    DisplayScore();
  }

  Room Open(Room cRoom) {
    // Display options
    print(sOpen);
    for (int i = 0; i < cRoom.availableRoomsDescriptions.length; i++) {
      print('\t[${i + 1}] ' + cRoom.availableRoomsDescriptions[i]);
    }
    // Get input
    int input = getIntAnswer(cRoom.availableRooms.length) - 1;

    // Interpret based on room
    // FirstRoom
    if (cRoom == firstRoom &&
        (input) == cRoom.availableRooms.indexOf(lobbyRoom)) {
      if (isTriangle && isSquare && isCircle) {
        cRoom.availableRooms[input].isLocked = false;
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
      if (!cRoom.availableRooms[input].isLocked) {
        return cRoom.availableRooms[input];
      } else {
        print(sOpenSmokeLocked);
        return cRoom;
      }
    }
    // LivingRoom
    if (cRoom == livingRoom &&
        (input) == cRoom.availableRooms.indexOf(balconyRoom)) {
      if (!cRoom.availableRooms[input].isLocked) {
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
            if (!cRoom.availableRooms[input].isLocked) {
              return cRoom.availableRooms[input];
            } else {
              print(sOpenChessRoomLocked);
              return cRoom;
            }
            // If the flashlight is off, return to the same room
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
    // Check if fire or dark
    if (cRoom.isFire) {
      print(sFire);
    } else if (!cRoom.isLit && !isFlashlight) {
      print(sCantSee);
    } else {
      // Check if anything is available to pick up
      if (cRoom.visibleItems.isEmpty) {
        print(sPickUpNothing);
      } else {
        // Remove Cancel item
        inventory.remove(Items.Cancel);
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
    // Append cancel option if needed
    if (!inventory.contains(Items.Cancel)) {
      inventory.add(Items.Cancel);
    }
    // Display inventory
    for (int i = 0; i < inventory.length; i++) {
      print('\t[${i + 1}] ' + inventory[i].toString().split('.').last);
    }
    // Get input
    int input = getIntAnswer(inventory.length) - 1;
    // Interpret according to item
    if (inventory[input] == Items.KoolAid) {
      UseItemFurther(
          cRoom, Items.KoolAid, 'Drink the KoolAid?', DrinkTheKoolAid);
      if (cRoom.whichRoom == Rooms.SmokeRoom && cRoom.isFire) {
        UseItemFurther(
            cRoom,
            Items.KoolAid,
            'Hold up, did you want to try putting out the flame with the KoolAid?',
            PourTheKoolAid);
      }
    } else if (inventory[input] == Items.RubberChicken) {
      if (cRoom.whichRoom == Rooms.Lobby && cRoom.isInvestigated) {
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
        UnlockLobby(Items.Triangle);
      } else {
        print(sNoUse);
      }
    } else if (inventory[input] == Items.Square) {
      if (cRoom.whichRoom == Rooms.FirstRoom) {
        print(sUseSquareCorrect);
        isSquare = true;
        //Score
        stickScore + 10;
        UnlockLobby(Items.Square);
      } else {
        print(sNoUse);
      }
    } else if (inventory[input] == Items.Circle) {
      if (cRoom.whichRoom == Rooms.FirstRoom) {
        print(sUseCircleCorrect);
        isCircle = true;
        //Score
        stickScore += 10;
        UnlockLobby(Items.Circle);
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
      UseItemFurther(
          cRoom, Items.ChessManual, 'Read the index?', ReadChessManual);
    } else if (inventory[input] == Items.Key) {
      if (cRoom.whichRoom == Rooms.LivingRoom && balconyRoom.isLocked) {
        print(sKeyCorrect);
        //Score
        stickScore += 20;
        // Unlock
        cRoom.availableRooms[cRoom.availableRooms.indexOf(balconyRoom)]
            .isLocked = false;
      } else {
        print(sUseKey);
      }
    } else if (inventory[input] == Items.Knob) {
      if (cRoom.whichRoom == Rooms.DarkRoom && isFlashlight) {
        print(sKnobCorrect);
        inventory.remove(Items.Knob);
        // Unlock
        cRoom.availableRooms[cRoom.availableRooms.indexOf(chessRoom)].isLocked =
            false;
        // Score
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
          cRoom.updateRoomInvestigateDesc(
              investigated: cRoom.isInvestigated,
              description: 'It\'s the hall that had the chess board.');
        }
      } else {
        print(sUseNotationBook);
      }
    } else if (inventory[input] == Items.Map) {
      print(sExamineUseMap);
      UseItemFurther(cRoom, Items.Map, 'Look at the map?', UseMap);
    } else if (inventory[input] == Items.Cloth) {
      if (cRoom.whichRoom == Rooms.SecondRoom) {
        print(sUseClothCorrect);
        inventory.remove(Items.Cloth);
        // Unlock
        cRoom.availableRooms[cRoom.availableRooms.indexOf(smokeRoom)].isLocked =
            false;
        // Score
        stickScore += 20;
      } else {
        print(sNoUse);
      }
    }
    DisplayOptions();
    DisplayScore();
  }

  void UseItemFurther(
      Room cRoom, Items item, String description, Function itemFunction) {
    print(description);
    bool answer = getYesNo();
    answer
        ? itemFunction(cRoom)
        : print('You put the ${item.toString().split('.').last} back.');
  }

  void DrinkTheKoolAid(Room cRoom) {
    print(sUseKoolAid);
    DisplayScore();
    Prompt(sGameOver);
    Exit(false);
  }

  void PourTheKoolAid(Room cRoom) {
    // Update descriptions.
    cRoom.updateRoomExploreDesc(
        explored: cRoom.isExplored,
        description: 'It\'s the room that was on fire before.');
    cRoom.updateRoomInvestigateDesc(
        investigated: false,
        description:
            'It looks like a burning cigarette was the source of the fire. There is still a lot of smoke but you can see a notebook in the corner.');
    cRoom.updateRoomInvestigateDesc(
        investigated: true,
        description:
            'It\'s smokey but at least there isn\'t a fire burning anymore.');

    smokeRoom.isFire = false;
    inventory.remove(Items.KoolAid);
    cRoom.isInvestigated = true;
    Prompt(sUseKoolAidCorrect);
    // Score
    stickScore += 100;
  }

  void UseMap(Room cRoom) {
    // Score
    stickScore += 666;
    DisplayMap();
    Prompt('');
  }

  void ReadChessManual(Room cRoom) {
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
      // int chosenIndex = input;
      print(sCommit);
      bool answer = getYesNo();
      if (answer) {
        Prompt('You commit the final continuation of '
            '${ChessManualEntries[input]['Index'].toString().split(',').first} to your memory.');
        // Check if input is correct
        ChessManualEntries[input] == ChessManualEntries[4]
            ? isCorrectContinuation = true
            : isCorrectContinuation = false;
      } else {
        print('...');
      }
    }
  }

  void UnlockLobby(Items item) {
    inventory.remove(item);
    // Update description
    sOpenLobbyLocked =
        'You\'re fairly sure you just need to put the rest of the shapes in place.';
    if (isTriangle && !isSquare && !isCircle) {
      sOpenLobbyLocked = sOpenLobbyLocked +
          '\nThe triangle shape is in there but the slots for a circle and a square are empty.';
    } else if (!isTriangle && isSquare && !isCircle) {
      sOpenLobbyLocked = sOpenLobbyLocked +
          '\nThe square shape is in there but the slots for a circle and a triangle are empty.';
    } else if (!isTriangle && !isSquare && isCircle) {
      sOpenLobbyLocked = sOpenLobbyLocked +
          '\nThe circle shape is in there but the slots for a square and a triangle are empty.';
    } else if (!isTriangle && isSquare && isCircle) {
      sOpenLobbyLocked =
          sOpenLobbyLocked + '\nThe triangle shaped slot is still empty.';
    } else if (isTriangle && !isSquare && isCircle) {
      sOpenLobbyLocked =
          sOpenLobbyLocked + '\nThe square shaped slot is still empty.';
    } else if (isTriangle && isSquare && !isCircle) {
      sOpenLobbyLocked =
          sOpenLobbyLocked + '\nThe circle shaped slot is still empty.';
    } else if (isTriangle && isSquare && isCircle && lobbyRoom.isLocked) {
      // Unlock
      lobbyRoom.isLocked = false;
      // Score
      stickScore += 50;
      print(sOpenLobby);
    }
  }

  void Examine(Room cRoom) {
    // Append cancel option if needed
    if (!inventory.contains(Items.Cancel)) {
      inventory.add(Items.Cancel);
    }
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
      UseItemFurther(cRoom, Items.Map, 'Look at the map?', UseMap);
    }
    DisplayOptions();
    DisplayScore();
  }
}
