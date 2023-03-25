import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../custom-widgets/custom_drawer.dart';
import '../helper/config.dart';

class MyAdsScreen extends StatelessWidget {
  final List<AdsModel> list;
  final String title;
  const MyAdsScreen({super.key, required this.list, required this.title});

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
        body: list.isNotEmpty
            ? ListView.builder(
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
                        Container(
                          alignment: Alignment.center,
                          child: customText(
                              text:
                                  '${AppLocalizations.of(context)!.adNumber} : ${list[index].adsNumber}',
                              textColor: mainColor,
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          color: const Color.fromARGB(193, 154, 116, 62),
                          height: 100.0,
                          margin: const EdgeInsets.all(4.0),
                          child: ListView.builder(
                            padding: const EdgeInsets.all(4.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: list[index].images!.length,
                            itemBuilder: (_, i) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  list[index].images![i],
                                  height: 80.0,
                                  width: 80.0,
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          color: const Color.fromARGB(31, 135, 126, 126),
                          margin: const EdgeInsets.all(4.0),
                          height: 150.0,
                          child: ListView.builder(
                            itemCount: list[index].details?.length,
                            itemBuilder: (_, d) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: customText(
                                    text: '${list[index].details![d]}',
                                    textColor: mainColor,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: const Color.fromARGB(31, 135, 126, 126),
                          margin: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: customText(
                                    text:
                                        '${AppLocalizations.of(context)!.startDate} ${formatdateStart(index)}',
                                    textColor: mainColor,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: customText(
                                    text:
                                        '${AppLocalizations.of(context)!.expiryDate} ${formatdateExpiry(index)}',
                                    textColor: mainColor,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: list.length,
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  String formatdateStart(int index) {
    DateTime date;
    final time = list[index].dateStart?.millisecondsSinceEpoch;
    date = DateTime.fromMillisecondsSinceEpoch(time!);
    final day = date.day.toString();
    final month = date.month.toString();
    final year = date.year.toString();
    return '$day-$month-$year';
  }

  String formatdateExpiry(int index) {
    DateTime date;
    final time = list[index].dateExpired?.millisecondsSinceEpoch;
    date = DateTime.fromMillisecondsSinceEpoch(time!);
    final day = date.day.toString();
    final month = date.month.toString();
    final year = date.year.toString();
    return '$day-$month-$year';
  }
}
