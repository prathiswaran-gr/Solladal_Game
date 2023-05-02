import 'package:flutter/material.dart';
import 'package:solladal/config/colors.dart';

class Clear extends StatelessWidget {
  final bool canRemoveLetter;
  final double adjustedWidth;
  final Function() removeLetterFunction;

  const Clear(this.canRemoveLetter, this.adjustedWidth, this.removeLetterFunction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: adjustedWidth,
      child: ElevatedButton(
        onPressed: canRemoveLetter == true ? (() => removeLetterFunction()) : null,
        child: const Icon(
          Icons.backspace,
          size: 12,
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
