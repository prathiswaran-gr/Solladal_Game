import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:solladal/config/colors.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(AppBarWidget(appName: 'சொல்லாடல்'));
    final titleFinder = find.text('சொல்லாடல்');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
  });
}

class AppBarWidget extends StatelessWidget {

  late final String appName;
  AppBarWidget(
      {Key? key,required this.appName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    appName = 'சொல்லாடல்';
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          appName,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/hamburger_menu_lines.png',
            height: 25,
            width: 25,
          ),
          color: appBarIconColor,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/ranking.png',
              height: 25,
              width: 25,
            ),
            color: appBarIconColor,
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/settings.png',
              height: 25,
              width: 25,
            ),
            color: appBarIconColor,
          ),
        ],
        elevation: 0.0,
      ),

    );
  }
}
