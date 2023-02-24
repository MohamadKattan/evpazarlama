// this screen for display ads of type urgent from database 

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helper/config.dart';
import '../../helper/custom_text.dart';

class UrgentScrren extends StatelessWidget {
  const UrgentScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: false,
        title: customText(
            textAlign: TextAlign.start,
            text: AppLocalizations.of(context)!.urgent),
      ),
      drawer: customDrawer(context),
      body: const Center(child: Text("Dev")),
    ));
  }
}
