import 'package:meta/meta.dart';
import 'RoomSeeds.dart';

class Room {
  List<Items> cloudedItems = [];
  List<Items> visibleItems = [];

  List<Room> availableRooms = [];
  List<String> availableRoomsDescriptions = [];

  Rooms whichRoom;
  String doorDescription;
  Map roomDescriptions;
  bool isInvestigated;
  bool isExplored;
  bool isLocked;
  bool isFire;
  bool isLit;

  Room({
    @required this.whichRoom,
    @required this.doorDescription,
    @required this.roomDescriptions,
    @required this.availableRooms,
    @required this.availableRoomsDescriptions,
    @required this.visibleItems,
    @required this.cloudedItems,
    this.isInvestigated = false,
    this.isExplored = false,
    this.isLocked = false,
    this.isFire = false,
    this.isLit = true,
  });

  void seedSpawn(Room seed, String description) {
    availableRooms.insert(availableRooms.indexOf(this), seed);
    availableRoomsDescriptions.insert(
        availableRooms.indexOf(this) - 1, description);
  }

  void seed(Room toSeed, String description) {
    availableRooms.add(toSeed);
    availableRoomsDescriptions.add(description);
  }

  void revealCloudedItems() => visibleItems.addAll(cloudedItems);

  void removePickedUpItem(Items item) => visibleItems.remove(item);

  void toggleInvestigated() {
    revealCloudedItems();
    isInvestigated = true;
  }

  void updateNavInvestigateDesc() {}

  void updateDoorDescriptions(Room lastRoom) {
    if (!isExplored) {
      // Update thisRoom description in the lastRoom
      availableRooms[availableRooms.indexOf(lastRoom)]
          .availableRoomsDescriptions
          .replaceRange(lastRoom.availableRooms.indexOf(this),
              lastRoom.availableRooms.indexOf(this) + 1, [doorDescription]);
    }
  }

  void insertDoorDescription(Room door, String description) {
    // Update thisRoom description in the lastRoom
    availableRoomsDescriptions.replaceRange(availableRooms.indexOf(door),
        availableRooms.indexOf(door) + 1, [description]);
  }

  void updateRoomInvestigateDesc({bool investigated, String description}) {
    investigated
        ? roomDescriptions['Investigated'] = description
        : roomDescriptions['FirstInvestigate'] = description;
  }

  void updateRoomExploreDesc({bool explored, String description}) {
    explored
        ? roomDescriptions['Explored'] = description
        : roomDescriptions['FirstExplore'] = description;
  }

  void displayInvestigateDesc(bool investigated) {
    investigated
        ? print(roomDescriptions['Investigated'])
        : print(roomDescriptions['FirstInvestigate']);
  }

  void displayExploreDesc(bool explored) {
    explored
        ? print(roomDescriptions['Explored'])
        : print(roomDescriptions['FirstExplore']);
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
