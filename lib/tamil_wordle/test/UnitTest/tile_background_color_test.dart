// ignore_for_file: unnecessary_type_check

import 'package:tamil_wordle/src/tile_bg_color.dart';
import 'package:test/test.dart';

void main() {
  //'Tile Background Color Enum Test'
  group('Enum Tile Background Color Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Tile Background Color Enum Test', () {
      expect(TileBGColor.green is TileBGColor, true);
      expect(TileBGColor.yellow is TileBGColor, true);
      expect(TileBGColor.darkGrey is TileBGColor, true);
      expect(TileBGColor.white is TileBGColor, true);
      expect(TileBGColor.lightGrey is TileBGColor, true);
    });
  });
}
