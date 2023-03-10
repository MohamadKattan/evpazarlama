// Home screen of app

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/custom-widgets/list_home_drawer.dart';
import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_container.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
            drawer: customDrawer(context),
            appBar: AppBar(
              backgroundColor: mainColor,
              title: customText(text: "evpazarlama.com", textColor: defColor),
              centerTitle: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      GlobalMethods().navToAddNewAdsIfSingIn(context);
                    },
                    child: Row(
                      children: [
                        customText(
                          text: AppLocalizations.of(context)!.newAds,
                          textFontSize: 14.0,
                        ),
                        customSpacer(width: 8.0),
                        cutomImageIcon(
                            imagePath: 'plus.png', width: 20.0, height: 20.0),
                      ],
                    ),
                  ),
                )
              ],
            ),
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                // search container
                customContainer(
                  spaceAroundTopMargin: 15.0,
                  spaceAroundBottomMargin: 15.0,
                  spaceAroundLeftMargin: 20.0,
                  spaceAroundRightMargin: 20.0,
                  borderColor: mainColor,
                  borderWidth: 1.5,
                  alignment: Alignment.centerLeft,
                  colorBack: defColor,
                  child: Row(
                    children: [
                      customIcon(
                          iconData: Icons.search,
                          color: Colors.grey,
                          size: 30.0),
                      customSpacer(width: 10.0),
                      customText(
                          text: AppLocalizations.of(context)!.serchAdsNum,
                          textColor: Colors.grey),
                    ],
                  ),
                ),
                //emptyContiner
                customContainer(
                  alignment: Alignment.center,
                  colorBack: greyColor,
                  child: customText(text: "", textColor: mainColor),
                ),
                // main sections
                mainItemsHomeDrawer(context),
                // titel all ads
                customContainer(
                  alignment: Alignment.centerLeft,
                  colorBack: greyColor,
                  child: customText(
                      text: AppLocalizations.of(context)!.allAdsVitrin,
                      textColor: mainColor),
                ),
                // grid 20 item from all ads
                customContainer(
                    spaceAroundTop: 100.0,
                    spaceAroundBottomMargin: 20.0,
                    colorBack: Colors.red,
                    child: customText(text: "dev")),
                // title last visted ads
                customContainer(
                  alignment: Alignment.centerLeft,
                  colorBack: greyColor,
                  child: customText(
                      text: AppLocalizations.of(context)!.lastAdsVisted,
                      textColor: mainColor),
                ),
                // grid from last visted ads
                customContainer(
                    spaceAroundTop: 100.0,
                    spaceAroundBottomMargin: 100.0,
                    colorBack: Colors.red,
                    child: customText(text: "dev")),
              ],
            )),
      ),
    );
  }
}
