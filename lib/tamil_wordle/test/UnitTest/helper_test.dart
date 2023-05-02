import 'package:tamil_wordle/src/helper.dart';
import 'package:tamil_wordle/src/keyboardkey_bg_color.dart';
import 'package:tamil_wordle/src/keyboardkey_fg_color.dart';
import 'package:tamil_wordle/src/tile_bg_color.dart';
import 'package:tamil_wordle/src/tile_border_color.dart';
import 'package:tamil_wordle/src/tile_fg_color.dart';
import 'package:test/test.dart';

//Helper Class Test
void main() {
  group('Helper Class Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    //Get Keyboard Key BG Color Method Test
    test('Get Keyboard Key BG Color Method Test', () {
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey),
          'darkGrey');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green),
          'green');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          'grey');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightDarkGrey),
          'lightDarkGrey');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightGreen),
          'lightGreen');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightGrey),
          'lightGrey');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightYellow),
          'lightYellow');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow),
          'yellow');
    });

    //Get Keyboard Key FG Color Method Test
    test('Get Keyboard Key BG Color Method Test', () {
      expect(Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black),
          'black');
      expect(Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.lightBlack),
          'lightBlack');
      expect(Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.white),
          'white');
    });

    //Get Tile BG Color Method Test
    test('Get Tile BG Color Method Test', () {
      expect(Helper.getTileBGColor(TileBGColor.darkGrey),
          'darkGrey');
      expect(Helper.getTileBGColor(TileBGColor.lightGrey),
          'lightGrey');
      expect(Helper.getTileBGColor(TileBGColor.green),
          'green');
      expect(Helper.getTileBGColor(TileBGColor.yellow),
          'yellow');
      expect(Helper.getTileBGColor(TileBGColor.white),
          'white');
    });

    //Get Tile FG Color Method Test
    test('Get Tile FG Color Method Test', () {
      expect(Helper.getTileFGColor(TileFGColor.black),
          'black');
      expect(Helper.getTileFGColor(TileFGColor.white),
          'white');
    });

    //Get Tile Border Color Method Test
    test('Get Tile Border Color Method Test', () {
      expect(Helper.getTileBorderColor(TileBorderColor.darkGrey),
          'darkGrey');
      expect(Helper.getTileBorderColor(TileBorderColor.lightGrey),
          'lightGrey');
      expect(Helper.getTileBorderColor(TileBorderColor.green),
          'green');
      expect(Helper.getTileBorderColor(TileBorderColor.yellow),
          'yellow');
    });

  });
}
