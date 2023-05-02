import 'package:flutter/material.dart';
import 'package:solladal/config/colors.dart';

class Keys extends StatelessWidget {
  final String keyLetter;
  final Color colorName;
  final double adjustedWidth;

  const Keys(this.keyLetter, this.colorName,this.adjustedWidth, {Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: adjustedWidth,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          keyLetter,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
        style: ElevatedButton.styleFrom(
          primary: colorName,
          onPrimary: black,
        ),
      ),
    );
  }
}
