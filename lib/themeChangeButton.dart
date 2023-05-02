// ignore: file_names
import 'package:flutter/material.dart';
import 'package:solladal/config/colors.dart';

class ThemeChangeButton extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  //var textValue = 'Audio is Disabled';

    void toggleSwitch(bool value){
    if (isSwitched == false ) {
      setState(() {
        isSwitched = true;
        //textValue = 'Audio is Enabled';
        // Keyboard1(keyboard, canAddLetter, canRemoveLetter, addLetterFunction,
        //     removeLetterFunction, wordCheckFunction,audioOption: true);
      });
      print('Dark Theme is ON');
    } else {
      setState(() {
        isSwitched = false;
        //textValue = 'Audio is Disabled';
      });
      print('Dark Theme is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dark Theme",
              style: TextStyle(fontSize: 17),
            ),
            Transform.scale(
                scale: 1,
                child: Switch(
                  onChanged: toggleSwitch ,
                  value: isSwitched,
                  activeColor: black,
                  activeTrackColor: Color.fromARGB(255, 244, 210, 44),
                  inactiveThumbColor: black,
                  inactiveTrackColor: grey,
                )),
            //Text('$textValue', style: TextStyle(fontSize: 20),)
          ]),
    );
  }
}
