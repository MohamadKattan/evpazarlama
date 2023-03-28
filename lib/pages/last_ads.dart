// this screen for diplay last 48 hour ads from data base

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helper/custom_text.dart';

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
        body: listAds48Houer.isNotEmpty
            ? ListView.builder(
                itemCount: listAds48Houer.length,
                itemBuilder: (_, index) {
                  return Center(
                      child: Text('index ${listAds48Houer[index].adsNumber}'));
                })
            :  Center(
                child: Column(
                  children: [
                   const CircularProgressIndicator(color: mainColor,),
                    Text(AppLocalizations.of(context)!.empty),
                  ],
                ),
              ),
      ),
    );
  }
}
