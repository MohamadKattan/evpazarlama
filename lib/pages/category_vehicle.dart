// this screen for diplay items of vehicle category

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../custom-widgets/custom_dailog.dart';
import '../../helper/custom_icon.dart';
import '../helper/custom_container.dart';
import '../helper/custom_spacer.dart';

class VehicleCategory extends StatelessWidget {
  const VehicleCategory({super.key});

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
    ));
  }

// this widget for display category items cae,van,truck,else...
  Widget listofItim(BuildContext context) {
    final list2Item = [
      AppLocalizations.of(context)!.sale,
      AppLocalizations.of(context)!.rent
    ];
    return Column(
      children: [
        ListTile(
          onTap: () async {},
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.allVehicle,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
             ListTile(
          onTap: () {
            listOfItemVal = 2;
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
              text: AppLocalizations.of(context)!.motorCycle,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () {
            listOfItemVal = 3;
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
              text: AppLocalizations.of(context)!.cars,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
   
        ListTile(
          onTap: () {
            listOfItemVal = 4;
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
              text: AppLocalizations.of(context)!.minBus,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () {
            listOfItemVal = 5;
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
              text: AppLocalizations.of(context)!.electricCars,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () {
            listOfItemVal = 6;
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
              text: AppLocalizations.of(context)!.commercialCar,
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
              text: AppLocalizations.of(context)!.damagedVehicles,
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
