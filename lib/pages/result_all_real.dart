// this screen for display all ads of type realState from database(salae rent ...)

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_flout.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../helper/custom_spacer.dart';

class ResultAds extends StatelessWidget {
  final List<AdsModel> list;
  const ResultAds({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: false,
        title: customText(
            textAlign: TextAlign.center,
            text:
                '${AppLocalizations.of(context)!.resultSearching} (${list.length})'),
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
      body: list.isNotEmpty
          ? ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) {
                return Container(
                  margin:
                      const EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        list[index].images![0],
                        height: 120,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            customText(
                                text: list[index].details![0],
                                textColor: mainColor,
                                overflow: TextOverflow.ellipsis),
                            customSpacer(height: 10.0),
                            customText(
                                text: list[index].details![1],
                                textColor: mainColor,
                                overflow: TextOverflow.ellipsis),
                            customSpacer(height: 40.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                customIcon(
                                    iconData: Icons.location_on,
                                    color: Colors.grey,
                                    size: 25.0),
                                customText(
                                    text:
                                        '${list[index].city}\n ${list[index].area}',
                                    textColor: mainColor,
                                    textFontSize: 12.0),
                                customSpacer(width: 30.0),
                                customText(
                                    text: list[index].details?[2],
                                    textColor: mainColor,
                                    textFontSize: 12.0,
                                    overflow: TextOverflow.ellipsis)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              })
          : const Center(
              child: CircularProgressIndicator(
              color: mainColor,
            )),
    ));
  }
}
