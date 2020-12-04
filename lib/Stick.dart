

import 'package:StickFree/exports.dart';

class Stick {

  List<Items> inventory = [Items.Koolaid, Items.Rubberducky];
  final Rooms currentRoom;

  Stick ({this.currentRoom});



  void Inventory() {
    for (int i = 0; i<inventory.length; i++) {
    print(inventory[i].toString().split('.').last);
    }
    StickInterface();
  }

  void LookAround() {
    if(currentRoom==Rooms.FirstRoom){

    }
  }

  void Use() {
    for (int i = 0; i<inventory.length; i++) {
      print('[${i+1}]' + inventory[i].toString().split('.').last);
    }
    InventoryUse();
  }

  void DrinkTheKoolAid() {
    print(sUseKoolaid);
    print(sGameOver);
    String input = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    if (input.toLowerCase() == 'exit' ||
        input.toLowerCase() == 'quit' ||
        input == '') {
      exit(0);
    }
  }


}

enum Items {
  Rubberducky,
  item1,
  item2,
  item3,
  Flashlight,
  Chessmanual,
  Koolaid,
}

enum Rooms {
  FirstRoom,

}
