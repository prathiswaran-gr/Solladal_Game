import 'dart:typed_data';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solladal/audioEnableButton.dart';
import 'package:solladal/helper.dart';

//https://www.fluttercampus.com/guide/221/play-soud-from-assets-folder-flutter/
import 'package:audioplayers/audioplayers.dart';

import 'package:tamil_wordle/tamil_wordle.dart' as lib;

import 'package:solladal/clearbutton.dart';
import 'package:solladal/config/theme.dart';
import 'package:solladal/enterbutton.dart';

class Keyboard1 extends StatelessWidget {
  final lib.Keyboard keyboard;
  final lib.Game game;
  final bool canAddLetter;
  final bool canRemoveLetter;
  final Function(String) addLetterFunction;
  final Function() removeLetterFunction;
  final Function() wordCheckFunction;
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  AudioPlayer player = AudioPlayer();
  bool audioOption;

  // Keyboard1(this.keyboard, this.canAddLetter, this.canRemoveLetter,
  //     this.addLetterFunction, this.removeLetterFunction, this.wordCheckFunction,
  //     {Key? key})
  //     : super(key: key);

  Keyboard1(this.keyboard, this.game , this.canAddLetter, this.canRemoveLetter,
      this.addLetterFunction, this.removeLetterFunction, this.wordCheckFunction,
      {this.audioOption = true}); 

  late List<String> keyList;

