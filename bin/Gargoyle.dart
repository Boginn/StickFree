import 'NPC.dart';
import 'Strings.dart';
import 'Room.dart';

class Gargoyle extends NPC {
  int flashlightChances;
  List<Items> inventory = [Items.KoolAid, Items.Map];
  bool isAwake;
  int asks;

  Gargoyle(
      {List<String> voiceLines,
      bool isFriendly,
      int flashlightChances,
      bool isAwake})
      : super(voiceLines, isFriendly) {
    // this.voiceLines = gargoyleVoiceLines;
    this.isFriendly = true;
    this.flashlightChances = 4;
    this.isAwake = false;
    this.asks = 1;
  }

  void say(String line) => print('The gargoyle says: $line');
}
