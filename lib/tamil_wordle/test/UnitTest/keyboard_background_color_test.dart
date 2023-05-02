// ignore_for_file: unnecessary_type_check

import 'package:tamil_wordle/src/keyboardkey_bg_color.dart';
import 'package:test/test.dart';

void main()
{

  //'Keyboard Key Background Color Enum Test'
  group('Enum Keyboard Key Background Color Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Keyboard Key BG Color Enum Test', () { 
      expect(keyboardKeyBGColor.green is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.yellow is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.grey is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.darkGrey is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.lightGreen is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.lightYellow is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.lightGrey is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.lightDarkGrey is keyboardKeyBGColor, true);
    });
  });
}