import 'dart:io';
import 'dart:convert';

import 'functions.dart';
import 'rooms.dart';
import 'Strings.dart';

class Stick {
  bool isFlashlight = false;
  List<Items> inventory = [Items.KoolAid];
  final Rooms currentRoom;

  Stick({this.currentRoom});

  void LookAround(Room cRoom) {
    // Check if already explored
    if(cRoom.explored) {
      print(sLookAroundNothing);
    } else {
    // Reveal items
    cRoom.addVisible();
    cRoom.explored = true;
    print(cRoom.sRoomLookAround);
    // FirstRoom
    if (cRoom == firstRoom) {
      // Update room description.
      // See rooms.dart
      cRoom.sVisibleRooms.replaceRange(0, 1, ["A door marked 'Lobby'"]);
    }
    // ClosetRoom
    if (cRoom == closetRoom) {
      // Update room description. 0 = closetRoom
      // See rooms.dart
      cRoom.visibleRooms[0].sVisibleRooms.replaceRange(0, 1, ['The door to the closet']);
    }
    // DarkRoom
    if (cRoom == darkRoom) {
        // Update room description. 0 = livingRoom
      // See rooms.dart
      cRoom.visibleRooms[0].sVisibleRooms.replaceRange(2, 3, ['The door to the dark room']);
      if (isFlashlight) {
        print(sLookAroundDarkRoomLight);
      } else {
        print(sLookAroundDarkRoom);
      }
    }
    // ChessRoom
    if (cRoom == chessRoom) {
      // Update room description. 0 = darkRoom
      // See rooms.dart
      cRoom.visibleRooms[0].sVisibleRooms.replaceRange(1, 2, ['The door to the chess hall']);
    }
      // LivingRoom
      if (cRoom == livingRoom) {
        // Update room description. 1 = firstRoom
        // See rooms.dart
        cRoom.visibleRooms[1].sVisibleRooms.replaceRange(2, 3, ['The door to the living room']);
      }
    }
  }



  void Inventory() {
    // Display inventory
    print(sInventory);
    for (int i = 0; i < inventory.length; i++) {
      print('[${i + 1}] ' + inventory[i].toString().split('.').last);
    }
    // Get input
    int input = getIntAnswer(inventory.length)-1;
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
    }
  }

  void PickUp(Room cRoom) {
    // Check if anything is available to pick up
    if (cRoom.visibleItems.isEmpty) {
      print(sPickUpNothing);
    } else {
      // Display options
      print(sPickUp);
      for (int i = 0; i < cRoom.visibleItems.length; i++) {
        print('[${i + 1}] ' + cRoom.visibleItems[i].toString().split('.').last);
      }
      // Get input
      int input = getIntAnswer(cRoom.visibleItems.length)-1;
      // Add to inventory, remove from world
      inventory.add(cRoom.visibleItems[input]);
      print('You put the ${cRoom.visibleItems[input]
          .toString()
          .split('.')
          .last} in your pocket.');
      cRoom.removeVisible(cRoom.visibleItems[input]);
    }
  }

  Room Open(cRoom) {
    // er að dubble tjekka, láta use vera nóg

    // Display options
    print(sOpen);
    for (int i = 0; i < cRoom.sVisibleRooms.length; i++) {
      print('[${i + 1}] ' + cRoom.sVisibleRooms[i]);
    }
    // Get input
    int input = getIntAnswer(cRoom.visibleRooms.length)-1;
    // Interpret
    // [0]lobby, [1]secondRoom [2]livingRoom
    if (cRoom == firstRoom && (input) == 0) {
      if (inventory.contains(Items.Triangle) &&
          inventory.contains(Items.Square) &&
          inventory.contains(Items.Circle)) {
        print(sOpenLobby);
        return cRoom.visibleRooms[input]; //?
      } else {
        print(sOpenLobbyLocked);
        return cRoom;
      }
    }

    // [0]balconyRoom, [1]firstRoom [2]darkRoom
    if (cRoom == livingRoom && (input) == 0) {
      if (!cRoom.visibleRooms[input].locked) {
        return cRoom.visibleRooms[input];
      } else {
        print(sOpenBalconyLocked);
        return cRoom;
      }
    }

    return cRoom.visibleRooms[input];
  }

  void Use(Room cRoom) {
    // Display inventory
    for (int i = 0; i < inventory.length; i++) {
      print('[${i + 1}] ' + inventory[i].toString().split('.').last);
    }
    // Get input
    int input = getIntAnswer(inventory.length)-1;
    // Interpret according to item
    if (inventory[input] == Items.KoolAid) {
      DrinkTheKoolAid();
    } else if (inventory[input] == Items.RubberChicken) {
      if (currentRoom == Rooms.Lobby) {
        print(sUseRubberChickenCorrect);
      } else {
        print(sNoUse);
      }
    } else if (inventory[input] == Items.Triangle) {
      if (currentRoom == Rooms.FirstRoom) {
        print(sUseTriangleCorrect);
      } else {
        print(sNoUse);
      }
    } else if (inventory[input] == Items.Square) {
      if (currentRoom == Rooms.FirstRoom) {
        print(sUseSquareCorrect);
      } else {
        print(sNoUse);
      }
    } else if (inventory[input] == Items.Circle) {
      if (currentRoom == Rooms.FirstRoom) {
        print(sUseCircleCorrect);
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
      // Chess
    } else if (inventory[input] == Items.Key) {
      if (currentRoom == Rooms.LivingRoom) {
        print(sKeyCorrect);
        // Unlock balconyRoom(=0)
        cRoom.visibleRooms[0].locked = false;
      } else {
        print(sUseKey);
      }
    } else if (inventory[input] == Items.Knob) {
      if (currentRoom == Rooms.DarkRoom) {
        print(sKnobCorrect);
        // Unlock chessRoom(=1)
        cRoom.visibleRooms[1].locked = false;
      } else {
        print(sNoUse);
      }
    }
  }

  void DrinkTheKoolAid() {
    bool asking = true;
    print('Are you going to drink the kool-aid?');
    print('[Y/N]');
    while(asking) {

    String input = stdin.readLineSync(encoding: Encoding.getByName('utf-8')).toLowerCase().substring(0, 1);
    if (input == 'y') {
    print(sUseKoolAid);
    print(sGameOver);
    Prompt();
    Exit();
    } else if (input == 'n') {
      print('You put the kool-aid back.');
      DisplayOptions();
      asking = false;
    }
    }
  }
}
