// this screen for diplay last 48 hour ads from data base

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_grid.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/pages/main_category.dart';
import 'package:evpazarlama/pages/result_all_real.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helper/custom_text.dart';
import '../helper/custom_container.dart';

class LastAds extends StatelessWidget {
  const LastAds({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalMethods().filter48List();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(
              textAlign: TextAlign.start,
              text: AppLocalizations.of(context)!.subNewstAds),
        ),
        drawer: customDrawer(context),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ResultAds(list: listAds48Houer);
                }));
              },
              trailing: SizedBox(
                width: 60.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customText(
                        text: '(${listAds48Houer.length})',
                        textColor: Colors.blueGrey,
                        textAlign: TextAlign.center),
                    customIcon(
                        iconData: Icons.arrow_forward_ios_sharp,
                        color: mainColor)
                  ],
                ),
              ),
              title: customText(
                  text: AppLocalizations.of(context)!.all48houer,
                  textColor: mainColor,
                  textAlign: TextAlign.justify),
            ),
            ListTile(
              onTap: () {
                mainCatogry = 0;
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return MainCategory(
                    list: list48AllRealEstate,
                  );
                }));
              },
              trailing: SizedBox(
                width: 60.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customText(
                        text: '(${list48AllRealEstate.length})',
                        textColor: Colors.blueGrey,
                        textAlign: TextAlign.center),
                    customIcon(
                        iconData: Icons.arrow_forward_ios_sharp,
                        color: mainColor)
                  ],
                ),
              ),
              title: customText(
                  text: AppLocalizations.of(context)!.realestate,
                  textColor: mainColor,
                  textAlign: TextAlign.justify),
            ),
            ListTile(
              onTap: () {
                mainCatogry = 1;
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return MainCategory(
                    list: list48AllVehicles,
                  );
                }));
              },
              trailing: SizedBox(
                width: 60.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customText(
                        text: '(${list48AllVehicles.length})',
                        textColor: Colors.blueGrey,
                        textAlign: TextAlign.center),
                    customIcon(
                        iconData: Icons.arrow_forward_ios_sharp,
                        color: mainColor)
                  ],
                ),
              ),
              title: customText(
                  text: AppLocalizations.of(context)!.vehicles,
                  textColor: mainColor,
                  textAlign: TextAlign.justify),
            ),
            ListTile(
              onTap: () {
                mainCatogry = 2;
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return MainCategory(
                    list: list48AllHotels,
                  );
                }));
              },
              trailing: SizedBox(
                width: 60.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customText(
                        text: '(${list48AllHotels.length})',
                        textColor: Colors.blueGrey,
                        textAlign: TextAlign.center),
                    customIcon(
                        iconData: Icons.arrow_forward_ios_sharp,
                        color: mainColor)
                  ],
                ),
              ),
              title: customText(
                  text: AppLocalizations.of(context)!.hotel,
                  textColor: mainColor,
                  textAlign: TextAlign.justify),
            ),
            // titel all 48 houer ads
            customContainer(
              spaceAroundTopMargin: 20.0,
              borderColor: const Color.fromARGB(255, 161, 204, 226),
              borderWidth: 1.0,
              colorBack: const Color.fromARGB(255, 230, 177, 160),
              child: customText(
                  text: AppLocalizations.of(context)!.subNewstAds,
                  textAlign: TextAlign.justify,
                  textWeight: FontWeight.bold,
                  textColor: mainColor),
            ),
            listAds48Houer.isEmpty
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                 
                    children: [
                    customSpacer(height: 90.0),
                      customText(
                          text: AppLocalizations.of(context)!.noFound,
                          textColor: mainColor),
                        const  CircularProgressIndicator(color: mainColor,)
                    ],
                  )
                : CustomGrid().customGrid(context, listAds48Houer),
          ],
        ),
      ),
    );
  }
}
