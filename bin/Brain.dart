import 'dart:convert';
import 'dart:io';
import 'Stick.dart';
import 'rooms.dart';
import 'functions.dart';

import 'Strings.dart';

class Brain {
  Stick stick = Stick();
  Room currentRoom;

  Brain(this.currentRoom);

  void StickInterface() {
    String input =
        stdin.readLineSync(encoding: Encoding.getByName('utf-8')).toLowerCase();
    if (input == '') {
    } else if (input.substring(0, 1) == 'l') {
      stick.Investigate(currentRoom);
    } else if (input.substring(0, 1) == 'p') {
      stick.PickUp(currentRoom);
      DisplayOptions();
    } else if (input.substring(0, 1) == 'o') {
      var sameRoom = currentRoom;
      currentRoom = stick.Open(currentRoom);
      // Check if still in the same room
      if (sameRoom == currentRoom) {
        DisplayOptions();
      } else {
        EnterRoom();
      }
    } else if (input.substring(0, 1) == 'u') {
      stick.Use(currentRoom);
    } else if (input.substring(0, 1) == 'i') {
      stick.Inventory();
    } else if (input.toLowerCase().substring(0, 1) == 'q' || input == '') {
      Exit();
    }
  }

  void EnterRoom() {
    // Check if explored
    if (!(currentRoom.explored)) {
      print(currentRoom.roomDescriptions['FirstExplore']);
      // Check if room is dark and if flashlight is on
      if (!currentRoom.isLit && stick.isFlashlight) {
        print(sIsFlashlight);
      }
    } else {
      print(currentRoom.roomDescriptions['Explored']);
      if (!currentRoom.isLit && stick.isFlashlight) {
        print(sIsFlashlight);
      }
    }
    // Toggle explored
    currentRoom.explored = true;
    DisplayOptions();
  }

  void Intro() {
    print(ArtTitleScreen);
    Prompt('');
    Prompt(sIntro.split('%').first);
    Prompt(sIntro.split('%').last);
  }
}
