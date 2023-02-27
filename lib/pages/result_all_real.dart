// this screen for display all ads of type realState from database(salae rent ...)

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_flout.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../helper/custom_spacer.dart';

class ResAllRealState extends StatelessWidget {
  const ResAllRealState({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: false,
        title: customText(
            textAlign: TextAlign.start,
            text: AppLocalizations.of(context)!.resultSearching),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  customText(
                    text: AppLocalizations.of(context)!.filter,
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
      drawer: customDrawer(context),
      floatingActionButton: customFloutButton(
          function: () => null,
          child: customIcon(iconData: Icons.location_pin)),
      body: const Center(child: Text('dev res all real ads')),
    ));
  }
}
