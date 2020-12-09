import 'Brain.dart';
import 'exports.dart';
import 'functions.dart';
import 'rooms.dart';

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
