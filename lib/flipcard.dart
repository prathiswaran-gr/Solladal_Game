import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:solladal/frontTile.dart';
import 'package:tamil_wordle/tamil_wordle.dart' as lib;
import 'helper.dart';
import 'backTile.dart';

class FlipTile extends StatelessWidget {
  final lib.Tile tile;
  final bool isActive;
  final FlipCardController controller;
  const FlipTile({
    Key? key,
    required this.tile,
    required this.isActive,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final FlipCardController controller = FlipCardController();

    return FlipCard(
      controller: controller,
      direction: FlipDirection.HORIZONTAL,
      front: FrontTile(
        letter: tile.letter,
        letterColor: Helper.getColor(tile.letterColor),
        bgColor: Helper.getColor(tile.bgColor),
        borderColor: Helper.getColor(tile.borderColor),
        isActive: isActive,
      ),
      back: BackTile(
        letter: tile.letter,
        letterColor: Helper.getColor(tile.flippedLetterColor),
        bgColor: Helper.getColor(tile.flippedBGColor),
        borderColor: Helper.getColor(tile.borderColor),
        isActive: isActive,
      ),
      flipOnTouch: false,
    );
  }
}
