// ignore: file_names
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solladal/backTile.dart';
import 'package:solladal/frontTile.dart';
import 'package:solladal/helper.dart';

import 'package:tamil_wordle/tamil_wordle.dart' as lib;

import 'package:solladal/flipcard.dart';
import 'package:solladal/config/colors.dart';

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

  testWidgets('Flip Card Widget Testing - FrontTile and BackTile Object Data Testing', (tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        // ignore: prefer_const_constructors
        child: FlipTile(
            tile: demoTileList[0],
            isActive: true,
            controller: flipCardControllerRowist[0])));

    final flipcardFinder = find.byType(FlipCard);
    final flipcard = tester.firstWidget(flipcardFinder) as FlipCard;

    expect(flipcardFinder, findsOneWidget);
    expect(flipcard.controller, flipCardControllerRowist[0]);
    expect(flipcard.direction, FlipDirection.HORIZONTAL);
    expect(flipcard.flipOnTouch, false);

    final FrontTile frontTile = flipcard.front as FrontTile;

    expect(flipcard.front is FrontTile, true);
    expect(frontTile.letter, tile1.letter);
    expect(frontTile.bgColor, Helper.getColor(tile1.bgColor));
    expect(frontTile.letterColor, Helper.getColor(tile1.letterColor));
    expect(frontTile.borderColor, Helper.getColor(tile1.borderColor));
    expect(frontTile.isActive, true);

    final BackTile backTile = flipcard.back as BackTile;

    expect(flipcard.back is BackTile, true);
    expect(backTile.letter, tile1.letter);
    expect(backTile.bgColor, Helper.getColor(tile1.flippedBGColor));
    expect(backTile.letterColor, Helper.getColor(tile1.flippedLetterColor));
    expect(backTile.borderColor, Helper.getColor(tile1.borderColor));
    expect(backTile.isActive, true);
  });
}