  @override
  Widget build(BuildContext context) {
    AudioButton(
        keyboard: keyboard,
        addLetterFunction: addLetterFunction,
        removeLetterFunction: removeLetterFunction,
        wordCheckFunction: wordCheckFunction,
        canAddLetter: canAddLetter,
        canRemoveLetter: canRemoveLetter);

    AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

    var adjustedWidth = MediaQuery.of(context).size.width;

    double keyButtonWidth;
    double specialButtonWidth;
    keyList = keyboard.keyboardMap.keys.toList();

    if (adjustedWidth > tabletScreenSize) {
      keyButtonWidth = adjustedWidth * 0.08;
      specialButtonWidth = adjustedWidth * 0.08;
    } else if (adjustedWidth > mobileScreenSize) {
      keyButtonWidth = adjustedWidth * 0.1;
      specialButtonWidth = adjustedWidth * 0.1;
    } else {
      keyButtonWidth = adjustedWidth * 0.12;
      specialButtonWidth = adjustedWidth * 0.16;
    }

    List<SizedBox> firstRowBtnList = [];
    List<SizedBox> secondRowBtnList = [];
    List<SizedBox> thirdRowBtnList = [];
    List<SizedBox> fourthRowBtnList = [];

    for (int index = 0; index < 7; index++) {
      firstRowBtnList.add(
        SizedBox(
          width: keyButtonWidth,
          child: Container(
            margin: const EdgeInsets.only(right: 5, left: 5),
            child: ElevatedButton(
              onPressed: () async {
                if (canAddLetter == true && audioOption == true) {
                  addLetterFunction(keyList[index]);
                  String audioasset = "assets/sounds/${keyList[index]}.mp3";
                  ByteData bytes = await rootBundle
                      .load(audioasset); //load sound from assets
                  Uint8List soundbytes = bytes.buffer
                      .asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
                  int result = await player.playBytes(soundbytes);
                  if (result == 1) {
                    //play success
                    print("Sound playing successful.");
                  } else {
                    print("Error while playing sound.");
                  }
                } else if (canAddLetter == true && audioOption == false) {
                  addLetterFunction(keyList[index]);
                }
              },
              child:Text(
                  keyList[index],
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.left,
                ),
              style: ElevatedButton.styleFrom(
                primary: Helper.getColor(
                    keyboard.keyboardMap[keyList[index]]!.bgColor),
                onPrimary: Helper.getColor(
                    keyboard.keyboardMap[keyList[index]]!.letterColor),
                onSurface: Helper.getColor(
                    keyboard.keyboardMap[keyList[index]]!.bgColor),
                padding: const EdgeInsets.all(0),
              ),
              
            ),
          ),
        ),
      );
    }
    for (int index = 7; index < 14; index++) {
      secondRowBtnList.add(SizedBox(
        width: keyButtonWidth,
        child: Container(
          margin: const EdgeInsets.only(right: 5, left: 5),
          child: ElevatedButton(
            onPressed: () async {
              if (canAddLetter == true && audioOption == true) {
                addLetterFunction(keyList[index]);
                String audioasset = "assets/sounds/${keyList[index]}.mp3";
                ByteData bytes =
                    await rootBundle.load(audioasset); //load sound from assets
                Uint8List soundbytes = bytes.buffer
                    .asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
                int result = await player.playBytes(soundbytes);
                if (result == 1) {
                  //play success
                  print("Sound playing successful.");
                } else {
                  print("Error while playing sound.");
                }
              } else if (canAddLetter == true && audioOption == false) {
                addLetterFunction(keyList[index]);
              }
            },
            child: Text(
              keyList[index],
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
              primary: Helper.getColor(
                  keyboard.keyboardMap[keyList[index]]!.bgColor),
              onPrimary: Helper.getColor(
                  keyboard.keyboardMap[keyList[index]]!.letterColor),
              onSurface: Helper.getColor(
                  keyboard.keyboardMap[keyList[index]]!.bgColor),
              padding: const EdgeInsets.all(0),
            ),
          ),
        ),
      ));
    }

    for (int index = 14; index < 21; index++) {
      thirdRowBtnList.add(SizedBox(
        width: keyButtonWidth,
        child: Container(
          margin: const EdgeInsets.only(right: 5, left: 5),
          child: ElevatedButton(
            onPressed: () async {
              if (canAddLetter == true && audioOption == true) {
                addLetterFunction(keyList[index]);
                String audioasset = "assets/sounds/${keyList[index]}.mp3";
                ByteData bytes =
                    await rootBundle.load(audioasset); //load sound from assets
                Uint8List soundbytes = bytes.buffer
                    .asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
                int result = await player.playBytes(soundbytes);
                if (result == 1) {
                  //play success
                  print("Sound playing successful.");
                } else {
                  print("Error while playing sound.");
                }
              } else if (canAddLetter == true && audioOption == false) {
                addLetterFunction(keyList[index]);
              }
            },
            child: Text(
              keyList[index],
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
              primary: Helper.getColor(
                  keyboard.keyboardMap[keyList[index]]!.bgColor),
              onPrimary: Helper.getColor(
                  keyboard.keyboardMap[keyList[index]]!.letterColor),
              onSurface: Helper.getColor(
                  keyboard.keyboardMap[keyList[index]]!.bgColor),
              padding: const EdgeInsets.all(0),
            ),
          ),
        ),
      ));
    }

    for (int index = 21; index < 25; index++) {
      fourthRowBtnList.add(SizedBox(
        width: keyButtonWidth,
        child: Container(
          margin: const EdgeInsets.only(right: 5, left: 5),
          child: ElevatedButton(
            onPressed: () async {
              if (canAddLetter == true && audioOption == true) {
                addLetterFunction(keyList[index]);
                String audioasset = "assets/sounds/${keyList[index]}.mp3";
                ByteData bytes =
                    await rootBundle.load(audioasset); //load sound from assets
                Uint8List soundbytes = bytes.buffer
                    .asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
                int result = await player.playBytes(soundbytes);
                if (result == 1) {
                  //play success
                  print("Sound playing successful.");
                } else {
                  print("Error while playing sound.");
                }
              } else if (canAddLetter == true && audioOption == false) {
                addLetterFunction(keyList[index]);
              }
            },
            child: Text(
              keyList[index],
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
              primary: Helper.getColor(
                  keyboard.keyboardMap[keyList[index]]!.bgColor),
              onPrimary: Helper.getColor(
                  keyboard.keyboardMap[keyList[index]]!.letterColor),
              onSurface: Helper.getColor(
                  keyboard.keyboardMap[keyList[index]]!.bgColor),
              padding: const EdgeInsets.all(0),
            ),
          ),
        ),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: firstRowBtnList,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: secondRowBtnList,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: thirdRowBtnList,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Submit(canAddLetter, specialButtonWidth, wordCheckFunction)
              ],
            ),
            Column(children: [
              Row(
                children: fourthRowBtnList,
              )
            ]),
            Column(children: [
              Clear(canRemoveLetter, specialButtonWidth, removeLetterFunction),
            ]),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}