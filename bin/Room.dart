import 'exports.dart';
// import 'items_enum.dart';
// export 'items_enum.dart';

class Room {
  List<Items> cloudedItems = [];
  List<Items> visibleItems = [];

  List<Room> visibleRooms = [];
  List<String> sVisibleRooms = [];

  List<String> visibleRoomsAsStrings; //

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
  RubberChicken,
  Triangle,
  Square,
  Circle,
  Flashlight,
  ChessManual,
  KoolAid,
  Key,
}