library tamil_wordle;

import 'keyboardkey_bg_color.dart';
import 'keyboardkey_fg_color.dart';
import 'tile_bg_color.dart';
import 'tile_border_color.dart';
import 'tile_fg_color.dart';

class Helper {
  static const String existingString = ',';
  static String getKeyboardKeyBGColor(keyboardKeyBGColor keyBGColor) {
    String color = 'grey';

    switch (keyBGColor) {
      case keyboardKeyBGColor.darkGrey:
        {
          color = 'darkGrey';
        }
        break;
      case keyboardKeyBGColor.green:
        {
          color = 'green';
        }
        break;
      case keyboardKeyBGColor.yellow:
        {
          color = 'yellow';
        }
        break;
      case keyboardKeyBGColor.grey:
        {
          color = 'grey';
        }
        break;
      case keyboardKeyBGColor.lightGreen:
        {
          color = 'lightGreen';
        }
        break;
      case keyboardKeyBGColor.lightYellow:
        {
          color = 'lightYellow';
        }
        break;
      case keyboardKeyBGColor.lightDarkGrey:
        {
          color = 'lightDarkGrey';
        }
        break;
      default:
        {
          color = 'lightGrey';
        }
        break;
    }
    return color;
  }

  static String getKeyboardKeyFGColor(keyboardKeyFGColor keyFGColor) {
    String color = 'white';

    switch (keyFGColor) {
      case keyboardKeyFGColor.black:
        {
          color = 'black';
        }
        break;
      case keyboardKeyFGColor.lightBlack:
        {
          color = 'lightBlack';
        }
        break;
      default:
        {
          color = 'white';
        }
        break;
    }
    return color;
  }

  static String getTileBGColor(TileBGColor tileColor) {
    String color = 'black';

    switch (tileColor) {
      case TileBGColor.darkGrey:
        {
          color = 'darkGrey';
        }
        break;
      case TileBGColor.lightGrey:
        {
          color = 'lightGrey';
        }
        break;
      case TileBGColor.green:
        {
          color = 'green';
        }
        break;
      case TileBGColor.yellow:
        {
          color = 'yellow';
        }
        break;
      default:
        {
          color = 'white';
        }
        break;
    }
    return color;
  }

  static String getTileFGColor(TileFGColor tileFGColor) {
    String color = 'while';

    switch (tileFGColor) {
      case TileFGColor.black:
        {
          color = 'black';
        }
        break;
      default:
        {
          color = 'white';
        }
        break;
    }
    return color;
  }

  static String getTileBorderColor(TileBorderColor tileBorderColor) {
    String color = 'while';

    switch (tileBorderColor) {
      case TileBorderColor.lightGrey:
        {
          color = 'lightGrey';
        }
        break;
      case TileBorderColor.green:
        {
          color = 'green';
        }
        break;
      case TileBorderColor.yellow:
        {
          color = 'yellow';
        }
        break;
      default:
        {
          color = 'darkGrey';
        }
        break;
    }
    return color;
  }
}
