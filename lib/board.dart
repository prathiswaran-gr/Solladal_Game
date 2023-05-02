import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:tamil_wordle/tamil_wordle.dart' as lib;
import 'package:solladal/row_tile.dart';

class Board extends StatelessWidget {
  lib.Game game;
  final List<List<FlipCardController>> flipCardControllerList;

  Board({Key? key, required this.game, required this.flipCardControllerList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rowTileList = [];
    for (int i = 0; i < game.board.length; i++) {
      if (game.activeRow == i) {
        rowTileList.add(
          RowTile(
              word: game.board[i],
              isActive: true,
              rowFlipCardController: flipCardControllerList[i]),
        );
      } else {
        rowTileList.add(RowTile(
            word: game.board[i],
            isActive: false,
            rowFlipCardController: flipCardControllerList[i]));
      }
    }

    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: rowTileList),
            ],
          ),
        ),
      ],
    );
  }
}
