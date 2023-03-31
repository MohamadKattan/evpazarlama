import 'dart:io';

import 'package:evpazarlama/client-srv/database_srv.dart';
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../global-methods/methods.dart';
import '../helper/config.dart';
import '../helper/custom_container.dart';
import '../helper/custom_positioned.dart';
import '../helper/custom_text.dart';
import '../state-maneg/booling_val.dart';
import '../state-maneg/image_val.dart';
import '../state-maneg/string_val.dart';

class CheckInfoAds extends StatelessWidget {
  const CheckInfoAds({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade100,
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
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(
                    top: 12.0, left: 8.0, right: 8.0),
                child: customText(
                    text: AppLocalizations.of(context)!.checkInfoAdsDce,
                    textAlign: TextAlign.center,
                    textColor: mainColor,
                    textFontSize: 16.0,
                    textWeight: FontWeight.bold),
              ),
              prviewOfImage(context),
              customPositioned(
                top: 155.0,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customText(
                            text:
                                '${AppLocalizations.of(context)!.adress} : \n${context.read<StringVal>().country ?? ''} - ${context.read<StringVal>().city ?? ''}',
                            textColor: mainColor,
                            textAlign: TextAlign.start),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customText(
                            text:
                                '${context.read<StringVal>().area ?? ''} - ${context.read<StringVal>().mainStraet ?? ''}',
                            textColor: mainColor,
                            textAlign: TextAlign.justify),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customText(
                            text:
                                '${context.read<StringVal>().straet ?? ''} - ${context.read<StringVal>().straetNo ?? ''}',
                            textColor: mainColor,
                            textAlign: TextAlign.justify),
                      )
                    ],
                  ),
                ),
              ),
              customPositioned(
                top: 300.0,
                child: customContainer(
                    spaceAroundTopMargin: 8.0,
                    spaceAroundBottomMargin: 8.0,
                    colorBack: Colors.grey,
                    width: MediaQuery.of(context).size.width,
                    height: 10),
              ),
              customPositioned(
                top: 310.0,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  height: MediaQuery.of(context).size.height * 25 / 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: listDetailsAds.length,
                    itemBuilder: (_, index) {
                      if (listDetailsAds.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customText(
                              text: listDetailsAds[index].toString(),
                              textColor: mainColor,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify),
                        );
                      } else {
                        return const Text('null');
                      }
                    },
                  ),
                ),
              ),
              customPositioned(
                right: 0.0,
                left: 0.0,
                bottom: 0.0,
                child: customContainer(
                  height: 60,
                  colorBack: Colors.black.withOpacity(0.9),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        children: [
                          customContainer(
                              colorBack: Colors.blueGrey.shade100,
                              ridusBL: 12.0,
                              ridusBR: 12.0,
                              ridusR: 12.0,
                              ridusl: 12.0,
                              width:
                                  MediaQuery.of(context).size.width * 40 / 100,
                              height: 20.0),
                          customContainer(
                            colorBack: mainColor,
                            width: MediaQuery.of(context).size.width * 40 / 100,
                            height: 20,
                            ridusBL: 12.0,
                            ridusBR: 12.0,
                            ridusR: 12.0,
                            ridusl: 12.0,
                          ),
                          customPositioned(
                              left: 0.0,
                              right: 0.0,
                              child: customText(text: '(4/4)'))
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          ppushAdsOrToPlanScreen(context);
                        },
                        child: customContainer(
                            colorBack: mainColor,
                            width: MediaQuery.of(context).size.width * 45 / 100,
                            ridusBL: 12.0,
                            ridusBR: 12.0,
                            ridusR: 12.0,
                            ridusl: 12.0,
                            child: customText(
                                text: AppLocalizations.of(context)!.next,
                                textColor: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<BoolingVal>(
                builder: (BuildContext context, value, Widget? child) {
                  return value.isLodingAuth
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black.withOpacity(0.3),
                          child: const Center(
                              child: CircularProgressIndicator(
                            color: mainColor,
                          )),
                        )
                      : const SizedBox();
                },
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
            top: 50,
            child: Container(
              margin: const EdgeInsets.all(8),
              color: const Color.fromARGB(108, 100, 95, 92),
              height: 90.0,
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

  Future<void> ppushAdsOrToPlanScreen(BuildContext context) async {
    await DataBaseSrv().getUserProfileInfo(context);
    int planNo = userInfoProfile?.plan ?? 0;
    if (planNo == 0) {
      if (context.mounted) {
        GlobalMethods()
            .pushToNewScreen(context: context, routeName: toPlanScreen);
      }
    } else {
      if (context.mounted) {
        DataBaseSrv().puplishNewAds(context);
      }
    }
  }
}
