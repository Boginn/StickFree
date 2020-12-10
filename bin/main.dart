import 'Brain.dart';
import 'functions.dart';
import 'objects/RoomSeeds.dart';

Brain brain = Brain(firstRoom);

void main() {
  InitialSeed();

  brain.Intro();
  brain.EnterRoom(firstRoom);

  while (!brain.stick.win) {
    brain.StickInterface(chosenControls);
  }

  brain.Win();
}
