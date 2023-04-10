// Home screen of app

import 'package:evpazarlama/client-srv/database_srv.dart';
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/custom-widgets/list_home_drawer.dart';
import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_container.dart';
import 'package:evpazarlama/helper/custom_grid.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/helper/custom_text_field.dart';
import 'package:evpazarlama/state-maneg/booling_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static TextEditingController searchControler = TextEditingController();

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
                spaceAroundTopMargin: 10.0,
                spaceAroundBottomMargin: 10.0,
                spaceAroundLeftMargin: 10.0,
                spaceAroundRightMargin: 10.0,
                alignment: Alignment.centerLeft,
                colorBack: defColor,
                child: Consumer<BoolingVal>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<BoolingVal>().updateSearchBtn(false);
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (searchControler.text.isNotEmpty) {
                              GlobalMethods()
                                  .searachOneAd(searchControler.text, context);
                              searchControler.clear();
                            }
                          },
                          child: AnimatedContainer(
                            padding: const EdgeInsets.all(10.0),
                            duration: const Duration(milliseconds: 800),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color:
                                    value.searchButton ? mainColor : greyColor),
                            child: customIcon(
                                iconData: Icons.search,
                                color: defColor,
                                size: 30.0),
                          ),
                        ),
                        customSpacer(width: 10.0),
                        Expanded(
                          child: customTextFailed(
                            margin: 0.0,
                            controller: searchControler,
                            lable: AppLocalizations.of(context)!.serchAdsNum,
                            hintText: AppLocalizations.of(context)!.serchAdsNum,
                            inputType: TextInputType.number,
                            function: (String onChange) {
                              if (onChange.isEmpty) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                context
                                    .read<BoolingVal>()
                                    .updateSearchBtn(false);
                              } else {
                                context
                                    .read<BoolingVal>()
                                    .updateSearchBtn(true);
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  },
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
                colorBack: const Color.fromARGB(255, 240, 214, 205),
                child: customText(
                    text: AppLocalizations.of(context)!.allAdsVitrin,
                    textAlign: TextAlign.justify,
                    textWeight: FontWeight.bold,
                    textColor: mainColor),
              ),
              // grid 20 item from all ads
              DataBaseSrv().streamGetAllAds(),
              // title last visted ads
              listMyFavior.isNotEmpty
                  ? customContainer(
                      borderColor: const Color.fromARGB(255, 161, 204, 226),
                      borderWidth: 1.0,
                      colorBack: const Color.fromARGB(255, 240, 214, 205),
                      child: customText(
                          text: AppLocalizations.of(context)!.fievort,
                          textColor: mainColor,
                          textWeight: FontWeight.bold,
                          textAlign: TextAlign.justify),
                    )
                  : const SizedBox(),
              // grid from last listMyFavior ads
              listMyFavior.isNotEmpty
                  ? CustomGrid().customGrid(context, listMyFavior)
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
