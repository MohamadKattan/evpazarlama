import 'dart:io';

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../helper/config.dart';
import '../helper/custom_positioned.dart';
import '../helper/custom_text.dart';
import '../state-maneg/image_val.dart';

class CheckInfoAds extends StatelessWidget {
  const CheckInfoAds({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(text: AppLocalizations.of(context)!.checkInfoAds),
        ),
        drawer: customDrawer(context),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: customText(
                    text: AppLocalizations.of(context)!.checkInfoAdsDce,
                    textColor: mainColor,
                    textFontSize: 18.0,
                    textWeight: FontWeight.bold),
              ),
              prviewOfImage(context),
              customPositioned(
                top: 200.0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 50 / 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: listCheckInfoAds.length,
                    itemBuilder: (_, index) {
                      if (listCheckInfoAds.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customText(
                              text: listCheckInfoAds[index].toString(),
                              textColor: mainColor,
                              textAlign: TextAlign.justify),
                        );
                      } else {
                        return const Text('null');
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // this widget will display if list image not empty
  Widget prviewOfImage(BuildContext context) {
    final list = context.watch<ImageVal>().imageFileList;
    return list != null
        ? customPositioned(
            right: 0.0,
            left: 0.0,
            top: 100,
            child: Container(
              color: Colors.brown.shade100.withOpacity(0.3),
              height: 100.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: list.length > 10 ? 10 : list.length,
                  itemBuilder: (_, index) {
                    if (list.isNotEmpty) {
                      return Container(
                          height: 120.0,
                          margin: const EdgeInsets.all(12.0),
                          color: Colors.brown.shade200,
                          child: Image.file(
                            File(list[index].path),
                            fit: BoxFit.cover,
                            height: 90,
                            width: 90,
                          ));
                    } else {
                      return const SizedBox();
                    }
                  }),
            ),
          )
        : const SizedBox();
  }
}
