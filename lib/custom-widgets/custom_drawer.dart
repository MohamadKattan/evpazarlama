// this widget is a custom drawer

import 'package:evpazarlama/custom-widgets/list_home_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              onTap: () {
                GlobalMethods().navToLoginOrProfile(context);
              },
              minLeadingWidth: 10.0,
              trailing: customIcon(iconData: Icons.arrow_forward_ios),
              leading: cutomImageIcon(imagePath: 'user.png'),
              title: customText(
                  text: userId == 'null'
                      ? AppLocalizations.of(context)!.singup
                      : AppLocalizations.of(context)!.myProfile,
                  textAlign: TextAlign.justify,
                  textFontSize: 18.0,
                  textWeight: FontWeight.bold),
              subtitle: customText(
                  text: userId == 'null'
                      ? AppLocalizations.of(context)!.unRigister
                      : '(${userInfoProfile?.userName ?? '...***...'})',
                  textAlign: TextAlign.justify,
                  textFontSize: 12.0,
                  textColor: Colors.black38),
            ),
            ListTile(
              onTap: () {
                GlobalMethods().navToAddNewAdsIfSingIn(context);
              },
              minLeadingWidth: 10.0,
              trailing: customIcon(iconData: Icons.arrow_forward_ios),
              leading: cutomImageIcon(imagePath: 'plus.png'),
              title: customText(
                  text: AppLocalizations.of(context)!.newAds,
                  textAlign: TextAlign.justify,
                  textFontSize: 18.0,
                  textWeight: FontWeight.bold),
              subtitle: customText(
                  text: '(${AppLocalizations.of(context)!.subNewAds})',
                  textAlign: TextAlign.justify,
                  textFontSize: 12.0,
                  textColor: Colors.black38),
            ),
            ListTile(
              onTap: () {
                GlobalMethods().pushReplaceToNewScreen(
                    context: context, routeName: toHomeScreen);
              },
              minLeadingWidth: 10.0,
              leading: cutomImageIcon(imagePath: 'homepage.png'),
              trailing: customIcon(iconData: Icons.arrow_forward_ios),
              title: customText(
                  text: AppLocalizations.of(context)!.homePage,
                  textAlign: TextAlign.justify,
                  textFontSize: 18.0,
                  textWeight: FontWeight.bold),
              subtitle: customText(
                  text: '(${AppLocalizations.of(context)!.subhomePage})',
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
