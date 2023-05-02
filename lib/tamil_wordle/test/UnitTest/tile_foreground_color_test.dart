// ignore_for_file: unnecessary_type_check

import 'package:tamil_wordle/src/tile_fg_color.dart';
import 'package:test/test.dart';

void main()
{

  //'Tile Foreground Color Enum Test'
  group('Enum Tile Foreground Color Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Tile Foreground Color Enum Test', () {
      expect(TileFGColor.black is TileFGColor, true);
      expect(TileFGColor.white is TileFGColor, true);
    });
  });
}