// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:solladal/frontTile.dart';
import 'package:solladal/config/colors.dart';

void main() {
  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Front Tile Widget Testing ', (tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        // ignore: prefer_const_constructors
        child: FrontTile(
            letter: "ப",
            letterColor: black,
            bgColor: white,
            borderColor: borderColor,
            isActive: true)));

    final frontTileContainerFinder = find.widgetWithText(Container, "ப");

    expect(frontTileContainerFinder, findsOneWidget);

    final widget = tester.firstWidget(frontTileContainerFinder) as Container;
    final containerInsideText = find.text("ப");

    expect(containerInsideText, findsOneWidget);
    expect(widget.constraints!.constrainHeight(), 60.0);
    expect(widget.constraints!.constrainWidth(), 60.0);

    expect(
        widget.decoration,
        BoxDecoration(
            color: white,
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            )));

    RichText text = tester.firstWidget(find.byType(RichText));

    expect(text.text.style?.fontWeight, FontWeight.bold);
    expect(text.text.style?.fontSize, 22.0);
    expect(text.text.style?.color, black);

  });
}
