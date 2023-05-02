import 'package:flutter/material.dart';

import 'package:solladal/config/colors.dart';
import 'package:solladal/setting.dart';

class AppBarWidget extends StatefulWidget {
  Widget boardWidget;
  Widget keyBoardwidget;
  AppBarWidget(
      {Key? key, required this.boardWidget, required this.keyBoardwidget})
      : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    const String appName = 'சொல்லாடல்';
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
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
          // IconButton(
          //   onPressed: () {},
          //   icon: Image.asset(
          //     'assets/images/settings.png',
          //     height: 25,
          //     width: 25,
          //   ),
          //   color: appBarIconColor,
          // ),
          const Setting(),
        ],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [widget.boardWidget, widget.keyBoardwidget],
        ),
      ),
    );
  }
}
