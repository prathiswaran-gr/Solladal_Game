import 'package:flutter/material.dart';
import 'package:solladal/config/colors.dart';

class Submit extends StatelessWidget {
  final bool canAddLetter;
  final double adjustedWidth;
  final Function() wordCheckFunction;

  const Submit(this.canAddLetter, this.adjustedWidth, this.wordCheckFunction , {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: adjustedWidth,
      child: ElevatedButton(
        onPressed: canAddLetter == false ? (() => wordCheckFunction()) : null,
        child: const Text(
          'சரிபார்',
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
        style: ElevatedButton.styleFrom(
          primary: black,
          onPrimary: white,
          padding: const EdgeInsets.all(0),
        ),
      ),
    );
  }
}
