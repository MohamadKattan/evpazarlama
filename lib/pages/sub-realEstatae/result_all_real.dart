// this screen for display all ads of type realState from database(salae rent ...)

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            text: AppLocalizations.of(context)!.allReal),
        actions: [
          customIcon(iconData: Icons.search),
        ],
      ),
      drawer: customDrawer(context),
      body: const Center(child: Text('dev res all real ads')),
    ));
  }
}
