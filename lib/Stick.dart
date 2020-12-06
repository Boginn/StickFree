

import 'dart:developer';

import 'exports.dart';

class Stick {


  List<Items> inventory = [Items.KoolAid];
  final Rooms currentRoom;

  Stick ({this.currentRoom});


  void LookAround(Room cRoom) { // ef maður gerir tvisvar er crash
    cRoom.addVisible();
    print(cRoom.sRoomLookAround);
    if(cRoom==firstRoom) {
      cRoom.sVisibleRooms.replaceRange(0, 1, ["A door marked 'Lobby'"]);
    }
  }

  void Inventory() {
    print(sInventory);
    for (int i = 0; i<inventory.length; i++) {
    print(inventory[i].toString().split('.').last);
    }
  }


  void Use() {
    for (int i = 0; i<inventory.length; i++) {
      print('[${i+1}]' + inventory[i].toString().split('.').last);
    }
    InventoryUse();
  }

  void PickUp(Room cRoom) { //ErrorHandling
    print(sPickUp);
    for (int i = 0; i<cRoom.visibleItems.length; i++) {
      print('[${i+1}]' + cRoom.visibleItems[i].toString().split('.').last);
    }
    String input = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    int inputparsed = int.parse(input);
    inventory.add(cRoom.visibleItems[inputparsed-1]);
  }

  Room Open(cRoom) {
    print(sOpen);
    for (int i = 0; i<cRoom.sVisibleRooms.length; i++) {
      print('[${i+1}]' + cRoom.sVisibleRooms[i]);
    }
    String input = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    int inputparsed = int.parse(input);

    if(cRoom==firstRoom && (inputparsed-1)==0) {
      if(inventory.contains(Items.item1) &&
          inventory.contains(Items.item2) &&
          inventory.contains(Items.item3)) {
        print(sOpenLobby);
        return cRoom.visibleRooms[inputparsed-1];
      }
    }

    return cRoom.visibleRooms[inputparsed-1];
  }





  void InventoryUse() {
    String input = stdin.readLineSync(encoding: Encoding.getByName('utf-8')).toLowerCase().substring(0, 1);
    if (input == '1') {
      DrinkTheKoolAid();
    } else if (input == '2') {
      if(inventory[1]==Items.RubberChicken) {
        if(currentRoom==Rooms.Lobby) {
          print(sUseRubberduckyCorrect);
        } else {
          print(sUseRubberducky);
        }
      }
    } else if (input == '3') {

    } else if (input == '4') {

    } else if (input == '5') {

    } else if (input == '6') {

    } else if (input == '7') {

    }else if (input == '') {

    } else {

    }

  }


  void DrinkTheKoolAid() {
    print(sUseKoolaid);
    print(sGameOver);
    Prompt();
    Exit();
  }

  void Exit() {
      exit(0);
  }

  void Prompt() {
    stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
  }



}

enum Items {
  RubberChicken,
  item1,
  item2,
  item3,
  Flashlight,
  Chessmanual,
  KoolAid,
}

