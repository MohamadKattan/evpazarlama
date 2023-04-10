// this screen for display all ads of type realState from database(salae rent ...)

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:evpazarlama/helper/custom_flout.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:evpazarlama/pages/filter_details.dart';
import 'package:evpazarlama/pages/map_result_ads.dart';
import 'package:evpazarlama/pages/one_ad_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../helper/custom_spacer.dart';
import '../state-maneg/booling_val.dart';

class ResultAds extends StatefulWidget {
  final List<AdsModel> list;
  const ResultAds({super.key, required this.list});

  @override
  State<ResultAds> createState() => _ResultAdsState();
}

class _ResultAdsState extends State<ResultAds> {
  bool isWillPop = true;
  @override
  void initState() {
    GlobalMethods().locatioServiceEnabled(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => isWillPop,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            centerTitle: false,
            title: customText(
                textAlign: TextAlign.center,
                text:
                    '${AppLocalizations.of(context)!.resultSearching} (${widget.list.length})'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    await pushToStartFillter();
                  },
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
              function: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return MapResultads(list: widget.list);
                }));
              },
              child: customIcon(iconData: Icons.map_sharp)),
          body: widget.list.isNotEmpty
              ? ListView.builder(
                  itemCount: widget.list.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return OneAdsDetails(adsModel: widget.list[index]);
                        }));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 8.0, left: 4.0, right: 4.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1.0, color: mainColor),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              widget.list[index].images?[0] ?? urlHolder,
                              height: 120,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: customText(
                                        text: widget.list[index].details?[0] ??
                                            '***',
                                        textColor: mainColor,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  customSpacer(height: 5.0),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: customText(
                                        text: widget.list[index].details?[1] ??
                                            '***',
                                        textColor: Colors.grey,
                                        textFontSize: 14.0,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  customSpacer(height: 40.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      customIcon(
                                          iconData: Icons.location_on,
                                          color: Colors.grey,
                                          size: 25.0),
                                      customText(
                                          text:
                                              '${widget.list[index].city}\n ${widget.list[index].area}',
                                          textColor: mainColor,
                                          textFontSize: 12.0),
                                      customSpacer(width: 70.0),
                                      Expanded(
                                        child: customText(
                                            text:
                                                '${widget.list[index].details?[2] ?? '***'}'
                                                '${widget.list[index].details?[3] ?? '***'}',
                                            textColor: mainColor,
                                            textFontSize: 12.0,
                                            overflow: TextOverflow.ellipsis),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: mainColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customText(
                            text: AppLocalizations.of(context)!.noFound,
                            textColor: mainColor),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> pushToStartFillter() async {
    bool isLocationwork = await GlobalMethods().locatioServiceEnabled(context);
    if (isLocationwork) {
      if (context.mounted) {
        context.read<BoolingVal>().loadingAuth(true);
        bool? val =
            await Navigator.push(context, MaterialPageRoute(builder: (_) {
          return FilterDetails(list: widget.list);
        }));
        if (val ?? false) {
          widget.list.clear();
          setState(() {
            isWillPop = false;
            widget.list.addAll(listOfFilter);
          });
        } else {
          isWillPop = true;
        }
      }
    } else {
      if (context.mounted) {
        CustomDailog().customSnackBar(
            context: context, text: AppLocalizations.of(context)!.noFound);
      }
    }
  }
}
