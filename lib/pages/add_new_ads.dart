import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../global-methods/methods.dart';
import '../helper/custom_icon.dart';

class AddNewAds extends StatelessWidget {
  const AddNewAds({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: false,
          title: customText(
              text: AppLocalizations.of(context)!.newAds,
              textWeight: FontWeight.bold),
        ),
        drawer: customDrawer(context),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              onTap: () async {
                mainCatogry = 0;
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsMainCategory);
              },
              minLeadingWidth: 10.0,
              leading: cutomImageIcon(imagePath: 'home.png'),
              trailing: customIcon(
                  iconData: Icons.arrow_forward_ios, color: mainColor),
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
              onTap: () {
                mainCatogry = 1;
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsMainCategory);
              },
              minLeadingWidth: 10.0,
              leading: cutomImageIcon(imagePath: 'steering-wheel.png'),
              trailing: customIcon(
                  iconData: Icons.arrow_forward_ios, color: mainColor),
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
              onTap: () {
                mainCatogry = 2;
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsMainCategory);
              },
              minLeadingWidth: 10.0,
              leading: cutomImageIcon(imagePath: 'hotel.png'),
              trailing: customIcon(
                  iconData: Icons.arrow_forward_ios, color: mainColor),
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
          ],
        ),
      ),
    );
  }
}
