import 'dart:convert';
import 'dart:io';

import 'objects/Gargoyle.dart';
import 'objects/Stick.dart';
import 'objects/RoomSeeds.dart';

import 'Strings.dart';
import 'functions.dart';

class Brain {
  // Create player and NPCs
  Stick stick = Stick();
  Gargoyle gargoyle = Gargoyle();

  Room currentRoom;
  Brain(this.currentRoom);

  void Intro() {
    print(sTitleScreen);
    // Ask for control scheme
    ControlScheme();
    Prompt('You wake up to the sound of a familiar voice in your head.');
    stick.famVoice.say('$sFamIntroduceA\n$sFamIntroduceB\n$sFamIntroduceC');
    Prompt('');
  }

  void StickInterface(List<String> controls) {
    String input =
        stdin.readLineSync(encoding: Encoding.getByName('utf-8')).toLowerCase();
    if (input == '') {
    } else if (input.substring(0, 1) == controls[0]) {
      // Gargoyle condition
      stick.canDisturbGargoyle(currentRoom)
          ? gargoyleMeet()
          : stick.Investigate(currentRoom);
    } else if (input.substring(0, 1) == controls[1]) {
      stick.PickUp(currentRoom);
      DisplayOptions();
      stick.DisplayScore();
    } else if (input.substring(0, 1) == controls[2]) {
      var lastRoom = currentRoom;
      currentRoom = stick.Open(currentRoom);
      // Check if still in the same room
      if (lastRoom == currentRoom) {
        DisplayOptions();
        stick.DisplayScore();
      } else {
        EnterRoom(lastRoom);
      }
    } else if (input.substring(0, 1) == controls[3]) {
      stick.Use(currentRoom);
    } else if (input.substring(0, 1) == 'e') {
      stick.Examine(currentRoom);
    } else if (input.toLowerCase().substring(0, 1) == 'q' || input == '') {
      // Ask if sure to exit
      Exit(true);
      DisplayOptions();
      stick.DisplayScore();
    }
  }

  void EnterRoom(Room lastRoom) {
    // Update descriptions in the last room
    currentRoom.updateDoorDescriptions(lastRoom);
    // Display description
    currentRoom.displayExploreDesc(currentRoom.isExplored);
    // Check if room is dark and if flashlight is on
    if (!currentRoom.isLit && stick.isFlashlight) {
      print(sIsFlashlight);
    }
    // Toggle explored
    currentRoom.isExplored = true;

    DisplayOptions();
    stick.DisplayScore();
  }

  void Win() {
    print(sYouWin);
    print(sGameOver);
    stick.DisplayScore();
    Prompt('');
  }

  void gargoyleMeet() {
    int counter = 0;
    if (!gargoyle.isAwake) {
      // Introduction
      Prompt(sGargoyleMeet);
      gargoyle.say(sGargIntroduce);
    }
    // Ask to turn off flashlight
    gargoyleTurnItOff();

    gargoyle.isAwake = true;
    // Initiate conversation
    gargoyleConversation();
    // As if ending an investigation
    DisplayOptions();
    stick.DisplayScore();
  }

  void gargoyleTurnItOff() {
    int counter = 0;
    gargoyle.say(sGargTurnItOff);
    while (true) {
      if (!gargoyle.isFriendly) {
        break;
      }
      print('Turn off the flashlight?');
      bool answer = getYesNo();

      if (answer) {
        //Score
        stick.stickScore -= 20;
        stick.isFlashlight = false;
        print(sUseFlashlightOff);
        gargoyle.say('Thanks.');
        Prompt('');
        break;
      } else {
        if (counter == gargoyle.flashlightChances - 3) {
          gargoyle.say('I mean it.');
        } else if (counter == gargoyle.flashlightChances - 2) {
          gargoyle.say('I will end you.');
        } else if (counter == gargoyle.flashlightChances - 1) {
          gargoyle.say(sGargLastChance);
        } else if (counter == gargoyle.flashlightChances) {
          gargoyle.isFriendly = false;
          //Score
          stick.stickScore -= 666;
        } else {
          gargoyle.say(sGargTurnItOffAgain);
        }
        counter++;
      }
    }
  }

  void gargoyleConversation() {
    // Check if gargoyle is friendly
    if (!gargoyle.isFriendly) {
      gargoyle.say(sGargNotFriends);
    } else {
      gargoyle.say(sGargGreeting);
      while (true) {
        // Display conversation
        for (int i = 0; i < sGargAnswers.length; i++) {
          print('\t[${i + 1}] ' + sGargAnswers[i]);
        }
        // Get input
        int input = getIntAnswer(sGargAnswers.length) - 1;
        // Interpret
        if (sGargAnswers[input] == sGargAskAbout) {
          gargoyle.say(sGargAbout);
          // Update conversation
          sGargAnswers.remove(sGargAskAbout);
        } else if (sGargAnswers[input] == sGargAskChess) {
          gargoyle.say(sGargChess);
        } else if (sGargAnswers[input] == sGargAskForSomething) {
          if (gargoyle.asks > 0) {
            gargoyle.say(sGargMap.toString().split('%').first);
            stick.inventory.add(Items.Map);
            gargoyle.inventory.remove(Items.Map);
            Prompt(sGargMap.toString().split('%').last);
          } else {
            gargoyle.say(sGargKoolAid);
            if (!stick.inventory.contains(Items.KoolAid)) {
              stick.inventory.add(Items.KoolAid);
              gargoyle.inventory.remove(Items.KoolAid);
              Prompt(sKoolAidYesNo.toString().split('%').first);
              sGargAnswers.remove(sGargAskForSomething);
            } else {
              gargoyle.say(sKoolAidYesNo.toString().split('%').last);
            }
          }
          gargoyle.asks--;
        } else if (sGargAnswers[input] == sGargAskStop) {
          break;
        }
      } //while
    }
  }
}
