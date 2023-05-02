import 'package:tamil_wordle/tamil_wordle.dart';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  //Keyboard Map Test for Map Key Get the Correct Value
  group('Keyboard Key And Value Test ', () {
    Keyboard keyboard = Keyboard(['ம்', 'க்', 'ன']);

    test('Default Key Letter Test', () {
      expect(keyboard.keyboardMap['ம்']!.letter, 'ம்');
      expect(keyboard.keyboardMap['க்']!.letter, 'க்');
      expect(keyboard.keyboardMap['ன']!.letter, 'ன');
    });

    test('Default Key Background Color Test', () {
      expect(keyboard.keyboardMap['ம்']!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(keyboard.keyboardMap['க்']!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(keyboard.keyboardMap['ன']!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
    });

    test('Default Key Foreground Color Test', () {
      expect(keyboard.keyboardMap['ம்']!.letterColor,
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black));
      expect(keyboard.keyboardMap['க்']!.letterColor,
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black));
      expect(keyboard.keyboardMap['ன']!.letterColor,
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black));
    });

    test('IsEnabled Property Test', () {
      expect(keyboard.isEnabled, true);

      keyboard.isEnabled = false;

      expect(keyboard.isEnabled, false);
    });
  });
}
