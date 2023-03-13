// this screen for display realSatae category

import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../global-methods/methods.dart';
import '../../helper/custom_icon.dart';
import '../helper/custom_container.dart';
import '../helper/custom_spacer.dart';

class MainCategory extends StatelessWidget {
  const MainCategory({super.key});

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
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 55 / 100,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount:
                    GlobalMethods().typeOfListMainCatogry(context).length,
                itemBuilder: (context, index) {
                  if (GlobalMethods()
                      .typeOfListMainCatogry(context)
                      .isNotEmpty) {
                    return ListTile(
                      onTap: () async {
                        navToPageOrShowDailogRenSaleList(context, index);
                      },
                      minLeadingWidth: 10.0,
                      trailing: customIcon(
                          iconData: Icons.arrow_forward_ios, color: mainColor),
                      title: customText(
                          text: GlobalMethods()
                              .typeOfListMainCatogry(context)[index],
                          textAlign: TextAlign.justify,
                          textColor: mainColor,
                          textFontSize: 18.0,
                          textWeight: FontWeight.bold),
                    );
                  } else {
                    return const CircularProgressIndicator(color: mainColor);
                  }
                },
              ),
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
        ),
      ),
    );
  }

  // this method for check if will nav to specifc screen or show dailog rent sale list
  void navToPageOrShowDailogRenSaleList(BuildContext context, int index) {
    int length = GlobalMethods().typeOfListMainCatogry(context).length;
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
    if (length == 5) {
      //Estata
      switch (index) {
        case 0:
          GlobalMethods()
              .pushToNewScreen(context: context, routeName: toResAllReal);
          break;
        case 1:
          listOfItemVal = 0;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list4Item);
              });
          break;
        case 2:
          listOfItemVal = 1;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 3:
          listOfItemVal = 20;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 4:
          listOfItemVal = 21;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        default:
          null;
          break;
      }
    } else if (length == 7) {
      //vehicle
      switch (index) {
        case 0:
          GlobalMethods()
              .pushToNewScreen(context: context, routeName: toResAllReal);
          break;
        case 1:
          listOfItemVal = 2;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 2:
          listOfItemVal = 3;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 3:
          listOfItemVal = 4;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 4:
          listOfItemVal = 5;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 5:
          listOfItemVal = 6;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 6:
          GlobalMethods()
              .pushToNewScreen(context: context, routeName: toResAllReal);
          break;
        default:
          null;
          break;
      }
    } else if (length == 6) {
      //hotels
      switch (index) {
        case 0:
          GlobalMethods()
              .pushToNewScreen(context: context, routeName: toResAllReal);
          break;
        case 1:
          listOfItemVal = 7;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });

          break;
        case 2:
          listOfItemVal = 8;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 3:
          listOfItemVal = 9;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 4:
          listOfItemVal = 10;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 5:
          listOfItemVal = 11;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
      }
    } else {
      return;
    }
  }
}
