import 'dart:io';
import 'dart:convert';

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

void Exit() {
  exit(0);
}

void Prompt(String message) {
  print(message + '\n[¶]');

  stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
}
