import 'exports.dart';


class Room {
  List<Items> cloudedItems = [];
  List<Items> visibleItems = [];
  List<Room> visibleRooms = [];
  List<String> sVisibleRooms = [];
  Rooms whichRoom;
  String sRoomLookAround;
  String sRoomDesc;

  Room({
    this.whichRoom,
    this.sRoomDesc,
    this.sRoomLookAround,
    this.visibleRooms,
    this.sVisibleRooms,
    this.visibleItems,
    this.cloudedItems,
  });




  void addVisible () {
    visibleItems.addAll(cloudedItems);
  }

  void removeVisible (x) {
    visibleItems.remove(x);
  }
}

enum Rooms {
  FirstRoom,
  Lobby,
  SecondRoom,
  ThirdRoom,
}