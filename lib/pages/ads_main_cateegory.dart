import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../helper/custom_dailog.dart';
import '../helper/custom_icon.dart';

class AdsMainCategory extends StatelessWidget {
  const AdsMainCategory({super.key});

  @override
  Widget build(BuildContext context) {
    List list = GlobalMethods().listCatogryAddNewAds(context);
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
        body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: list.length,
          itemBuilder: (context, index) {
            if (list.isNotEmpty) {
              return ListTile(
                onTap: () {
                  navToPageOrShowDailogRenSaleList(context, index);
                },
                minVerticalPadding: 20.0,
                trailing: customIcon(
                    iconData: Icons.arrow_forward_ios, color: mainColor),
                title: customText(
                    text: list[index],
                    textAlign: TextAlign.justify,
                    textColor: mainColor,
                    textFontSize: 18.0,
                    textWeight: FontWeight.bold),
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: mainColor,
              ));
            }
          },
        ),
      ),
    );
  }

  // this method for check if will nav to specifc screen or show dailog rent sale list
  void navToPageOrShowDailogRenSaleList(BuildContext context, int index) {
    int length = GlobalMethods().listCatogryAddNewAds(context).length;
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
          listOfItemVal = 0;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog().saleRentElseAdsNewAdd(context, list4Item);
              });
          break;
        case 1:
          listOfItemVal = 1;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
              });
          break;
        case 2:
          listOfItemVal = 20;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
              });
          break;
        case 3:
          listOfItemVal = 21;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
              });
          break;
        case 4:
          // hotel
          null;
          break;
        default:
          null;
          break;
      }
    } else if (length == 6) {
      //vehicle
      switch (index) {
        case 0:
          listOfItemVal = 2;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 1:
          listOfItemVal = 3;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 2:
          listOfItemVal = 4;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 3:
          listOfItemVal = 5;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 4:
          listOfItemVal = 6;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 5:
          GlobalMethods()
              .pushToNewScreen(context: context, routeName: toResAllReal);
          break;
        default:
          null;
          break;
      }
    } else if (length == 4) {
      //hotels
      switch (index) {
        case 0:
          listOfItemVal = 7;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });

          break;
        case 1:
          listOfItemVal = 8;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 2:
          listOfItemVal = 9;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDailog()
                    .customDailogSaleRentElse(context, list2Item);
              });
          break;
        case 3:
          listOfItemVal = 10;
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
