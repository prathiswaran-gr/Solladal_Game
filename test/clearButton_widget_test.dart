// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


import 'package:solladal/clearbutton.dart';
import 'package:solladal/config/colors.dart';

void main() {
  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Clear Button Widget Testing - Clear Button is Present or Not', (tester) async {

    await tester.pumpWidget(createWidgetForTesting(
        // ignore: prefer_const_constructors
        child: Clear(true, 0.08,(() =>  print("The clear Button has Non-Empty Value"))
      )
    ));
    
    final clearButtonKeyFinder = find.widgetWithIcon(ElevatedButton, Icons.backspace);

    expect(clearButtonKeyFinder, findsOneWidget);

    final widget = tester.firstWidget(clearButtonKeyFinder) as ElevatedButton;
    final states = <MaterialState>{};
    final bgColor = widget.style?.backgroundColor?.resolve(states);
    final fgColor = widget.style?.foregroundColor?.resolve(states);
    expect(bgColor, black);
    expect(fgColor, white);

  });

  testWidgets('Clear Button Widget Testing - ClearButton Enable Condition Testing', (tester) async {

    await tester.pumpWidget(createWidgetForTesting(
        // ignore: prefer_const_constructors
        child: Clear(true, 0.08,(() =>  print("The clear Button has Non-Empty Value"))
      )
    ));

    final elevatedButtonFinder = find.byType(ElevatedButton);
    await tester.tap(elevatedButtonFinder);

    expect(elevatedButtonFinder, findsOneWidget);

  });

  testWidgets('Clear Button Widget Testing - ClearButton disable Condition Testing', (tester) async {

    await tester.pumpWidget(createWidgetForTesting(
        // ignore: prefer_const_constructors
        child: Clear(false, 0.08,(() =>  print("The clear Button has Non-Empty Value"))
      )
    ));

    final elevatedButtonFinder = find.byType(ElevatedButton);
    await tester.tap(elevatedButtonFinder);

    expect(elevatedButtonFinder, findsOneWidget);

  });

}
