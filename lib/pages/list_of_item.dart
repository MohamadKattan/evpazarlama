/* this screen will display list of items after choces catpgry
 housing,workPlace,land,bulding,cars, else.... and sale,rent or else*/
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../global-methods/methods.dart';
import '../../helper/config.dart';
import '../../helper/custom_icon.dart';
import '../../helper/custom_text.dart';

class ListOfIteam extends StatelessWidget {
  const ListOfIteam({super.key});

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
            body: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: GlobalMethods().typeOfListItem(context).length,
                itemBuilder: (_, index) {
                  if (GlobalMethods().typeOfListItem(context).isNotEmpty) {
                    return ListTile(
                      onTap: () {},
                      minLeadingWidth: 10.0,
                      leading: listOfItemVal > 2
                          ? cutomImageIcon(
                              imagePath:
                                  '${GlobalMethods().typeOfListItem(context)[index]}.png')
                          : const SizedBox(),
                      trailing: customIcon(
                          iconData: Icons.arrow_forward_ios, color: mainColor),
                      title: customText(
                          text: GlobalMethods().typeOfListItem(context)[index],
                          textAlign: TextAlign.justify,
                          textFontSize: 18.0,
                          textColor: mainColor,
                          textWeight: FontWeight.bold),
                    );
                  } else {
                    return const CircularProgressIndicator(color: mainColor);
                  }
                })));
  }
}
