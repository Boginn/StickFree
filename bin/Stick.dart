import 'dart:io';
import 'dart:convert';

import 'functions.dart';
import 'rooms.dart';
import 'Strings.dart';

class Stick {
  List<Items> inventory = [Items.KoolAid, Items.Flashlight];
  // ChessManual
  bool isCorrectContinuation;
  // Flashlight
  bool isFlashlight = false;
  // LobbyLock
  bool isTriangle = false;
  bool isSquare = false;
  bool isCircle = false;

  void Investigate(Room cRoom) {
    // is Look Around to the user

    // Check if the room is dark and if the flashlight is on
    if (!cRoom.isLit && !isFlashlight) {
      print(sCantSee);
      // Check if already investigated
    } else if (cRoom.investigated) {
      print(cRoom.roomDescriptions['Investigated']);
      // Leave a message if there are any items yet to be picked up
      if (!cRoom.visibleItems.isEmpty) {
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
        print(darkRoom.availableRooms);
      }
      // ChessRoom
      if (cRoom == chessRoom) {
        // Update room description in other rooms
        cRoom.availableRooms[cRoom.availableRooms.indexOf(darkRoom)]
            .sAvailableRooms
            .replaceRange(2, 3, ['The door to the chess hall']);
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
    DisplayOptions();
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
        return cRoom.availableRooms[input];
      } else {
        print(sOpenLobbyLocked);
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
      if (input == cRoom.availableRooms.indexOf(chessRoom)) {
        if (isFlashlight) {
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
    } else if (cRoom.whichRoom == Rooms.SmokeRoom && cRoom.onFire) {
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

        // Update descriptions.
        if (cRoom.whichRoom == Rooms.LivingRoom) {
          cRoom.roomDescriptions['Investigated'] =
              'There are three doors. One goes to the balcony.';
        }
        if (cRoom.whichRoom == Rooms.FirstRoom) {
          cRoom.roomDescriptions['Investigated'] =
              'It\'s the room you woke up in. There are three doors.';
        }
        if (cRoom.whichRoom == Rooms.ChessRoom) {
          cRoom.roomDescriptions['Investigated'] =
              'It\'s the hall that had the chess board.';
        }
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
      if (cRoom.whichRoom == Rooms.SmokeRoom) {
        UseItemFurther(
            Items.KoolAid,
            'Hold up, did you want to try putting out the flame with the KoolAid?',
            PourTheKoolAid);
      }
    } else if (inventory[input] == Items.RubberChicken) {
      if (cRoom.whichRoom == Rooms.Lobby) {
        print(sUseRubberChickenCorrect);
      } else {
        print(sNoUse);
      }
    } else if (inventory[input] == Items.Triangle) {
      if (cRoom.whichRoom == Rooms.FirstRoom) {
        print(sUseTriangleCorrect);
        isTriangle = true;
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
      } else {
        print(sUseFlashlightOff);
        isFlashlight = false;
      }
    } else if (inventory[input] == Items.ChessManual) {
      print(sUseChessManual);
      UseItemFurther(Items.ChessManual, 'Read the index?', ReadChessManual);
    } else if (inventory[input] == Items.Key) {
      if (cRoom.whichRoom == Rooms.LivingRoom) {
        print(sKeyCorrect);
        // Unlock balconyRoom(=0)
        cRoom.availableRooms[cRoom.availableRooms.indexOf(balconyRoom)].locked =
            false;
      } else {
        print(sUseKey);
      }
    } else if (inventory[input] == Items.Knob) {
      if (cRoom.whichRoom == Rooms.DarkRoom && isFlashlight) {
        print(sKnobCorrect);
        inventory.remove(Items.Knob);
        // Unlock chessRoom(=1)
        cRoom.availableRooms[cRoom.availableRooms.indexOf(chessRoom)].locked =
            false;
      } else {
        print(sNoUse);
      }
    } else if (inventory[input] == Items.NotationBook) {
      if (cRoom.whichRoom == Rooms.ChessRoom) {
        if (isCorrectContinuation == null) {
          print(sNoContinuation);
        } else if (!isCorrectContinuation) {
          Prompt(sUseNotationBookAlmostCorrect.split('%').first);
          print(sUseNotationBookAlmostCorrect.split('%').last);
        } else {
          Prompt(sUseNotationBookCorrect.split('%').first);
          print(sUseNotationBookCorrect.split('%').last);
          cRoom.visibleItems.add(Items.Circle);
          cRoom.roomDescriptions['Investigated'] =
              'There\'s a circle shaped circle on the floor.';
        }
      } else {
        print(sUseNotationBook);
      }
    }
    DisplayOptions();
  }

  void UseItemFurther(Items item, String description, Function itemFunction) {
    print(description);
    print('\t[Y/N]');
    while (true) {
      var input = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
      // Error Handling: cannot substring null
      if (input == '') {
        print('You put the ${item.toString().split('.').last} back.');
        break;
      }
      if (input.toLowerCase().substring(0, 1) == 'y') {
        itemFunction();
        break;
      } else if (input == 'n') {
        print('You put the ${item.toString().split('.').last} back.');
        break;
      }
    }
  }

  void DrinkTheKoolAid() {
    print(sUseKoolAid);
    Prompt(sGameOver);
    Exit();
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
    smokeRoom.onFire = false;
    inventory.remove(Items.KoolAid);
    Prompt(sUseKoolAidCorrect);
  }

  void UnlockLobby() {
    if (isTriangle && isSquare && isCircle) {
      lobbyRoom.locked = false;
      print(sOpenLobby);
    }
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

      while (true) {
        print('\t[Y/N]');
        var input = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
        // Error Handling: cannot substring null
        if (input == '') {
          print('...');
          break;
        }
        if (input.toLowerCase().substring(0, 1) == 'y') {
          print(
              'You commit the final continuation of ${ChessManualEntries[chosenIndex]['Index'].toString().split(',').first} to your memory.');
          Prompt('');
          if (ChessManualEntries[chosenIndex] == ChessManualEntries[4]) {
            isCorrectContinuation = true;
          } else {
            isCorrectContinuation = false;
          }
          break;
        } else if (input == 'n') {
          break;
        }
      }
    }
  }

  void Inventory() {
    // Display inventory
    print(sInventory);
    for (int i = 0; i < inventory.length; i++) {
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
    }
    DisplayOptions();
  }
}
