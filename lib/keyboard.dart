// import 'package:tamil_wordle/tamil_wordle.dart' as lib;

// import 'package:flutter/material.dart';

// import 'package:solladal/clearbutton.dart';
// import 'package:solladal/config/theme.dart';
// import 'package:solladal/enterbutton.dart';
// import 'package:solladal/key.dart';
// import 'package:solladal/config/colors.dart';

// import 'helper.dart';

// class Keyboard extends StatelessWidget {
//   final lib.Keyboard keyboard;
//   final bool canAddLetter;
//   final bool canRemoveLetter;
//   final Function(String) addLetterFunction;
//   final Function() removeLetterFunction;
//   final Function() wordCheckFunction;
//   Keyboard(
//       this.keyboard,  this.canAddLetter, this.canRemoveLetter, this.addLetterFunction, this.removeLetterFunction, this.wordCheckFunction,
//       {Key? key})
//       : super(key: key);


//   // Map<String, Color> keyMap = {
//   //   'ன்': grey,
//   //   'ம்': grey,
//   //   'க்': grey,
//   //   'ன': grey,
//   //   'டி': grey,
//   //   'ட': grey,
//   //   'ந்': grey,
//   //   'வ': grey,
//   //   'ரு': grey,
//   //   'க': grey,
//   //   'ம': grey,
//   //   'ய': grey,
//   //   'த': grey,
//   //   'ர': grey,
//   //   'கா': grey,
//   //   'வி': grey,
//   //   'கு': grey,
//   //   'ண': grey,
//   //   'ச': grey,
//   //   'தி': grey,
//   //   'ந': grey,
//   //   'ப்': grey,
//   //   'து': grey,
//   //   'பொ': grey,
//   //   'த்': grey
//   // };

//   late List<String> keyList;

//   @override
//   Widget build(BuildContext context) {
//     var adjustedWidth = MediaQuery.of(context).size.width;
//     double keyButtonWidth;
//     double specialButtonWidth;
//     keyList = keyboard.keyboardMap.keys.toList();

//     if (adjustedWidth > tabletScreenSize) {
//       keyButtonWidth = adjustedWidth * 0.08;
//       specialButtonWidth = adjustedWidth * 0.08;
//     } else if (adjustedWidth > mobileScreenSize) {
//       keyButtonWidth = adjustedWidth * 0.1;
//       specialButtonWidth = adjustedWidth * 0.1;
//     } else {
//       keyButtonWidth = adjustedWidth * 0.12;
//       specialButtonWidth = adjustedWidth * 0.16;
//     }

//     // List<SizedBox> btnList = [];

//     // Keys(keyList1[1], grey);

//     // for (var i in keyList.keys) {
//     //   btnlist.add(Keys(keyLetter, colorName, adjustedWidth));
//     // }
//     //   btnList.add(SizedBox(
//     //   width: 75,
//     //   height: 30,
//     //   child: ElevatedButton(
//     //     onPressed: () {},
//     //     child: Text(i),
//     //     style: ElevatedButton.styleFrom(
//     //       primary: keyList[i],
//     //       onPrimary: black,
//     //     ),
//     //   ),
//     // ));

//     // }

//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[0], Helper.getColor(
//                     keyboard.keyboardMap[keyList[0]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[0]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[1], Helper.getColor(
//                     keyboard.keyboardMap[keyList[1]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[1]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[2], Helper.getColor(
//                     keyboard.keyboardMap[keyList[2]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[2]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[3], Helper.getColor(
//                     keyboard.keyboardMap[keyList[3]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[3]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[4], Helper.getColor(
//                     keyboard.keyboardMap[keyList[4]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[4]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[5], Helper.getColor(
//                     keyboard.keyboardMap[keyList[5]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[5]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[6], Helper.getColor(
//                     keyboard.keyboardMap[keyList[6]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[6]]!.letterColor)),
//           ],
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[7], Helper.getColor(
//                     keyboard.keyboardMap[keyList[7]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[7]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[8], Helper.getColor(
//                     keyboard.keyboardMap[keyList[8]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[8]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[9], Helper.getColor(
//                     keyboard.keyboardMap[keyList[9]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[9]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[10], Helper.getColor(
//                     keyboard.keyboardMap[keyList[10]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[10]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[11], Helper.getColor(
//                     keyboard.keyboardMap[keyList[11]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[11]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[12], Helper.getColor(
//                     keyboard.keyboardMap[keyList[12]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[12]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[13], Helper.getColor(
//                     keyboard.keyboardMap[keyList[13]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[13]]!.letterColor)),
//           ],
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[14], Helper.getColor(
//                     keyboard.keyboardMap[keyList[14]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[14]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[15], Helper.getColor(
//                     keyboard.keyboardMap[keyList[15]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[15]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[16], Helper.getColor(
//                     keyboard.keyboardMap[keyList[16]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[16]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[17], Helper.getColor(
//                     keyboard.keyboardMap[keyList[17]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[17]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[18], Helper.getColor(
//                     keyboard.keyboardMap[keyList[18]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[18]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[19], Helper.getColor(
//                     keyboard.keyboardMap[keyList[19]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[19]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[20], Helper.getColor(
//                     keyboard.keyboardMap[keyList[20]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[20]]!.letterColor)),
//           ],
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(
//               width: 5,
//             ),
//             Submit(canAddLetter, specialButtonWidth, wordCheckFunction()),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[21], Helper.getColor(
//                     keyboard.keyboardMap[keyList[21]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[21]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[22], Helper.getColor(
//                     keyboard.keyboardMap[keyList[22]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[22]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[23], Helper.getColor(
//                     keyboard.keyboardMap[keyList[23]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[23]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Keys(canAddLetter, addLetterFunction , keyButtonWidth, keyList[24], Helper.getColor(
//                     keyboard.keyboardMap[keyList[24]]!.bgColor),Helper.getColor(
//                     keyboard.keyboardMap[keyList[24]]!.letterColor)),
//             const SizedBox(
//               width: 5,
//             ),
//             Clear(canRemoveLetter, specialButtonWidth, removeLetterFunction())
//           ],
//         )
//       ],
//     );
//   }
// }
