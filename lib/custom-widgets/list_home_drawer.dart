import 'package:flutter/material.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_text.dart';

import '../global-methods/methods.dart';

Widget mainItemsHomeDrawer(BuildContext context) {
  return Column(
    children: [
      ListTile(
        onTap: () => popFromScreen(context),
        minLeadingWidth: 10.0,
        leading: cutomImageIcon(imagePath: 'home.png'),
        trailing:
            customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
        title: customText(
            text: "Homes",
            textAlign: TextAlign.justify,
            textColor: mainColor,
            textFontSize: 18.0,
            textWeight: FontWeight.bold),
        subtitle: customText(
            text: '(sale-rent)',
            textAlign: TextAlign.justify,
            textFontSize: 12.0,
            textColor: Colors.black38),
      ),
      ListTile(
        onTap: () => popFromScreen(context),
        minLeadingWidth: 10.0,
        leading: cutomImageIcon(imagePath: 'steering-wheel.png'),
        trailing:
            customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
        title: customText(
            text: "Cars",
            textAlign: TextAlign.justify,
            textFontSize: 18.0,
            textColor: mainColor,
            textWeight: FontWeight.bold),
        subtitle: customText(
            text: '(sale-rent)',
            textAlign: TextAlign.justify,
            textFontSize: 12.0,
            textColor: Colors.black38),
      ),
      ListTile(
        onTap: () => popFromScreen(context),
        minLeadingWidth: 10.0,
        leading: cutomImageIcon(imagePath: 'hotel.png'),
        trailing:
            customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
        title: customText(
            text: "Hotels",
            textAlign: TextAlign.justify,
            textFontSize: 18.0,
            textColor: mainColor,
            textWeight: FontWeight.bold),
        subtitle: customText(
            text: '(rent-sale)',
            textAlign: TextAlign.justify,
            textFontSize: 12.0,
            textColor: Colors.black38),
      ),
      ListTile(
        onTap: () => popFromScreen(context),
        minLeadingWidth: 10.0,
        leading: cutomImageIcon(imagePath: '24-hours.png'),
        trailing:
            customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
        title: customText(
            text: "Newest ads",
            textAlign: TextAlign.justify,
            textColor: mainColor,
            textFontSize: 18.0,
            textWeight: FontWeight.bold),
        subtitle: customText(
            text: '(Last 48 houer)',
            textAlign: TextAlign.justify,
            textFontSize: 12.0,
            textColor: Colors.black38),
      ),
      ListTile(
        onTap: () => popFromScreen(context),
        minLeadingWidth: 10.0,
        leading: cutomImageIcon(imagePath: 'funds.png'),
        trailing:
            customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
        title: customText(
            text: "Funds Funds !!",
            textAlign: TextAlign.justify,
            textColor: mainColor,
            textFontSize: 18.0,
            textWeight: FontWeight.bold),
        subtitle: customText(
            text: '(Emargancy sale with discount)',
            textAlign: TextAlign.justify,
            textFontSize: 12.0,
            textColor: Colors.black38),
      ),
    ],
  );
}
