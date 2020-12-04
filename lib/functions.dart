
import 'exports.dart';

/*            User*/
String AskName() {
  print('\t[Q] Quit');
  print('\t[M] Main Menu');
  print('Enter a name:');
  String name =
  stdin.readLineSync(encoding: Encoding.getByName('utf-8')).toLowerCase();
  // if (name == 'q' || name == '') {
  //   Exit();
  // }
  // if (name == 'm') {
  //   MainMenu();
  // }
  return name;
}


/*            Displays*/


void Rules() {
  print('\t\r[Only absolute or non-decimal values are accepted.]');
  print('\t\t[No input results in cancellation.]\n');
}


// void DisplayPatrons() {
//   print('These are our patrons:');
//   int count = 1;
//   for (int i = 0; i < (currAccNames().length); i = i + 2) {
//     if (currAccNames().length.isEven) {
//       print('${currAccNames()[i]} \t\t\t ${currAccNames()[count]}');
//       count = count + 2;
//     }
//     if (!currAccNames().length.isEven) {
//       if (currAccNames().length == (count)) {
//         print('${currAccNames()[i]}');
//         break;
//       }
//       print('${currAccNames()[i]} \t\t\t ${currAccNames()[count]}');
//       count = count + 2;
//     }
//   }
// }



/*            Error Handling*/

int AskAmountParsing() {
  int amount = 0;
  try {
    amount = int.parse(stdin.readLineSync());
  } on FormatException {
    print('[Please input a number.]\n');
  } catch (e) {
    print('Only absolute and non-decimal values are accepted.\n');
    print(e);
    throw e;
  }
  if (amount < 0) {
    print('Only absolute and non-decimal values are accepted.\n');
    // Exit();
  }
  if (amount == '') {
    // Exit();
  };
  return amount;
}

