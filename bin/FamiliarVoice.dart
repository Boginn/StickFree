import 'NPC.dart';
import 'Strings.dart';
import 'functions.dart';

class FamiliarVoice extends NPC {
  /**/

  FamiliarVoice(
      {List<String> voiceLines, bool isFriendly, int flashlightChances})
      : super(voiceLines, isFriendly) {
    // this.voiceLines = familiarVoiceLines;
    this.isFriendly = false;
  }

  void sayRightOrWrong(bool foo) => foo ? Prompt(sFamRight) : print(sFamWrong);
}
