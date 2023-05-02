// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:solladal/keyboard_single_file.dart';

import 'package:tamil_wordle/tamil_wordle.dart' as lib;

void main() {
  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  List<dynamic> keyList = [
    'த',
    'ம்',
    'தே',
    'ப',
    'ட',
    'ஊ',
    'ஆ',
    'சா',
    'ன்',
    'ம',
    'ளை',
    'க',
    'ச',
    'வ',
    'பூ',
    'வு',
    'இ',
    'ணி',
    'சூ',
    'ல்',
    'வ்',
    'ன',
    'ண்',
    'மா',
    'ண'
  ];

  lib.Keyboard keyboard = lib.Keyboard(keyList);

  testWidgets(
      '1.KeyBoard Key Button Widget Testing - AddLetter and RemoveLetter Variable has True value Test ',
      (tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        // ignore: prefer_const_constructors
        child: Keyboard1(
            keyboard,
            true,
            true,
            ((p0) {
        p0;
        print("All Key is Enabled");
      }),
            (() => print("Remove Letter Button is Enabled")),
            (() => print("Submit Button is Enabled")))));

    final containersFinder = find.byType(Container);

    expect(containersFinder, findsNWidgets(25));

    final elevatedButtonFinder = find.byType(ElevatedButton);

    expect(elevatedButtonFinder, findsNWidgets(27));

    final firstKeyFinder = find.widgetWithText(ElevatedButton, 'த');
    final secondKeyFinder = find.widgetWithText(ElevatedButton, 'ம்');
    final thirdKeyFinder = find.widgetWithText(ElevatedButton, 'தே');
    final fourthKeyFinder = find.widgetWithText(ElevatedButton, 'ப');
    final fifthKeyFinder = find.widgetWithText(ElevatedButton, 'ட');
    final clearButtonKeyFinder =
        find.widgetWithIcon(ElevatedButton, Icons.backspace);
    final submitButtonKeyFinder =
        find.widgetWithText(ElevatedButton, 'சரிபார்');
    final keyNotPresent = find.widgetWithText(ElevatedButton, 'ரி');

    expect(firstKeyFinder, findsOneWidget);
    expect(secondKeyFinder, findsOneWidget);
    expect(thirdKeyFinder, findsOneWidget);
    expect(fourthKeyFinder, findsOneWidget);
    expect(fifthKeyFinder, findsOneWidget);
    expect(clearButtonKeyFinder, findsOneWidget);
    expect(submitButtonKeyFinder, findsOneWidget);
    expect(keyNotPresent, findsNothing);

    await tester.tap(fifthKeyFinder);
    await tester.tap(clearButtonKeyFinder);
    await tester.tap(submitButtonKeyFinder);

    //expect(settingsLogo, findsOneWidget);
  });

  testWidgets(
      '2.KeyBoard Key Button Widget Testing - AddLetter has False value and RemoveLetter Variable has True value Test ',
      (tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        // ignore: prefer_const_constructors
        child: Keyboard1(keyboard, false, true, ((p0) {
        p0;
        print("All Key is Enabled");
      }), (() => print("Remove Letter Button is Enabled")),
            (() => print("Submit Button is Enabled")))));

    final firstKeyFinder = find.widgetWithText(ElevatedButton, 'த');
    final secondKeyFinder = find.widgetWithText(ElevatedButton, 'ம்');
    final thirdKeyFinder = find.widgetWithText(ElevatedButton, 'தே');
    final fourthKeyFinder = find.widgetWithText(ElevatedButton, 'ப');
    final fifthKeyFinder = find.widgetWithText(ElevatedButton, 'ட');
    final clearButtonKeyFinder =
        find.widgetWithIcon(ElevatedButton, Icons.backspace);
    final submitButtonKeyFinder =
        find.widgetWithText(ElevatedButton, 'சரிபார்');
    final keyNotPresent = find.widgetWithText(ElevatedButton, 'ரி');

    expect(firstKeyFinder, findsOneWidget);
    expect(secondKeyFinder, findsOneWidget);
    expect(thirdKeyFinder, findsOneWidget);
    expect(fourthKeyFinder, findsOneWidget);
    expect(fifthKeyFinder, findsOneWidget);
    expect(clearButtonKeyFinder, findsOneWidget);
    expect(submitButtonKeyFinder, findsOneWidget);
    expect(keyNotPresent, findsNothing);

    await tester.tap(fifthKeyFinder);
    await tester.tap(clearButtonKeyFinder);
    await tester.tap(submitButtonKeyFinder);

    //expect(settingsLogo, findsOneWidget);
  });

  testWidgets(
      '3.KeyBoard Key Button Widget Testing - AddLetter has True value and RemoveLetter Variable has False value Test ',
      (tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        // ignore: prefer_const_constructors
        child: Keyboard1(
            keyboard,
            true,
            false,
            ((p0) {
            p0;
            print("All Key is Enabled");
            }),
            (() => print("Remove Letter Button is Enabled")),
            (() => print("Submit Button is Enabled")))));

    final firstKeyFinder = find.widgetWithText(ElevatedButton, 'த');
    final secondKeyFinder = find.widgetWithText(ElevatedButton, 'ம்');
    final thirdKeyFinder = find.widgetWithText(ElevatedButton, 'தே');
    final fourthKeyFinder = find.widgetWithText(ElevatedButton, 'ப');
    final fifthKeyFinder = find.widgetWithText(ElevatedButton, 'ட');
    final clearButtonKeyFinder =
        find.widgetWithIcon(ElevatedButton, Icons.backspace);
    final submitButtonKeyFinder =
        find.widgetWithText(ElevatedButton, 'சரிபார்');
    final keyNotPresent = find.widgetWithText(ElevatedButton, 'ரி');

    expect(firstKeyFinder, findsOneWidget);
    expect(secondKeyFinder, findsOneWidget);
    expect(thirdKeyFinder, findsOneWidget);
    expect(fourthKeyFinder, findsOneWidget);
    expect(fifthKeyFinder, findsOneWidget);
    expect(clearButtonKeyFinder, findsOneWidget);
    expect(submitButtonKeyFinder, findsOneWidget);
    expect(keyNotPresent, findsNothing);

    await tester.tap(fifthKeyFinder);
    await tester.tap(clearButtonKeyFinder);
    await tester.tap(submitButtonKeyFinder);

    //expect(settingsLogo, findsOneWidget);
  });
}
