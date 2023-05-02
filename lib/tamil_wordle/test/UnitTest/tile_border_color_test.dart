// ignore_for_file: unnecessary_type_check

import 'package:tamil_wordle/src/tile_border_color.dart';
import 'package:test/test.dart';

void main()
{

  //'Tile Foreground Color Enum Test'
  group('Enum Tile Border Color Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Tile Border Color Enum Test', () {
      expect(TileBorderColor.lightGrey is TileBorderColor, true);
      expect(TileBorderColor.darkGrey is TileBorderColor, true);
      expect(TileBorderColor.green is TileBorderColor, true);
      expect(TileBorderColor.yellow is TileBorderColor, true);
    });
  });
}