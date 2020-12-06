

import 'dart:io';
import 'dart:convert';

import 'rooms.dart';
// import 'items_enum.dart';
import 'Strings.dart';



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


  void PickUp(Room cRoom) {//ErrorHandling

    print(sPickUp);

    for (int i = 0; i<cRoom.visibleItems.length; i++) {
      print('[${i+1}]' + cRoom.visibleItems[i].toString().split('.').last);
    }

    String input = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    int inputparsed = int.parse(input);

    inventory.add(cRoom.visibleItems[inputparsed-1]);
    cRoom.removeVisible(cRoom.visibleItems[inputparsed-1]); //hm
  }

  Room Open(cRoom) {
    print(sOpen);
    for (int i = 0; i<cRoom.sVisibleRooms.length; i++) {
      print('[${i+1}]' + cRoom.sVisibleRooms[i]);
    }
    // TODO Error handle
    String input = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    int inputparsed = int.parse(input);

    // [0]lobby, [1]secondRoom [2]livingRoom
    if(cRoom==firstRoom && (inputparsed-1)==0) {
      if(inventory.contains(Items.Triangle) &&
          inventory.contains(Items.Square) &&
          inventory.contains(Items.Circle)) {
        print(sOpenLobby);
        return cRoom.visibleRooms[inputparsed-1+1];
      } else {
        print(sOpenLobbyLocked);
        return cRoom;
      }
    }

    // [0]balconyRoom, [1]firstRoom [2]darkRoom
    if(cRoom==livingRoom && (inputparsed-1)==0) {
      if(inventory.contains(Items.Key)) {
        print(sOpenBalcony);
        return cRoom.visibleRooms[inputparsed-1+1];
      } else {
        print(sOpenBalconyLocked);
        return cRoom;
      }
    }



    return cRoom.visibleRooms[inputparsed-1];
  }





  void Use(Room cRoom) {
    // TODO útfær þetta betur
    for (int i = 0; i<inventory.length; i++) {
      print('[${i+1}]' + inventory[i].toString().split('.').last);
    }

    String input = stdin.readLineSync(encoding: Encoding.getByName('utf-8')).toLowerCase().substring(0, 1);

    if (input == '1') {
      DrinkTheKoolAid();
    }

    else if (input == '2') {
      if(inventory[1]==Items.RubberChicken) {
        if(currentRoom==Rooms.Lobby) {
          print(sUseRubberduckyCorrect);
        } else {
          print(sUseRubberChicken);
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
    print(sUseKoolAid);
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



