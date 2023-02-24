// this screen will display list of items home-casle vaiila and else
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helper/config.dart';
import '../../helper/custom_text.dart';

class ListOfIteamRealEstate extends StatelessWidget {
  const ListOfIteamRealEstate({super.key});

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
      body: Center(
        child: Text(trxt()),
      ),
    ));
  }
}

// this method for check val what user slect from sale or else type
String trxt() {

  String? text;
  switch (valOfTyperealEstate) {
    case 0:
      text = "for sale";
      break;
    case 1:
      text = "for rent";
      break;
    case 2:
      text = "for daily rent";
      break;
    case 3:
      text = "Else";
      break;
    default:
      text = "default";
      break;
  }
  return text;
}
