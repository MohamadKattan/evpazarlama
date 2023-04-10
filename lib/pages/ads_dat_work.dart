import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../custom-widgets/custom_drawer.dart';
import '../global-methods/methods.dart';
import '../helper/config.dart';
import '../helper/custom_container.dart';
import '../helper/custom_dailog.dart';
import '../helper/custom_drop.dart';
import '../helper/custom_positioned.dart';
import '../helper/custom_spacer.dart';
import '../helper/custom_text.dart';
import '../helper/custom_text_field.dart';
import '../state-maneg/string_val.dart';

class AdsDetailsWorkPlace extends StatelessWidget {
  const AdsDetailsWorkPlace({super.key});

  static TextEditingController advertTitle = TextEditingController();
  static TextEditingController explanation = TextEditingController();
  static TextEditingController price = TextEditingController();
  static TextEditingController grossMeters = TextEditingController();
  static TextEditingController netMeters = TextEditingController();
  static TextEditingController dailySale = TextEditingController();

  @override
  Widget build(BuildContext context) {
    checkValSubCategory(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.blueGrey.shade100,
            appBar: AppBar(
              backgroundColor: mainColor,
              centerTitle: false,
              title: customText(
                text: AppLocalizations.of(context)!.basicInformation,
              ),
            ),
            drawer: customDrawer(context),
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                customSpacer(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: customText(
                      text: '${AppLocalizations.of(context)!.requiredField}*',
                      textColor: Colors.red,
                      textFontSize: 14,
                      textAlign: TextAlign.start),
                ),
                customTextFailed(
                    controller: advertTitle,
                    lable: AppLocalizations.of(context)!.advertTitle,
                    hintText: AppLocalizations.of(context)!.advertTitle,
                    inputType: TextInputType.text,
                    labelColor: mainColor,
                    fillColor: Colors.white,
                    margin: 8.0,
                    function: (String onchngeVal) {
                      context.read<StringVal>().updateAdvertTitle(onchngeVal);
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: customText(
                      text: '${AppLocalizations.of(context)!.requiredField}*',
                      textColor: Colors.red,
                      textFontSize: 14,
                      textAlign: TextAlign.start),
                ),
                customTextFailed(
                    controller: explanation,
                    lable: AppLocalizations.of(context)!.explanation,
                    hintText: AppLocalizations.of(context)!.explanation,
                    inputType: TextInputType.text,
                    labelColor: mainColor,
                    margin: 8.0,
                    fillColor: Colors.white,
                    function: (String onchngeVal) {
                      context.read<StringVal>().updateExplanation(onchngeVal);
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: customText(
                      text: '${AppLocalizations.of(context)!.requiredField}*',
                      textColor: Colors.red,
                      textFontSize: 14,
                      textAlign: TextAlign.start),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: customTextFailed(
                          controller: price,
                          lable: AppLocalizations.of(context)!.price,
                          hintText: AppLocalizations.of(context)!.price,
                          inputType: TextInputType.number,
                          labelColor: mainColor,
                          fillColor: Colors.white,
                          margin: 8.0,
                          function: (String onchngeVal) {
                            context.read<StringVal>().updatePrice(onchngeVal);
                          }),
                    ),
                    MyDropButton().customDropButton(
                      context: context,
                      width: 80.0,
                      margin: 8.0,
                      fontSizeC: 24,
                      dropdownValue: context.watch<StringVal>().currancyType,
                      list: ['\$', '€', '₺', '£', '₽', '﷼', 'د.ك', 'د.إ'],
                      function: (String? valueChange) {
                        context
                            .read<StringVal>()
                            .updateCurancyState(valueChange!);
                      },
                    ),
                  ],
                ),
                customTextFailed(
                    controller: grossMeters,
                    lable: AppLocalizations.of(context)!.grossMeters,
                    hintText: AppLocalizations.of(context)!.grossMeters,
                    inputType: TextInputType.number,
                    labelColor: mainColor,
                    fillColor: Colors.white,
                    margin: 8.0,
                    function: (String onchngeVal) {
                      context.read<StringVal>().updateGroosMeter(onchngeVal);
                    }),
                customTextFailed(
                    controller: netMeters,
                    lable: AppLocalizations.of(context)!.netMeters,
                    hintText: AppLocalizations.of(context)!.netMeters,
                    inputType: TextInputType.number,
                    labelColor: mainColor,
                    fillColor: Colors.white,
                    margin: 8.0,
                    function: (String onchngeVal) {
                      context.read<StringVal>().updateNetMeter(onchngeVal);
                    }),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: customTextFailed(
                          controller: dailySale,
                          lable: AppLocalizations.of(context)!.dailySale,
                          hintText: AppLocalizations.of(context)!.dailySale,
                          inputType: TextInputType.number,
                          labelColor: mainColor,
                          fillColor: Colors.white,
                          margin: 8.0,
                          function: (String onchngeVal) {
                            context
                                .read<StringVal>()
                                .updateDailySale(onchngeVal);
                          }),
                    ),
                    MyDropButton().customDropButton(
                      context: context,
                      width: 80.0,
                      margin: 8.0,
                      fontSizeC: 24,
                      dropdownValue: context.watch<StringVal>().dailyCurrancyT,
                      list: ['\$', '€', '₺', '£', '₽', '﷼', 'د.ك', 'د.إ'],
                      function: (String? valueChange) {
                        context
                            .read<StringVal>()
                            .updateDailyCurrancyT(valueChange!);
                      },
                    ),
                  ],
                ),
                MyDropButton().customDropButton(
                  context: context,
                  dropdownValue: context.watch<StringVal>().buildingAge,
                  margin: 8.0,
                  list: [
                    AppLocalizations.of(context)!.buldingAge,
                    '${AppLocalizations.of(context)!.year}: 0',
                    '${AppLocalizations.of(context)!.year}: 1',
                    '${AppLocalizations.of(context)!.year}: 2',
                    '${AppLocalizations.of(context)!.year}: 3',
                    '${AppLocalizations.of(context)!.year}: 4',
                    '${AppLocalizations.of(context)!.year}: 5',
                    '${AppLocalizations.of(context)!.year}: 6',
                    '${AppLocalizations.of(context)!.year}: 7',
                    '${AppLocalizations.of(context)!.year}: 8',
                    '${AppLocalizations.of(context)!.year}: 9',
                    '${AppLocalizations.of(context)!.year}: 10',
                    '${AppLocalizations.of(context)!.year}: (10/15)',
                    '${AppLocalizations.of(context)!.year}: (15/20)',
                    '${AppLocalizations.of(context)!.year}: (20/25)',
                    '${AppLocalizations.of(context)!.year}: (25/30)',
                    '${AppLocalizations.of(context)!.year}: (30/...)',
                  ],
                  function: (String? valueChange) {
                    context
                        .read<StringVal>()
                        .updateBuildingAgeState(valueChange!);
                  },
                ),
                customSpacer(height: 40.0),
                customContainer(
                  height: 60,
                  colorBack: Colors.black.withOpacity(0.4),
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
                            width: MediaQuery.of(context).size.width * 12 / 100,
                            height: 20,
                            ridusBL: 12.0,
                            ridusBR: 12.0,
                            ridusR: 12.0,
                            ridusl: 12.0,
                          ),
                          customPositioned(
                              left: 0.0,
                              right: 0.0,
                              child: customText(text: '(1/4)'))
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          checkBefore(context);
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
                              textColor: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }

  // this method for exstued val of list item and set to en val just
  void checkValSubCategory(BuildContext context) {
    String? val =
        Provider.of<StringVal>(context, listen: false).subCategoryValue ??
            'null';
    if (val.contains(AppLocalizations.of(context)!.gasStation)) {
      sub2CatToDtabase = 'gasStation';
    } else if (val.contains(AppLocalizations.of(context)!.apart1)) {
      sub2CatToDtabase = 'apart';
    } else if (val.contains(AppLocalizations.of(context)!.villa)) {
      sub2CatToDtabase = 'villa';
    } else if (val.contains(AppLocalizations.of(context)!.workshop)) {
      sub2CatToDtabase = 'workshop';
    } else if (val.contains(AppLocalizations.of(context)!.mall)) {
      sub2CatToDtabase = 'mall';
    } else if (val.contains(AppLocalizations.of(context)!.buffet)) {
      sub2CatToDtabase = 'buffet';
    } else if (val.contains(AppLocalizations.of(context)!.office)) {
      sub2CatToDtabase = 'office';
    } else if (val.contains(AppLocalizations.of(context)!.cafe)) {
      sub2CatToDtabase = 'cafe';
    } else if (val.contains(AppLocalizations.of(context)!.warehouse)) {
      sub2CatToDtabase = 'warehouse';
    } else if (val.contains(AppLocalizations.of(context)!.weddingHall)) {
      sub2CatToDtabase = 'weddingHall';
    } else if (val.contains(AppLocalizations.of(context)!.store)) {
      sub2CatToDtabase = 'store';
    } else if (val.contains(AppLocalizations.of(context)!.factory)) {
      sub2CatToDtabase = 'factory';
    } else if (val.contains(AppLocalizations.of(context)!.fullbuilding)) {
      sub2CatToDtabase = 'fullbuilding';
    } else {
      sub2CatToDtabase = 'parking';
    }
  }

  // this is item for list in checkInfo add for push to database
  void listOfItemsHousing(BuildContext context) {
    // subCatToDtabase,
    listDetailsAds.clear();
    listTitleDetails.clear();
    String text = AppLocalizations.of(context)!.unKnow;
    final list = [
      context.read<StringVal>().advertTitle ?? text,
      context.read<StringVal>().explanation ?? text,
      context.read<StringVal>().price ?? text,
      context.read<StringVal>().currancyType ?? '\$',
      context.read<StringVal>().grossMeter ?? text,
      context.read<StringVal>().netMeter ?? text,
      context.read<StringVal>().dailySale ?? text,
      context.read<StringVal>().dailyCurrancyT ?? '\$',
      context.read<StringVal>().buildingAge ?? text,
    ];
    final listTille = [
      AppLocalizations.of(context)!.title,
      AppLocalizations.of(context)!.explanation,
      AppLocalizations.of(context)!.price,
      AppLocalizations.of(context)!.currency,
      AppLocalizations.of(context)!.grossMeters,
      AppLocalizations.of(context)!.netMeters,
      AppLocalizations.of(context)!.dailySale,
      AppLocalizations.of(context)!.currency,
      AppLocalizations.of(context)!.buldingAge
    ];
    listDetailsAds.addAll(list);
    listTitleDetails.addAll(listTille);
  }

  // this method for check requird field
  Future<void> checkBefore(BuildContext context) async {
    if (advertTitle.text.isEmpty) {
      CustomDailog().customSnackBar(
          context: context,
          text:
              '${AppLocalizations.of(context)!.advertTitle} ${AppLocalizations.of(context)!.requiredField}',
          color: Colors.red);
    } else if (explanation.text.isEmpty) {
      CustomDailog().customSnackBar(
          context: context,
          text:
              '${AppLocalizations.of(context)!.explanation} ${AppLocalizations.of(context)!.requiredField}',
          color: Colors.red);
    } else if (price.text.isEmpty) {
      CustomDailog().customSnackBar(
          context: context,
          text:
              '${AppLocalizations.of(context)!.price} ${AppLocalizations.of(context)!.requiredField}',
          color: Colors.red);
    } else {
      bool? locationVal = await GlobalMethods().locatioServiceEnabled(context);
      if (locationVal) {
        if (context.mounted) {
          listOfItemsHousing(context);
          GlobalMethods().pushToNewScreen(
              context: context, routeName: toStartPickLocation);
        }
      } else {
        if (context.mounted) {
          CustomDailog().customSnackBar(
              context: context,
              text: AppLocalizations.of(context)!.locationDenied);
        }
      }
    }
  }
}
