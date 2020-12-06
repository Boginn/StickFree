import 'exports.dart';

Room firstRoom = Room(
  whichRoom: Rooms.FirstRoom,
  sRoomDesc: sDescFirstRoom,
  sRoomLookAround: sLookAroundFirstRoom,
  visibleRooms: [lobby, secondRoom, thirdRoom],
  sVisibleRooms: ['A door in front of you', 'A door to the left', 'A door to the right'],
  visibleItems: [],
  cloudedItems: [Items.RubberChicken],
);

Room lobby = Room(
  whichRoom: Rooms.Lobby,
  sRoomDesc: sDescLobby,
  sRoomLookAround: sLookAroundLobby,
  visibleRooms: [firstRoom],
  sVisibleRooms: [],
  visibleItems: [],
  cloudedItems: [],
);

Room secondRoom = Room(
  whichRoom: Rooms.SecondRoom,
  sRoomDesc: sDescSecondRoom,
  sRoomLookAround: sLookAroundSecondRoom,
  visibleRooms: [],
  sVisibleRooms: [],
  visibleItems: [],
  cloudedItems: [Items.item1],
);

Room thirdRoom = Room(
  whichRoom: Rooms.FirstRoom,
  sRoomDesc: sDescFirstRoom,
  sRoomLookAround: sLookAroundThirdRoom,
  visibleRooms: [],
);

