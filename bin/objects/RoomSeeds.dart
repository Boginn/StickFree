import 'Room.dart';
import '../Strings.dart';

export 'Room.dart';

void InitialSeed() {
  firstRoom.seed(lobbyRoom, 'A door in front of you');
  firstRoom.seed(secondRoom, 'A door to the left');
  firstRoom.seed(livingRoom, 'A door to the right');
  firstRoom.seed(firstRoom, 'Nothing, stay here');

  lobbyRoom.seed(firstRoom, 'The door back');
  lobbyRoom.seed(exitRoom, 'An exit');
  lobbyRoom.seed(lobbyRoom, 'Nothing, stay here');

  secondRoom.seed(smokeRoom, 'A door in front of you');
  secondRoom.seed(closetRoom, 'A door to the left');
  secondRoom.seed(firstRoom, 'The door to the room you woke up in');
  secondRoom.seed(secondRoom, 'Nothing, stay here');

  smokeRoom.seed(secondRoom, 'The door back');
  smokeRoom.seed(smokeRoom, 'Nothing, stay here');

  closetRoom.seed(secondRoom, 'The door back');
  closetRoom.seed(closetRoom, 'Nothing, stay here');

  livingRoom.seed(balconyRoom, 'A door to a balcony');
  livingRoom.seed(firstRoom, 'The door to the room you woke up in');
  livingRoom.seed(darkRoom, 'A door to the right');
  livingRoom.seed(livingRoom, 'Nothing, stay here');

  balconyRoom.seed(livingRoom, 'The door back to the living room');
  balconyRoom.seed(balconyRoom, 'Nothing, stay here');

  darkRoom.seed(livingRoom, 'The door back to the living room');
  darkRoom.seed(darkRoom, 'Nothing, stay here');

  chessRoom.seed(darkRoom, 'The door back to the dark room');
  chessRoom.seed(chessRoom, 'Nothing, stay here');
}

Room firstRoom = Room(
  whichRoom: Rooms.FirstRoom,
  // doorDescription updates the last room the player was in
  // The room the player starts in updates itself
  doorDescription: 'Nothing, stay here',
  roomDescriptions: firstRoomDescriptions,
  availableRooms: [],
  availableRoomsDescriptions: [],
  visibleItems: [],
  cloudedItems: [Items.RubberChicken],
);

Room lobbyRoom = Room(
  whichRoom: Rooms.Lobby,
  doorDescription: 'The door to the lobby',
  roomDescriptions: lobbyRoomDescriptions,
  availableRooms: [],
  availableRoomsDescriptions: [],
  visibleItems: [],
  cloudedItems: [],
);

Room secondRoom = Room(
  whichRoom: Rooms.SecondRoom,
  doorDescription: 'The door to a similar room',
  roomDescriptions: secondRoomDescriptions,
  availableRooms: [],
  availableRoomsDescriptions: [],
  visibleItems: [],
  cloudedItems: [Items.Triangle, Items.Key],
);

Room smokeRoom = Room(
  whichRoom: Rooms.SmokeRoom,
  doorDescription: 'The door to the smokey room',
  roomDescriptions: smokeRoomDescriptions,
  availableRooms: [],
  availableRoomsDescriptions: [],
  visibleItems: [],
  cloudedItems: [Items.NotationBook],
  isLocked: true,
  isFire: true,
);

Room closetRoom = Room(
  whichRoom: Rooms.ClosetRoom,
  doorDescription: 'The door to the closet',
  roomDescriptions: closetRoomDescriptions,
  availableRooms: [],
  availableRoomsDescriptions: [],
  visibleItems: [],
  cloudedItems: [Items.Flashlight],
);

Room livingRoom = Room(
  whichRoom: Rooms.LivingRoom,
  doorDescription: 'The door to the living room',
  roomDescriptions: livingRoomDescriptions,
  availableRooms: [],
  availableRoomsDescriptions: [],
  visibleItems: [],
  cloudedItems: [Items.ChessManual],
);

Room balconyRoom = Room(
  whichRoom: Rooms.BalconyRoom,
  doorDescription: 'The door to the balcony',
  roomDescriptions: balconyRoomDescriptions,
  availableRooms: [],
  availableRoomsDescriptions: [],
  visibleItems: [],
  cloudedItems: [Items.Square, Items.Knob],
  isLocked: true,
);

Room darkRoom = Room(
  whichRoom: Rooms.DarkRoom,
  doorDescription: 'The door to the dark room',
  roomDescriptions: darkRoomDescriptions,
  availableRooms: [],
  availableRoomsDescriptions: [],
  visibleItems: [],
  cloudedItems: [],
  isLit: false,
);

Room chessRoom = Room(
  whichRoom: Rooms.ChessRoom,
  doorDescription: 'The door to the chess hall',
  roomDescriptions: chessRoomDescriptions,
  availableRooms: [],
  availableRoomsDescriptions: [],
  visibleItems: [],
  cloudedItems: [Items.Cloth],
  isLocked: true,
);

Room exitRoom = Room(
  whichRoom: Rooms.Exit,
  doorDescription: '',
  roomDescriptions: firstRoomDescriptions,
  availableRooms: [],
  availableRoomsDescriptions: [],
  visibleItems: [],
  cloudedItems: [],
);
