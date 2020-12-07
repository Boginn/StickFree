import 'exports.dart';

class Room {
  List<Items> cloudedItems = [];
  List<Items> visibleItems = [];

  List<Room> visibleRooms = [];
  List<String> sVisibleRooms = [];

  Rooms whichRoom;
  String sRoomLookAround;
  String sRoomDesc;
  String sRoomDescExplored;
  bool explored;
  bool locked;

  Room({
    this.whichRoom,
    this.sRoomDesc,
    this.sRoomDescExplored,
    this.sRoomLookAround,
    this.visibleRooms,
    this.sVisibleRooms,
    this.visibleItems,
    this.cloudedItems,
    this.explored,
    this.locked,
  });

  void addVisible() {
    visibleItems.addAll(cloudedItems);
  }

  void removeVisible(Items item) {
    visibleItems.remove(item);
  }


}

enum Rooms {
                          Lobby, BalconyRoom,
  ClosetRoom,SecondRoom, FirstRoom, LivingRoom, DarkRoom, ChessRoom,

}

// enum Rooms {
//   FirstRoom,
//   Lobby,
//   SecondRoom,
//   ClosetRoom,
//   LivingRoom,
//   BalconyRoom,
//   DarkRoom,
//   ChessRoom,
// }

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
}