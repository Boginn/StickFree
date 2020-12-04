import 'exports.dart';


Stick stick = Stick();



void StickInterface() {
  String input = stdin.readLineSync(encoding: Encoding.getByName('utf-8')).toLowerCase().substring(0, 1);
  if (input == 'l') {
    stick.LookAround();
  } else if (input == 'p') {
    // PickUp();
  } else if (input == 'e') {
    // Examine();
  } else if (input == 'u') {
    stick.Use();
  } else if (input == 'i') {
    stick.Inventory();
  } else if (input == '') {

  } else if (input.toLowerCase().substring(0, 1) == 'q' || input == '') {

  }
}

void DisplayOptions() {
  print('\t[L] Look Around');
  print('\t[P] Pick Up');
  print('\t[E] Examine');
  print('\t[U] Use');
  print('\t[I] Inventory');
  print('\t[Q] Quit');
}

void InventoryUse() {
  String input = stdin.readLineSync(encoding: Encoding.getByName('utf-8')).toLowerCase().substring(0, 1);
  if (input == '1') {
    stick.DrinkTheKoolAid();
  } else if (input == '2') {
    // PickUp();
  } else if (input == '3') {
    // Examine();
  } else if (input == '4') {
    // Use();
  } else if (input == '5') {

  } else if (input == '6') {

  } else if (input == '7') {

  }else if (input == '') {

  } else {

  }
}