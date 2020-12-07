


import 'dart:convert';
import 'dart:io';
import 'Stick.dart';
import 'rooms.dart';
import 'functions.dart';

import 'Strings.dart';

class Brain {

  Stick stick = Stick();
  Room currentRoom;




  Brain (this.currentRoom);



  void StickInterface() {
    String input = stdin.readLineSync(encoding: Encoding.getByName('utf-8')).toLowerCase();
    if (input == '') {
    } else if (input.substring(0, 1) == 'l') {
      stick.LookAround(currentRoom);
    } else if (input.substring(0, 1) == 'p') {
      stick.PickUp(currentRoom);
      DisplayOptions();
    } else if (input.substring(0, 1) == 'o') {
      var sameRoom = currentRoom;
      currentRoom = stick.Open(currentRoom);
      // Check if still in the same room
      if(sameRoom==currentRoom) {
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


  void EnterRoom () {
    if(!(currentRoom.explored)) {
      print(currentRoom.sRoomDesc);
    } else {
      print(currentRoom.sRoomDescExplored);
    }
    DisplayOptions();
  }

  void Intro() {
    print(ArtTitleScreen);
    Prompt();
    print('You wake up to the sound of a familiar voice in your head.');
    Prompt();
    print('“Why are you running? You really should drink the kool-aid.”\n\“There is no point in trying to escape... but I suppose it could be a fun game.”\n\“When you realize your efforts are futile, just reach into your pocket and drink the kool-aid.”');
    Prompt();
  }





}

