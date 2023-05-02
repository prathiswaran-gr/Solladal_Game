// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:solladal/config/colors.dart';
import 'package:solladal/flipcard.dart';
import 'package:solladal/row_tile.dart';

import 'package:tamil_wordle/tamil_wordle.dart' as lib;
import 'package:flip_card/flip_card_controller.dart';

void main() {
  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  List<FlipCardController> flipCardControllerRowist = [];
  for (int j = 0; j < 3; j++) {
    flipCardControllerRowist.add(FlipCardController());
  }

  lib.Tile tile1 = lib.Tile("C", "black", "white");
  lib.Tile tile2 = lib.Tile("A", "black", "white");
  lib.Tile tile3 = lib.Tile("T", "black", "white");

  List<lib.Tile> demoTileList = [tile1, tile2, tile3];

  List<Widget> rowList = [];
  int i = 0;

  for (var letter in demoTileList) {
    rowList.add(
      FlipTile(
        tile: letter,
        isActive: true,
        controller: flipCardControllerRowist[i++],
      ),
    );
  }

  testWidgets('Row Tile Widget Testing', (tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        // ignore: prefer_const_constructors
        child: RowTile(
            word: demoTileList,
            isActive: true,
            rowFlipCardController: flipCardControllerRowist)));

    final rowWidgetFinder = find.byType(Row);
    expect(rowWidgetFinder, findsOneWidget);
    final rowWidget = tester.firstWidget(rowWidgetFinder) as Row;
    expect(rowWidget.children.length, 3);
    expect(rowWidget.children is List, true);
  });
}
