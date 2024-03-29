import 'package:evpazarlama/client-srv/database_srv.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:evpazarlama/state-maneg/list_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../custom-widgets/custom_drawer.dart';
import '../global-methods/methods.dart';
import '../helper/config.dart';
import '../helper/custom_buttons.dart';
import '../state-maneg/booling_val.dart';

class MyAdsScreen extends StatelessWidget {
  // final List<AdsModel> list;
  final String title;
  const MyAdsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          elevation: 0.0,
          title: customText(
            text: title,
          ),
        ),
        drawer: customDrawer(context),
        body: Consumer<ListVal>(
          builder: (context, value, child) {
            final List<AdsModel> val;
            if (title.contains(AppLocalizations.of(context)!.compliteAds)) {
              val = value.myAdsOk;
            } else {
              val = value.myAdsPanding;
            }
            return val.isNotEmpty
                ? Stack(
                    children: [
                      ListView.builder(
                        itemBuilder: (_, index) {
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                headrOfAds(val, index, context),
                                Container(
                                  color:
                                      const Color.fromARGB(193, 154, 116, 62),
                                  height: 100.0,
                                  margin: const EdgeInsets.all(4.0),
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(4.0),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: val[index].images!.length,
                                    itemBuilder: (_, i) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          val[index].images![i],
                                          height: 80.0,
                                          width: 80.0,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  color:
                                      const Color.fromARGB(31, 135, 126, 126),
                                  margin: const EdgeInsets.all(4.0),
                                  height: 150.0,
                                  child: ListView.builder(
                                    itemCount: val[index].details?.length,
                                    itemBuilder: (_, d) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customText(
                                                  text:
                                                      '${val[index].title![d]}',
                                                  textColor: mainColor,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start),
                                            ),
                                          ),
                                          customSpacer(width: 60.0),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customText(
                                                  text:
                                                      '${val[index].details![d]}',
                                                  textColor: mainColor,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  color:
                                      const Color.fromARGB(31, 135, 126, 126),
                                  margin: const EdgeInsets.all(4.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: customText(
                                      text:
                                          '${AppLocalizations.of(context)!.expiryDate} : '
                                          '${formatdateExpiry(index, val)}',
                                      textColor: Colors.redAccent,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: val.length,
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
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customText(
                              text: AppLocalizations.of(context)!.noFound),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }

  // String formatdateStart(int index) {
  //   DateTime date;
  //   final time = [index].dateStart?.millisecondsSinceEpoch;
  //   date = DateTime.fromMillisecondsSinceEpoch(time!);
  //   final day = date.day.toString();
  //   final month = date.month.toString();
  //   final year = date.year.toString();
  //   return '$day-$month-$year';
  // }

  Widget headrOfAds(List<AdsModel> val, int index, BuildContext context) {
    return val[index].status!.contains('ok')
        ? Container(
            alignment: Alignment.center,
            child: customText(
                text: '${AppLocalizations.of(context)!.adNumber} : '
                    '${val[index].adsNumber}',
                textColor: mainColor,
                textAlign: TextAlign.center),
          )
        : Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                CustomIconButton().customIconButton(
                    function: () {
                      final id = val[index].adsId;
                      startRepuplish(context, id);
                    },
                    icon: Icons.new_label,
                    color: Colors.greenAccent,
                    size: 35.0),
                CustomIconButton().customIconButton(
                    function: () {
                      final id = val[index].adsId;
                      deletePandingAds(context, id, index);
                    },
                    icon: Icons.delete,
                    color: Colors.red,
                    size: 35.0),
                customText(
                    text: '${AppLocalizations.of(context)!.adNumber} : '
                        '${val[index].adsNumber}',
                    textColor: mainColor,
                    textAlign: TextAlign.center),
              ],
            ),
          );
  }

  String formatdateExpiry(int index, List<AdsModel> val) {
    DateTime date;
    final time = val[index].dateExpired?.millisecondsSinceEpoch;
    date = DateTime.fromMillisecondsSinceEpoch(time!);
    final day = date.day.toString();
    final month = date.month.toString();
    final year = date.year.toString();
    return '$day-$month-$year';
  }

  Future<void> startRepuplish(BuildContext context, String? id) async {
    await DataBaseSrv().getUserProfileInfo(context);
    int planNo = userInfoProfile?.plan ?? 0;
    if (planNo == 0) {
      if (context.mounted) {
        GlobalMethods()
            .pushToNewScreen(context: context, routeName: toPlanScreen);
      }
    } else {
      if (context.mounted) {
        DataBaseSrv().rePuplisAd(context, id);
      }
    }
  }

  Future<void> deletePandingAds(
      BuildContext context, String? id, int index) async {
    await DataBaseSrv().deleteAds(context, id);
    if (context.mounted) {
      context.read<ListVal>().deleteAnIndexPanding(index);
    }
  }
}
