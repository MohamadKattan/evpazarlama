import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../helper/custom_text.dart';

class LastAds extends StatelessWidget {
  const LastAds({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(
              textAlign: TextAlign.start,
              text: AppLocalizations.of(context)!.newstAds),
        ),
        drawer: customDrawer(context),
        body: const Center(child: Text("DEV")),
      ),
    );
  }
}
