// this screen for display realSatae category

import 'package:evpazarlama/custom-widgets/custom_dailog.dart';
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../global-methods/methods.dart';
import '../../helper/custom_container.dart';
import '../../helper/custom_icon.dart';

class RealEstateCategory extends StatelessWidget {
  const RealEstateCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(
            textAlign: TextAlign.start,
            text: AppLocalizations.of(context)!.categorySelection,
          ),
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
    final list4Item = [
      AppLocalizations.of(context)!.sale,
      AppLocalizations.of(context)!.rent,
      AppLocalizations.of(context)!.daylyRent,
      AppLocalizations.of(context)!.transferSale,
    ];
    final list2Item = [
      AppLocalizations.of(context)!.sale,
      AppLocalizations.of(context)!.rent
    ];
    return Column(
      children: [
        ListTile(
          onTap: () async {
            pushToNewScreen(context: context, routeName: toResAllReal);
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.allReal,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () {
            listOfItemVal = 0;
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return customDailogSaleRentElse(context, list4Item);
                });
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.allHome,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () {
            listOfItemVal = 1;
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return customDailogSaleRentElse(context, list2Item);
                });
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.workPlace,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return customDailogSaleRentElse(context, list2Item);
                });
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.land,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return customDailogSaleRentElse(context, list2Item);
                });
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.building,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () {
            pushToNewScreen(context: context, routeName: toHotelsCategory);
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.hotel,
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
