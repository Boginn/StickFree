import 'NPC.dart';
import 'RoomSeeds.dart';

class Gargoyle extends NPC {
  int flashlightChances;
  List<Items> inventory = [Items.KoolAid, Items.Map];
  bool isAwake;
  int asks;

  Gargoyle({bool isFriendly, int flashlightChances, bool isAwake, int asks})
      : super(isFriendly) {
    this.isFriendly = true;
    this.flashlightChances = 4;
    this.isAwake = false;
    this.asks = 1;
  }

  void say(String line) => print('Gargoyle says: “$line“');
}
