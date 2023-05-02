import 'package:tamil_wordle/src/tile.dart';
import 'package:tamil_wordle/tamil_wordle.dart';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  //'Tile Class Test'
  group('Tile Class Test', () {
    //Pass the Letter and Background Color Value via Parameterized Constructor and Get the Letter and Background Color - Getter Method Test
    test('Parameteraized Constructor Test', () {
      Tile tile = Tile('ம்', Helper.getTileBGColor(TileBGColor.green),
          Helper.getTileFGColor(TileFGColor.white));
      expect(tile.letter, 'ம்');
      expect(tile.bgColor, 'green');
      expect(tile.letterColor, 'white');
    });

    //Pass the single Tile Background Color Value via Named Constructor and Get the Letter and Background Color - Getter Method Test
    test('Named Constructor Test', () {
      Tile tile = Tile.withoutLetter(Helper.getTileBGColor(TileBGColor.yellow));
      expect(tile.letter, '');
      expect(tile.bgColor, 'yellow');
      expect(tile.letterColor, 'black');
    });

    //Set and Get Method for Letter Test
    test('Set Letter Test', () {
      Tile tile =
          Tile.withoutLetter(Helper.getTileBGColor(TileBGColor.darkGrey));
      tile.letter = 'ம்';
      expect(tile.letter, 'ம்');
      expect(tile.bgColor, 'darkGrey');
      expect(tile.letterColor, 'black');
    });

    //Set and Get Method for Tile Background Color Test
    test('Set Tile Background Color Test', () {
      Tile tile = Tile.withoutLetter(Helper.getTileBGColor(TileBGColor.white));
      tile.bgColor = 'green';
      expect(tile.letter, '');
      expect(tile.bgColor, 'green');
      expect(tile.letterColor, 'black');
    });

    test('Set Tile Foreground Color Test', () {
      Tile tile = Tile.withoutLetter(Helper.getTileBGColor(TileBGColor.white));
      tile.letterColor = 'white';
      expect(tile.letter, '');
      expect(tile.bgColor, 'white');
      expect(tile.letterColor, 'white');
    });

    test('Get Tile Flipped Letter and Background Color Test', () {
      Tile tile = Tile.withoutLetter(Helper.getTileBGColor(TileBGColor.white));

      expect(tile.flippedBGColor, 'lightGrey');
      expect(tile.flippedLetterColor, 'white');

      tile.flippedBGColor = 'green';
      tile.flippedLetterColor = 'white';

      expect(tile.flippedBGColor, 'green');
      expect(tile.flippedLetterColor, 'white');
    });
  });
}
