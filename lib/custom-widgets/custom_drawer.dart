// this widget is a custom drawer

import 'package:evpazarlama/custom-widgets/list_home_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';

import '../global-methods/methods.dart';

Widget customDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        //header
        Container(
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(color: mainColor),
          child: Column(children: [
            customSpacer(height: 10.0),
            ListTile(
              minLeadingWidth: 10.0,
              trailing: customIcon(iconData: Icons.arrow_forward_ios),
              leading: cutomImageIcon(imagePath: 'user.png'),
              title: customText(
                  text: "My  profile",
                  textAlign: TextAlign.justify,
                  textFontSize: 18.0,
                  textWeight: FontWeight.bold),
              subtitle: customText(
                  text: '(UserName)',
                  textAlign: TextAlign.justify,
                  textFontSize: 12.0,
                  textColor: Colors.black38),
            ),
            ListTile(
              minLeadingWidth: 10.0,
              trailing: customIcon(iconData: Icons.arrow_forward_ios),
              leading: cutomImageIcon(imagePath: 'plus.png'),
              title: customText(
                  text: "Puplish ads",
                  textAlign: TextAlign.justify,
                  textFontSize: 18.0,
                  textWeight: FontWeight.bold),
              subtitle: customText(
                  text: '(new ads)',
                  textAlign: TextAlign.justify,
                  textFontSize: 12.0,
                  textColor: Colors.black38),
            ),
            ListTile(
              onTap: () => popFromScreen(context),
              minLeadingWidth: 10.0,
              leading: cutomImageIcon(imagePath: 'homepage.png'),
              trailing: customIcon(iconData: Icons.arrow_forward_ios),
              title: customText(
                  text: "Home page",
                  textAlign: TextAlign.justify,
                  textFontSize: 18.0,
                  textWeight: FontWeight.bold),
              subtitle: customText(
                  text: '(close)',
                  textAlign: TextAlign.justify,
                  textFontSize: 12.0,
                  textColor: Colors.black38),
            ),
          ]),
        ),
        //body
        mainItemsHomeDrawer(context)
      ],
    ),
  );
}
