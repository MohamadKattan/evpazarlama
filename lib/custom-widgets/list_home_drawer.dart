import 'package:flutter/material.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            text: AppLocalizations.of(context)!.realestate,
            textAlign: TextAlign.justify,
            textColor: mainColor,
            textFontSize: 18.0,
            textWeight: FontWeight.bold),
        subtitle: customText(
            text: AppLocalizations.of(context)!.subRealestate,
            textAlign: TextAlign.justify,
            textFontSize: 12.0,
            overflow: TextOverflow.ellipsis,
            textColor: Colors.black38),
      ),
      ListTile(
        onTap: () => popFromScreen(context),
        minLeadingWidth: 10.0,
        leading: cutomImageIcon(imagePath: 'steering-wheel.png'),
        trailing:
            customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
        title: customText(
            text: AppLocalizations.of(context)!.vehicles,
            textAlign: TextAlign.justify,
            textFontSize: 18.0,
            textColor: mainColor,
            textWeight: FontWeight.bold),
        subtitle: customText(
            text: AppLocalizations.of(context)!.subVehicles,
            textAlign: TextAlign.justify,
            textFontSize: 12.0,
            overflow: TextOverflow.ellipsis,
            textColor: Colors.black38),
      ),
      ListTile(
        onTap: () => popFromScreen(context),
        minLeadingWidth: 10.0,
        leading: cutomImageIcon(imagePath: 'hotel.png'),
        trailing:
            customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
        title: customText(
            text: AppLocalizations.of(context)!.hotel,
            textAlign: TextAlign.justify,
            textFontSize: 18.0,
            textColor: mainColor,
            textWeight: FontWeight.bold),
        subtitle: customText(
            text: AppLocalizations.of(context)!.subHotel,
            textAlign: TextAlign.justify,
            textFontSize: 12.0,
            overflow: TextOverflow.ellipsis,
            textColor: Colors.black38),
      ),
      ListTile(
        onTap: () => popFromScreen(context),
        minLeadingWidth: 10.0,
        leading: cutomImageIcon(imagePath: '24-hours.png'),
        trailing:
            customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
        title: customText(
            text: AppLocalizations.of(context)!.newstAds,
            textAlign: TextAlign.justify,
            textColor: mainColor,
            textFontSize: 18.0,
            textWeight: FontWeight.bold),
        subtitle: customText(
            text: AppLocalizations.of(context)!.subNewstAds,
            textAlign: TextAlign.justify,
            textFontSize: 12.0,
            overflow: TextOverflow.ellipsis,
            textColor: Colors.black38),
      ),
      ListTile(
        onTap: () => popFromScreen(context),
        minLeadingWidth: 10.0,
        leading: cutomImageIcon(imagePath: 'funds.png'),
        trailing:
            customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
        title: customText(
            text: AppLocalizations.of(context)!.urgent,
            textAlign: TextAlign.justify,
            textColor: mainColor,
            textFontSize: 18.0,
            textWeight: FontWeight.bold),
        subtitle: customText(
            text: AppLocalizations.of(context)!.subUrgent,
            textAlign: TextAlign.justify,
            textFontSize: 12.0,
            overflow: TextOverflow.ellipsis,
            textColor: Colors.black38),
      ),
    ],
  );
}
