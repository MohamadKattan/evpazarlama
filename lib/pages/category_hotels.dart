// this screen for hotels category

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helper/custom_icon.dart';
import '../../helper/custom_text.dart';
import '../helper/custom_container.dart';
import '../helper/custom_spacer.dart';

class HotelsCategory extends StatelessWidget {
  const HotelsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(
              textAlign: TextAlign.start,
              text: AppLocalizations.of(context)!.categorySelection),
        ),
        drawer: customDrawer(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: listofItim(context),
        ),
      ),
    );
  }

  Widget listofItim(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () async {},
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.allHotels,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () {},
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.hotel,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () {},
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.resorts,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () {},
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.touristCottages,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () {},
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.hotelAppartments,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
             customSpacer(height: 20.0),
        // titel all ads
        customContainer(
          alignment: Alignment.centerLeft,
          colorBack: greyColor,
          child: customText(
              text: AppLocalizations.of(context)!.allAdsVitrin,
              textColor: mainColor),
        ),
        customSpacer(height: 20.0),
        // grid 20 item from all ads
        customContainer(
            spaceAroundTop: 100.0,
            spaceAroundBottomMargin: 20.0,
            colorBack: Colors.red,
            child: customText(text: "dev")),
      ],
    );
  }
}
