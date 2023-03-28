// Home screen of app

import 'package:evpazarlama/client-srv/database_srv.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                        iconData: Icons.search, color: Colors.grey, size: 30.0),
                    customSpacer(width: 10.0),
                    customText(
                        text: AppLocalizations.of(context)!.serchAdsNum,
                        textColor: Colors.grey),
                  ],
                ),
              ),
              //emptyContiner
              customContainer(
                height: 10.0,
                alignment: Alignment.center,
                colorBack: greyColor,
                child: customText(text: "", textColor: mainColor),
              ),
              // main sections
              mainItemsHomeDrawer(context),
              // titel all ads
              customContainer(
                borderColor: const Color.fromARGB(255, 161, 204, 226),
                borderWidth: 1.0,
                colorBack: const Color.fromARGB(255, 230, 177, 160),
                child: customText(
                    text: AppLocalizations.of(context)!.allAdsVitrin,
                    textAlign: TextAlign.justify,
                    textWeight: FontWeight.bold,
                    textColor: mainColor),
              ),
              // grid 20 item from all ads
              DataBaseSrv().streamGetAllAds(),
              // title last visted ads
              customContainer(
                borderColor: const Color.fromARGB(255, 161, 204, 226),
                borderWidth: 1.0,
                colorBack: const Color.fromARGB(255, 230, 177, 160),
                child: customText(
                    text: AppLocalizations.of(context)!.lastAdsVisted,
                    textColor: mainColor,
                    textWeight: FontWeight.bold,
                    textAlign: TextAlign.justify),
              ),
              // grid from last visted ads
              customContainer(
                  spaceAroundTop: 300.0,
                  spaceAroundBottomMargin: 100.0,
                  colorBack: Colors.blueGrey.shade100,
                  child: customText(text: "dev")),
            ],
          ),
        ),
      ),
    );
  }
}
