import 'Room.dart';
import 'Strings.dart';
import 'exports.dart';

export 'Room.dart';

void Seed() {
  firstRoom.visibleRooms.add(lobby); // 'A door in front of you',
  firstRoom.visibleRooms.add(secondRoom); // 'A door to the left',
  firstRoom.visibleRooms.add(livingRoom); // 'A door to the right',

  lobby.visibleRooms.add(firstRoom); // 'The door back.',

  secondRoom.visibleRooms.add(closetRoom); // 'A door to the left',
  secondRoom.visibleRooms.add(firstRoom); // 'A door to the right',

  closetRoom.visibleRooms.add(secondRoom); // 'The door back.',

  livingRoom.visibleRooms.add(balconyRoom); // 'A door in front of you',
  livingRoom.visibleRooms.add(firstRoom); // 'A door to the left',
  livingRoom.visibleRooms.add(darkRoom); // 'A door to the right',

  balconyRoom.visibleRooms.add(livingRoom); // 'The door back.',

  darkRoom.visibleRooms.add(livingRoom); // 'A door to the left',
  darkRoom.visibleRooms.add(chessRoom); // 'A door to the right',

  chessRoom.visibleRooms.add(darkRoom); // 'The door back.',
}

Room firstRoom = Room(
  whichRoom: Rooms.FirstRoom,
  sRoomDesc: sDescFirstRoom,
  sRoomLookAround: sLookAroundFirstRoom,
  visibleRooms: [], // Seed: lobby, secondRoom, thirdRoom
  sVisibleRooms: [
    'A door in front of you', // Lobby
    'A door to the left', // SecondRoom
    'A door to the right' // ThirdRoom
  ],
  visibleItems: [],
  cloudedItems: [Items.RubberChicken],
);

Room lobby = Room(
  whichRoom: Rooms.Lobby,
  sRoomDesc: sDescLobby,
  sRoomLookAround: sLookAroundLobby,
  visibleRooms: [], // Seed: firstRoom
  sVisibleRooms: ['The door back.', 'Exit'],
  visibleItems: [],
  cloudedItems: [],
);

Room secondRoom = Room(
  whichRoom: Rooms.SecondRoom,
  sRoomDesc: sDescSecondRoom,
  sRoomLookAround: sLookAroundSecondRoom,
  visibleRooms: [], // Seed: closetRoom, firstRoom
  sVisibleRooms: [
    'A door to the left', // ClosetRoom
    'A door to the right', // FirstRoom
  ],
  visibleItems: [],
  cloudedItems: [Items.Triangle, Items.Key],
);

Room closetRoom = Room(
  whichRoom: Rooms.ClosetRoom,
  sRoomDesc: sDescClosetRoom,
  sRoomLookAround: sLookAroundClosetRoom,
  visibleRooms: [], // Seed: secondRoom
  sVisibleRooms: ['A door'],
  visibleItems: [],
  cloudedItems: [Items.Flashlight],
);

Room livingRoom = Room(
  whichRoom: Rooms.LivingRoom,
  sRoomDesc: sDescLivingRoom,
  sRoomLookAround: sLookAroundLivingRoom,
  visibleRooms: [], // Seed: balconyRoom, firstRoom, darkRoom
  sVisibleRooms: [
    'A door in front of you', // BalconyRoom
    'A door to the left', // FirstRoom
    'A door to the right' // DarkRoom
  ],
  visibleItems: [],
  cloudedItems: [],
);

Room balconyRoom = Room(
  whichRoom: Rooms.BalconyRoom,
  sRoomDesc: sDescBalconyRoom,
  sRoomLookAround: sLookAroundBalconyRoom,
  visibleRooms: [], // Seed: livingRoom
  sVisibleRooms: ['The door back.'],
  visibleItems: [],
  cloudedItems: [Items.Square],
);

Room darkRoom = Room(
  whichRoom: Rooms.DarkRoom,
  sRoomDesc: sDescDarkRoom,
  sRoomLookAround: sLookAroundDarkRoom,
  visibleRooms: [], // Seed: livingRoom, chessRoom,
  sVisibleRooms: [
    'A door to the left', // LivingRoom
    'A door to the right' // ChessRoom
  ],
  visibleItems: [],
  cloudedItems: [Items.ChessManual],
);

Room chessRoom = Room(
  whichRoom: Rooms.ChessRoom,
  sRoomDesc: sDescChessRoom,
  sRoomLookAround: sLookAroundChessRoom,
  visibleRooms: [], // Seed: darkRoom
  sVisibleRooms: ['The door back'],
  visibleItems: [],
  cloudedItems: [],
);
