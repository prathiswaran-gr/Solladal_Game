import 'package:flutter/material.dart';
import 'package:solladal/audioEnableButton.dart';

import 'package:solladal/config/colors.dart';
import 'package:solladal/themeChangeButton.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _showModalBottomSheet();
      },
      icon: Image.asset(
        'assets/images/settings.png',
        height: 25,
        width: 25,
      ),
      color: appBarIconColor,
    );
  }

  _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: 400,
            width: double.infinity,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    const Text(
                      "SETTINGS",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close_rounded),
                       ),
                  ],
                ),
                ThemeChangeButton(),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: blackShade, width: 1),
                    ),
                  ),
                ),
                AudioButton()
              ],
            ));
      },
    );
  }
}
