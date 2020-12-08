import 'Room.dart';
import 'Strings.dart';
import 'exports.dart';

export 'Room.dart';

void Seed() {
  firstRoom.availableRooms.add(lobbyRoom); // 'A door in front of you',
  firstRoom.availableRooms.add(secondRoom); // 'A door to the left',
  firstRoom.availableRooms.add(livingRoom); // 'A door to the right',
  firstRoom.availableRooms.add(firstRoom); // 'Nothing, stay here',

  lobbyRoom.availableRooms.add(firstRoom); // 'The door back.',
  lobbyRoom.availableRooms.add(exitRoom); // ,
  lobbyRoom.availableRooms.add(lobbyRoom); // 'Nothing, stay here',

  secondRoom.availableRooms.add(smokeRoom); // 'A door in front of you',
  secondRoom.availableRooms.add(closetRoom); // 'A door to the left',
  secondRoom.availableRooms.add(firstRoom); // 'A door to the right',
  secondRoom.availableRooms.add(secondRoom); // 'Nothing, stay here',

  smokeRoom.availableRooms.add(secondRoom); // 'The door back.',
  smokeRoom.availableRooms.add(smokeRoom); // 'Nothing, stay here',

  closetRoom.availableRooms.add(secondRoom); // 'The door back.',
  closetRoom.availableRooms.add(closetRoom); // 'Nothing, stay here',

  livingRoom.availableRooms.add(balconyRoom); // 'A door in front of you',
  livingRoom.availableRooms.add(firstRoom); // 'A door to the left',
  livingRoom.availableRooms.add(darkRoom); // 'A door to the right',
  livingRoom.availableRooms.add(livingRoom); // 'Nothing, stay here',

  balconyRoom.availableRooms.add(livingRoom); // 'The door back.',
  balconyRoom.availableRooms.add(balconyRoom); // 'Nothing, stay here',

  darkRoom.availableRooms.add(livingRoom); // 'A door to the left',
  // darkRoom.visibleRooms.add(chessRoom); // 'A door to the right',(future)
  darkRoom.availableRooms.add(darkRoom); // 'Nothing, stay here',

  chessRoom.availableRooms.add(darkRoom); // 'The door back.',
  chessRoom.availableRooms.add(chessRoom); // 'Nothing, stay here',
}

// TODO adda npc til að tala við fyrir hints
// TODO laga vinstri svo maður þurfi að snúa við

Room firstRoom = Room(
  whichRoom: Rooms.FirstRoom,
  roomDescriptions: firstRoomDescriptions,
  availableRooms: [], // Seed: lobby, secondRoom, thirdRoom
  sAvailableRooms: [
    'A door in front of you', // Lobby
    'A door to the left', // SecondRoom
    'A door to the right', // LivingRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [Items.RubberChicken],
);

Room lobbyRoom = Room(
  whichRoom: Rooms.Lobby,
  roomDescriptions: lobbyRoomDescriptions,
  availableRooms: [], // Seed: firstRoom, exitRoom
  sAvailableRooms: [
    'The door back', // FirstRoom
    'An exit', // exitRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [],
);

Room secondRoom = Room(
  whichRoom: Rooms.SecondRoom,
  roomDescriptions: secondRoomDescriptions,
  availableRooms: [], // Seed: smokeRoom, closetRoom, firstRoom
  sAvailableRooms: [
    'A door in front of you', // SmokeRoom
    'A door to the left', // ClosetRoom
    'The door to that first room', // FirstRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [Items.Triangle, Items.Key],
);

Room smokeRoom = Room(
  whichRoom: Rooms.SmokeRoom,
  roomDescriptions: smokeRoomDescriptions,
  availableRooms: [], // Seed: secondRoom
  sAvailableRooms: [
    'The door back.', // SecondRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [Items.NotationBook],
  onFire: true,
);

Room closetRoom = Room(
  whichRoom: Rooms.ClosetRoom,
  roomDescriptions: closetRoomDescriptions,
  availableRooms: [], // Seed: secondRoom
  sAvailableRooms: [
    'The door back.', // SecondRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [Items.Flashlight],
);

Room livingRoom = Room(
  whichRoom: Rooms.LivingRoom,
  roomDescriptions: livingRoomDescriptions,
  availableRooms: [], // Seed: balconyRoom, firstRoom, darkRoom
  sAvailableRooms: [
    'A door to the balcony', // BalconyRoom
    'A door to that first room', // FirstRoom
    'A door to the right', // DarkRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [Items.ChessManual],
);

Room balconyRoom = Room(
  whichRoom: Rooms.BalconyRoom,
  roomDescriptions: balconyRoomDescriptions,
  availableRooms: [], // Seed: livingRoom
  sAvailableRooms: [
    'The door back to the living room.', // LivingRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [Items.Square, Items.Knob],
  locked: true,
);

Room darkRoom = Room(
  whichRoom: Rooms.DarkRoom,
  roomDescriptions: darkRoomDescriptions,
  availableRooms: [], // Seed: livingRoom, chessRoom (future)
  sAvailableRooms: [
    'The door back to the living room', // LivingRoom
    // 'A door to the right', // ChessRoom(future)
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [],
  isLit: false,
);

Room chessRoom = Room(
  whichRoom: Rooms.ChessRoom,
  roomDescriptions: chessRoomDescriptions,
  availableRooms: [], // Seed: darkRoom
  sAvailableRooms: [
    'The door back to the dark room', // DarkRoom
    'Nothing, stay here', // Stay
  ],
  visibleItems: [],
  cloudedItems: [],
  locked: true,
);

Room exitRoom = Room(
  whichRoom: Rooms.Exit,
  roomDescriptions: firstRoomDescriptions,
  availableRooms: [],
  visibleItems: [],
  cloudedItems: [],
);
