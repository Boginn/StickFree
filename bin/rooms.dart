import 'Room.dart';
import 'Strings.dart';
import 'exports.dart';

export 'Room.dart';

void Seed() {
  firstRoom.visibleRooms.add(lobby); // 'A door in front of you',
  firstRoom.visibleRooms.add(secondRoom); // 'A door to the left',
  firstRoom.visibleRooms.add(livingRoom); // 'A door to the right',
  firstRoom.visibleRooms.add(firstRoom); // 'Nothing, stay here',

  lobby.visibleRooms.add(firstRoom); // 'The door back.',
  lobby.visibleRooms.add(lobby); // 'Nothing, stay here',

  secondRoom.visibleRooms.add(closetRoom); // 'A door to the left',
  secondRoom.visibleRooms.add(firstRoom); // 'A door to the right',
  secondRoom.visibleRooms.add(secondRoom); // 'Nothing, stay here',

  closetRoom.visibleRooms.add(secondRoom); // 'The door back.',
  closetRoom.visibleRooms.add(closetRoom); // 'Nothing, stay here',

  livingRoom.visibleRooms.add(balconyRoom); // 'A door in front of you',
  livingRoom.visibleRooms.add(firstRoom); // 'A door to the left',
  livingRoom.visibleRooms.add(darkRoom); // 'A door to the right',
  livingRoom.visibleRooms.add(livingRoom); // 'Nothing, stay here',

  balconyRoom.visibleRooms.add(livingRoom); // 'The door back.',
  balconyRoom.visibleRooms.add(balconyRoom); // 'Nothing, stay here',

  darkRoom.visibleRooms.add(livingRoom); // 'A door to the left',
  darkRoom.visibleRooms.add(chessRoom); // 'A door to the right',
  darkRoom.visibleRooms.add(darkRoom); // 'Nothing, stay here',

  chessRoom.visibleRooms.add(darkRoom); // 'The door back.',
  chessRoom.visibleRooms.add(chessRoom); // 'Nothing, stay here',
}

Room firstRoom = Room(
  whichRoom: Rooms.FirstRoom,
  sRoomDesc: sDescFirstRoom,
  sRoomDescExplored: sDescFirstRoomExplored,
  sRoomLookAround: sLookAroundFirstRoom,
  visibleRooms: [], // Seed: lobby, secondRoom, thirdRoom
  sVisibleRooms: [
    'A door in front of you', // Lobby
    'A door to the left', // SecondRoom
    'A door to the right', // LivingRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [Items.RubberChicken],
  explored: false,
  locked: false,
);

Room lobby = Room(
  whichRoom: Rooms.Lobby,
  sRoomDesc: sDescLobbyRoom,
  sRoomDescExplored: sDescLobbyRoomExplored,
  sRoomLookAround: sLookAroundLobby,
  visibleRooms: [], // Seed: firstRoom
  sVisibleRooms: [
    'The door back.', // FirstRoom
    'Exit',
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [],
  explored: false,
  locked: false,
);

Room secondRoom = Room(
  whichRoom: Rooms.SecondRoom,
  sRoomDesc: sDescSecondRoom,
  sRoomDescExplored: sDescSecondRoomExplored,
  sRoomLookAround: sLookAroundSecondRoom,
  visibleRooms: [], // Seed: closetRoom, firstRoom
  sVisibleRooms: [
    'A door to the left', // ClosetRoom
    'A door to the right', // FirstRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [Items.Triangle, Items.Key],
  explored: false,
  locked: false,
);

Room closetRoom = Room(
  whichRoom: Rooms.ClosetRoom,
  sRoomDesc: sDescClosetRoom,
  sRoomDescExplored: sDescClosetRoomExplored,
  sRoomLookAround: sLookAroundClosetRoom,
  visibleRooms: [], // Seed: secondRoom
  sVisibleRooms: [
    'The door back.',
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [Items.Flashlight],
  explored: false,
  locked: false,
);

Room livingRoom = Room(
  whichRoom: Rooms.LivingRoom,
  sRoomDesc: sDescLivingRoom,
  sRoomDescExplored: sDescLivingRoomExplored,
  sRoomLookAround: sLookAroundLivingRoom,
  visibleRooms: [], // Seed: balconyRoom, firstRoom, darkRoom
  sVisibleRooms: [
    'A door to the balcony', // BalconyRoom
    'A door to the left', // FirstRoom
    'A door to the right', // DarkRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [],
  explored: false,
  locked: false,
);

Room balconyRoom = Room(
  whichRoom: Rooms.BalconyRoom,
  sRoomDesc: sDescBalconyRoom,
  sRoomDescExplored: sDescBalconyRoomExplored,
  sRoomLookAround: sLookAroundBalconyRoom,
  visibleRooms: [], // Seed: livingRoom
  sVisibleRooms: [
    'The door back to the living room.', // LivingRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [Items.Square, Items.Knob],
  explored: false,
  locked: true,
);

Room darkRoom = Room(
  whichRoom: Rooms.DarkRoom,
  sRoomDesc: sDescDarkRoom,
  sRoomDescExplored: sDescDarkRoomExplored,
  sRoomLookAround: sLookAroundDarkRoom,
  visibleRooms: [], // Seed: livingRoom, chessRoom,
  sVisibleRooms: [
    'A door to the left', // LivingRoom
    'A door to the right', // ChessRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [Items.ChessManual],
  explored: false,
  locked: false,
);

Room chessRoom = Room(
  whichRoom: Rooms.ChessRoom,
  sRoomDesc: sDescChessRoom,
  sRoomDescExplored: sDescChessRoomExplored,
  sRoomLookAround: sLookAroundChessRoom,
  visibleRooms: [], // Seed: darkRoom
  sVisibleRooms: [
    'The door back to the dark room', // DarkRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [],
  explored: false,
  locked: true,
);
