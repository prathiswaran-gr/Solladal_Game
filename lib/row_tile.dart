import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:tamil_wordle/tamil_wordle.dart' as lib;
import 'flipcard.dart';

class RowTile extends StatelessWidget {
  final List<lib.Tile> word;
  final bool isActive;
  final List<FlipCardController> rowFlipCardController;

  RowTile(
      {required this.word,
      required this.isActive,
      required this.rowFlipCardController});

  @override
  Widget build(BuildContext context) {
    List<Widget> flipTileList = [];

    Widget rowTile() {
      //print(rowFlipCardController);
      int i = 0;
      for (var letter in word) {
        flipTileList.add(
          FlipTile(
            tile: letter,
            isActive: isActive,
            controller:rowFlipCardController[i++],
          ),
        );

        
      }

      return Row(children: flipTileList);
    }

    return rowTile();
  }
}
