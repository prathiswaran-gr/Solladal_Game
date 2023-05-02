import 'package:flutter/material.dart';

import 'helper.dart';

class BackTile extends StatelessWidget {
  final String letter;
  final Color letterColor;
  final Color bgColor;
  final Color borderColor;
  final bool isActive;

  const BackTile(
      {required this.letter,
      required this.letterColor,
      required this.bgColor,
      required this.borderColor,
      required this.isActive});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Center(
          child: Text(
            letter,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: letterColor),
          ),
        ),
        // height: height,
        // width: width,
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor, width: 3),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
