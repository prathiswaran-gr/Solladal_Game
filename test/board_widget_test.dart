// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:solladal/board.dart';
import 'package:solladal/config/colors.dart';
import 'package:solladal/row_tile.dart';

import 'package:tamil_wordle/tamil_wordle.dart' as lib;
import 'package:flip_card/flip_card_controller.dart';

void main() {
  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  int rows = 6;
  int columns = 3;
  lib.Word word = lib.Word(lib.Database());
  lib.Keyboard keyboard = lib.Keyboard(word.keyList);

  List<List<FlipCardController>> flipCardControllerList = [];

  lib.Game game = lib.Game(rows, columns, keyboard, word);

  for (int i = 0; i < rows; i++) {
    List<FlipCardController> flipCardControllerRowist = [];
    for (int j = 0; j < columns; j++) {
      flipCardControllerRowist.add(FlipCardController());
    }

    flipCardControllerList.add(flipCardControllerRowist);
  }

  List<Widget> tileList = [];
  for (int i = 0; i < game.board.length; i++) {
      tileList.add(
        RowTile(
            word: game.board[i],
            isActive: true,
            rowFlipCardController: flipCardControllerList[i]),
      );
  }
  testWidgets('Board Widget Testing - Board Row Widget Testing', (tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        // ignore: prefer_const_constructors
        child:
            Board(game: game, flipCardControllerList: flipCardControllerList)));

    final flexWidgetFinder = find.byType(Flex);
    expect(flexWidgetFinder, findsOneWidget);
    final flexWidget = tester.firstWidget(flexWidgetFinder) as Flex;
    expect(flexWidget.direction, Axis.horizontal);

    final expendedWidgetFinder = find.byType(Expanded);
    expect(expendedWidgetFinder, findsOneWidget);

    final rowWidgetFinder = find.byType(Row);
    expect(rowWidgetFinder, findsNWidgets(7));

    final rowWidget = tester.firstWidget(rowWidgetFinder) as Row;
    expect(rowWidget.mainAxisAlignment, MainAxisAlignment.center);

    final columnWidgetFinder = find.byType(Column);
    expect(columnWidgetFinder, findsOneWidget);

    final columnWidget = tester.firstWidget(columnWidgetFinder) as Column;
    expect(columnWidget.crossAxisAlignment, CrossAxisAlignment.center);
    expect(columnWidget.children.length, 6);
    expect(columnWidget.children is List, true);    
  });
}
