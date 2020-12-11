import 'NPC.dart';
import '../Strings.dart';
import '../functions.dart';

class FamiliarVoice extends NPC {
  /**/

  FamiliarVoice({bool isFriendly, int flashlightChances}) : super(isFriendly) {
    this.isFriendly = false;
  }

  void say(String line) => print('The voice says: “$line“');
  void sayRightOrWrong(bool foo) =>
      foo ? Prompt('“$sFamRight“') : Prompt('“$sFamWrong“');
}
