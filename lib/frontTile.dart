import 'package:flutter/material.dart';

import 'helper.dart';

class FrontTile extends StatelessWidget {
  final String letter;
  final Color letterColor;
  final Color bgColor;
  final Color borderColor;
  final bool isActive;

  FrontTile(
      {required this.letter,
      required this.letterColor,
      required this.bgColor,
      required this.borderColor,
      required this.isActive});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 6.5;
    var height = MediaQuery.of(context).size.height / 12.5;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Center(
          child: Text(letter,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: letterColor)),
        ),
        // height: height,
        // width: width,
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color:Colors.black, width: 3),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
