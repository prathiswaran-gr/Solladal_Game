// ignore_for_file: unnecessary_type_check

import 'package:tamil_wordle/src/keyboardkey_fg_color.dart';
import 'package:test/test.dart';

void main()
{

  //'Keyboard Key Foreground Color Enum Test'
  group('Enum Keyboard Key Foreground Color Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Keyboard Key FG Color Enum Test', () {
      expect(keyboardKeyFGColor.black is keyboardKeyFGColor, true);
      expect(keyboardKeyFGColor.white is keyboardKeyFGColor, true);
      expect(keyboardKeyFGColor.lightBlack is keyboardKeyFGColor, true);
    });
  });
}