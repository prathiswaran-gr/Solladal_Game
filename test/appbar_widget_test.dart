import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:solladal/shared/appbar_widget.dart';

void main() {
  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('AppBar Widget Testing - Title and IconButton Testing', (tester) async {

    await tester.pumpWidget(createWidgetForTesting(
        child: AppBarWidget(
          boardWidget: const Text('Board Widget'),
          keyBoardwidget: const Text('KeyBoard Widget'),
        )
      )
    );
    final titleFinder = find.text('சொல்லாடல்');
    final iconButtonFinder = find.byType(IconButton);

    expect(titleFinder, findsOneWidget);
    expect(iconButtonFinder, findsNWidgets(3));

  });
}
