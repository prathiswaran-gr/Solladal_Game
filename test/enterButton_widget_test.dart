// ignore: file_names
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:solladal/enterbutton.dart';
import 'package:solladal/config/colors.dart';

void main() {
  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Enter Button Widget Testing - Enter Button is Present or Not', (tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        // ignore: prefer_const_constructors
        child: Submit(true, 0.08,
            (() => print("The Enter Button has Non-Empty Value")))));

    final submitButtonKeyFinder =
        find.widgetWithText(ElevatedButton, 'சரிபார்');

    expect(submitButtonKeyFinder, findsOneWidget);

    final widget = tester.firstWidget(submitButtonKeyFinder) as ElevatedButton;
    final states = <MaterialState>{};
    final bgColor = widget.style?.backgroundColor?.resolve(states);
    final fgColor = widget.style?.foregroundColor?.resolve(states);
    expect(bgColor, black);
    expect(fgColor, white);

    final submitTextFinder = find.text("சரிபார்");
    RichText text = tester.firstWidget(find.byType(RichText));
    final sizedboxFinder = find.byType(SizedBox);

    expect(submitTextFinder, findsOneWidget);
    expect(text.textAlign, TextAlign.center);
    expect(text.text.style?.fontSize, 12.0);  
    expect(sizedboxFinder, findsOneWidget);
  });

  testWidgets(
      'Enter Button Widget Testing - EnterButton Enable Condition Testing',
      (tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        // ignore: prefer_const_constructors
        child: Submit(true, 0.08,
            (() => print("The Enter Button has Non-Empty Value")))));

    final elevatedButtonFinder = find.byType(ElevatedButton);
    await tester.tap(elevatedButtonFinder);

    expect(elevatedButtonFinder, findsOneWidget);

  });

  testWidgets(
      'Enter Button Widget Testing - EnterButton disable Condition Testing',
      (tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        // ignore: prefer_const_constructors
        child: Submit(false, 0.08,
            (() => print("The Enter Button has Non-Empty Value")))));

    final elevatedButtonFinder = find.byType(ElevatedButton);
    await tester.tap(elevatedButtonFinder);

    expect(elevatedButtonFinder, findsOneWidget);

  });
}
