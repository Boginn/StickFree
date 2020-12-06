import 'exports.dart';



class Brain {

  Stick stick = Stick();
  Room currentRoom = firstRoom;

  Brain ();

  void StickInterface() {
    String input = stdin.readLineSync(encoding: Encoding.getByName('utf-8')).toLowerCase().substring(0, 1);
    if (input == 'l') {
      stick.LookAround(currentRoom);
    } else if (input == 'p') {
      stick.PickUp(currentRoom);
    } else if (input == 'o') {
      currentRoom = stick.Open(currentRoom);
    } else if (input == 'u') {
      stick.Use();
    } else if (input == 'i') {
      stick.Inventory();
      // StickInterface();
    } else if (input == '') {
    } else if (input.toLowerCase().substring(0, 1) == 'q' || input == '') {
      stick.Exit();
    }
  }

  void DisplayOptions() {
    print('\t[L] Look Around');
    print('\t[P] Pick Up');
    print('\t[O] Open');
    print('\t[U] Use');
    print('\t[I] Inventory');
    print('\t[Q] Quit');
  }

  void EnterRoom () {
    print(currentRoom.sRoomDesc);
    DisplayOptions();

  }


  void Intro() {
    print("You wake up to the sound of a familiar voice in your head.");
    stick.Prompt();
    print("“Why are you running? You really should drink the kool-aid.”\n\“There is no point in trying to escape... but I suppose it could be a fun game.”\n\“When you realize your efforts are futile, just reach into your pocket and drink the kool-aid.”");
    stick.Prompt();
  }

}