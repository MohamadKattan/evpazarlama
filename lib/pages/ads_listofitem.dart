import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../custom-widgets/custom_drawer.dart';
import '../global-methods/methods.dart';
import '../helper/config.dart';
import '../helper/custom_icon.dart';
import '../helper/custom_text.dart';

class AdsListOfItem extends StatelessWidget {
  const AdsListOfItem({super.key});

  @override
  Widget build(BuildContext context) {
    List list = GlobalMethods().typeOfListItem(context);
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
              itemBuilder: (_, index) {
                if (list.isNotEmpty) {
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
              })),
    );
  }
}
