import 'dart:io';
import 'dart:convert';

import 'Strings.dart';

bool getYesNo() {
  while (true) {
    DisplayYesNo();
    var input = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    // Error Handling: cannot substring null
    if (input == '' || input == 'n') {
      return false;
    } else if (input.toLowerCase().substring(0, 1) == 'y') {
      return true;
    }
  }
}

int getIntAnswer(int optionCount) {
  // Handles errors from input
  int input;
  while (true) {
    try {
      input =
          int.parse(stdin.readLineSync(encoding: Encoding.getByName('utf-8')));
    } on FormatException {
      print('Options available: 1-$optionCount.');
    }
    try {
      if (input > optionCount || input <= 0) {
        print('Options available: 1-$optionCount.');
      } else {
        return input;
      }
    } on NoSuchMethodError {
      // print('Options available: 1-$optionCount.');
    }
  }
}

void Exit(bool foo) {
  // Send in false to exit immediately, true to ask y/n
  if (!foo) {
    exit(0);
  }
  while (foo) {
    print('Do you really want to exit? All progress will be lost.');
    bool ans = getYesNo();
    ans ? exit(0) : foo = ans;
  }
}

void Prompt(String message) {
  print(message + '\n[¶]');
  stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
}
