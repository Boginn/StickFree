// import 'Brain.dart';
import 'Brain.dart';
import 'exports.dart';
import 'rooms.dart';

Brain brain = Brain(firstRoom);

void main() {
  Seed();

  brain.Intro();
  brain.EnterRoom();

  while (true) {
    brain.StickInterface();
  }
}
