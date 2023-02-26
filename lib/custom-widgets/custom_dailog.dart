// this custom dailog for diplay list of chosses

import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_container.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../global-methods/methods.dart';
import '../helper/custom_icon.dart';

// not typeOfList parmetr for knows any list iterm will diplay (homw item or workPlacIte or ,,,)

Widget customDailogSaleRentElse(BuildContext context, List item) {
  return Dialog(
    elevation: 0.9,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    backgroundColor: Colors.transparent,
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      customContainer(
          colorBack: mainColor,
          ridusl: 16.0,
          ridusR: 16.0,
          child: Row(
            children: [
              IconButton(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  onPressed: () {
                    popFromScreen(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.red),
              customText(text: AppLocalizations.of(context)!.categorySelection),
            ],
          )),
      customContainer(
        height: item.length > 2 ? 250 : 175,
        width: double.infinity,
        colorBack: Colors.white,
        ridusBL: 16.0,
        ridusBR: 16.0,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: item.length,
            itemBuilder: (_, index) {
              if (item.isNotEmpty) {
                return ListTile(
                  onTap: ()  {
                     switchToAnyTypeRealEstate(context,index);
                  },
                  minLeadingWidth: 10.0,
                  trailing: customIcon(
                      iconData: Icons.arrow_forward_ios, color: mainColor),
                  title: customText(
                      text: item[index],
                      textAlign: TextAlign.justify,
                      textFontSize: 18.0,
                      textColor: mainColor,
                      textWeight: FontWeight.bold),
                );
              } else {
                const CircularProgressIndicator(color: mainColor);
              }
              return const CircularProgressIndicator(color: mainColor);
            }),
      ),
    ]),
  );
}

// this method to know user any type he want sale / rent / daily rent or else
void switchToAnyTypeRealEstate(BuildContext context, int index)  {
  // val = 0 sale , 1 rent , 2 dailyrent,3 tranfer sale
  switch (index) {
    case 0:
      saleRentElseVal = 0;
      popFromScreen(context);
      pushToNewScreen(context: context, routeName: toListOfIteamRealEstate);
      break;
    case 1:
      saleRentElseVal = 1;
      popFromScreen(context);
      pushToNewScreen(context: context, routeName: toListOfIteamRealEstate);
      break;
    case 2:
      saleRentElseVal = 2;
      popFromScreen(context);
      pushToNewScreen(context: context, routeName: toListOfIteamRealEstate);
      break;
    case 3:
      saleRentElseVal = 3;
      popFromScreen(context);
      pushToNewScreen(context: context, routeName: toListOfIteamRealEstate);
      break;
    default:
      saleRentElseVal = 0;
      popFromScreen(context);
      pushToNewScreen(context: context, routeName: toListOfIteamRealEstate);
      break;
  }
}
