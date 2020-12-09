import 'package:meta/meta.dart';

class Room {
  List<Items> cloudedItems = [];
  List<Items> visibleItems = [];

  List<Room> availableRooms = [];
  List<String> sAvailableRooms = [];

  Rooms whichRoom;
  Map roomDescriptions;
  bool investigated;
  bool explored;
  bool locked;
  bool isFire;
  bool isLit;

  Room({
    @required this.whichRoom,
    @required this.roomDescriptions,
    @required this.availableRooms,
    @required this.sAvailableRooms,
    @required this.visibleItems,
    @required this.cloudedItems,
    this.investigated = false,
    this.explored = false,
    this.locked = false,
    this.isFire = false,
    this.isLit = true,
  });

  void revealCloudedItems() => visibleItems.addAll(cloudedItems);

  void removePickedUpItem(Items item) => visibleItems.remove(item);

  void toggleInvestigated(Room cRoom) {
    cRoom.revealCloudedItems();
    cRoom.investigated = true;
    print(cRoom.roomDescriptions['FirstInvestigate']);
  }
}

enum Rooms {
  FirstRoom,
  Lobby,
  SecondRoom,
  SmokeRoom,
  ClosetRoom,
  LivingRoom,
  BalconyRoom,
  DarkRoom,
  ChessRoom,
  Exit,
}

enum Items {
  KoolAid,
  RubberChicken,
  Triangle,
  Square,
  Circle,
  Flashlight,
  ChessManual,
  Key,
  Knob,
  NotationBook,
  Map,
  Cloth,
}
