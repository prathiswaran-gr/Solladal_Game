library tamil_wordle;

import 'helper.dart';
import 'keyboardkey_bg_color.dart';
import 'keyboardkey_fg_color.dart';
import 'key.dart';

class Keyboard {
  Map<String, Key> keyboardMap = <String, Key>{}; //pending
  bool isEnabled = true;

  //Constructor with the parameter of group of letters
  Keyboard(List keysList) {
    for (String key in keysList) {
      //Setting all the keys color in grey
      keyboardMap[key] = Key(
          key,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black));
    }
  }
}
