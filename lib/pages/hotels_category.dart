import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../helper/custom_icon.dart';
import '../helper/custom_text.dart';

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
      ],
    );
  }
}
