// ignore: file_names
import 'package:flutter/material.dart';
import 'package:solladal/config/colors.dart';

import 'keyboard_single_file.dart';

import 'package:tamil_wordle/tamil_wordle.dart' as lib;

class AudioButton extends StatefulWidget {
  final lib.Keyboard? keyboard;
  final bool? canAddLetter;
  final bool? canRemoveLetter;
  final Function(String)? addLetterFunction;
  final Function()? removeLetterFunction;
  final Function()? wordCheckFunction;
  bool audioOption;
  AudioButton(
      {this.keyboard,
      this.canAddLetter,
      this.canRemoveLetter,
      this.addLetterFunction,
      this.removeLetterFunction,
      this.wordCheckFunction,
      this.audioOption = true});
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  var textValue = 'Audio is Disabled';

  // void toggleSwitch(lib.Keyboard keyboard,
  // bool canAddLetter,
  // bool canRemoveLetter,
  // Function(String) addLetterFunction,
  // Function() removeLetterFunction,
  // Function() wordCheckFunction,
  // bool audioOption) {
    void toggleSwitch(bool value){
    if (isSwitched == false ) {
      setState(() {
        isSwitched = true;
        textValue = 'Audio is Enabled';
        // Keyboard1(keyboard, canAddLetter, canRemoveLetter, addLetterFunction,
        //     removeLetterFunction, wordCheckFunction,audioOption: true);
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Audio is Disabled';
        // Keyboard1(keyboard, canAddLetter, canRemoveLetter, addLetterFunction,
        //     removeLetterFunction, wordCheckFunction,audioOption: false);
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$textValue',
              style: const TextStyle(fontSize: 17),
            ),
            Transform.scale(
                scale: 1,
                child: Switch(
                  onChanged: toggleSwitch ,/*toggleSwitch(keyboard, canAddLetter, canRemoveLetter, addLetterFunction,
            removeLetterFunction, wordCheckFunction,audioOption),*/
                  value: isSwitched,
                  activeColor: black,
                  activeTrackColor: green,
                  inactiveThumbColor: black,
                  inactiveTrackColor: grey,
                )),
            //Text('$textValue', style: TextStyle(fontSize: 20),)
          ]),
    );
  }
}
