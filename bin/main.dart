import 'Brain.dart';
import 'objects/RoomSeeds.dart';

Brain brain = Brain(firstRoom);

void main() {
  Seed();
  brain.Intro();
  brain.EnterRoom();

  while (!brain.stick.win) {
    brain.StickInterface();
  }

  brain.Win();
}
