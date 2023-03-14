// for display list of item while start push ads
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../custom-widgets/custom_drawer.dart';
import '../global-methods/methods.dart';
import '../helper/config.dart';
import '../helper/custom_icon.dart';
import '../helper/custom_text.dart';
import '../state-maneg/string_val.dart';

class AdsListOfItem extends StatelessWidget {
  const AdsListOfItem({super.key});

  @override
  Widget build(BuildContext context) {
    List list = GlobalMethods().typeOfListItem(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
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
            itemBuilder: (_, index) {
              if (list.isNotEmpty) {
                return ListTile(
                  onTap: () {
                    navToDaitelsPage(context);
                    context.read<StringVal>().updateSubCatogryVal(list[index]);
                  },
                  minLeadingWidth: 10.0,
                  leading: listOfItemVal > 2
                      ? cutomImageIcon(imagePath: '${list[index]}.png')
                      : const SizedBox(),
                  trailing: customIcon(
                      iconData: Icons.arrow_forward_ios, color: mainColor),
                  title: customText(
                      text: list[index],
                      textAlign: TextAlign.justify,
                      textFontSize: 18.0,
                      textColor: mainColor,
                      textWeight: FontWeight.bold),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(color: mainColor));
              }
            }),
      ),
    );
  }

  /* 
  this method for push to daitels page after check listOfItemVal 
  if listOfItemVal = 0 => houseing , if listOfItemVal = 1 => workPlace 
  if listOfItemVal = 2 motor , if listOfItemVal = 1 => cars ......
  */
  void navToDaitelsPage(BuildContext context) {
    if (listOfItemVal == 0) {
      // houseing item
      GlobalMethods().pushReplaceToNewScreen(
          context: context, routeName: toAdsDetailsHoseing);
    } else if (listOfItemVal == 1) {
      // work place items
      GlobalMethods().pushReplaceToNewScreen(
          context: context, routeName: toAdsDetailsWorkPlace);
    } else if (listOfItemVal > 1 && listOfItemVal < 7) {
      // motor and cars items
      GlobalMethods().pushReplaceToNewScreen(
          context: context, routeName: toAdsDetailsVehicles);
    } else {
      return;
    }
  }
}
