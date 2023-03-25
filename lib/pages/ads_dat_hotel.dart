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

class AdsDetailsHotels extends StatelessWidget {
  const AdsDetailsHotels({super.key});
  static TextEditingController advertTitle = TextEditingController();
  static TextEditingController explanation = TextEditingController();
  static TextEditingController price = TextEditingController();
  static TextEditingController view = TextEditingController();
  static TextEditingController futuers = TextEditingController();
  static TextEditingController services = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalMethods().locatioServiceEnabled(context);
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
                    context.read<StringVal>().updateCurancyState(valueChange!);
                  },
                ),
              ],
            ),
            customTextFailed(
                controller: view,
                lable: AppLocalizations.of(context)!.view,
                hintText: AppLocalizations.of(context)!.view,
                inputType: TextInputType.text,
                labelColor: mainColor,
                margin: 8.0,
                fillColor: Colors.white,
                function: (String onchngeVal) {
                  context.read<StringVal>().updateView(onchngeVal);
                }),
            customTextFailed(
                controller: services,
                lable: AppLocalizations.of(context)!.services,
                hintText: AppLocalizations.of(context)!.services,
                inputType: TextInputType.text,
                labelColor: mainColor,
                margin: 8.0,
                fillColor: Colors.white,
                function: (String onchngeVal) {
                  context.read<StringVal>().updateServices(onchngeVal);
                }),
            customTextFailed(
                controller: futuers,
                lable: AppLocalizations.of(context)!.additionalFeatures,
                hintText: AppLocalizations.of(context)!.additionalFeatures,
                inputType: TextInputType.text,
                labelColor: mainColor,
                margin: 8.0,
                fillColor: Colors.white,
                function: (String onchngeVal) {
                  context
                      .read<StringVal>()
                      .updateAdditionalFeatures(onchngeVal);
                }),
            MyDropButton().customDropButton(
              context: context,
              dropdownValue: context.watch<StringVal>().numOfRomms,
              margin: 8.0,
              list: [
                AppLocalizations.of(context)!.roomNum,
                '0+1',
                '1+1',
                '2+1',
                '3+1',
                '4+1',
                '5+1',
                '6+1',
                '7+1',
                '8+1',
                '9+1',
                '10+1',
                '20+1'
              ],
              function: (String? valueChange) {
                context.read<StringVal>().updateNumOfRoomsState(valueChange!);
              },
            ),
            MyDropButton().customDropButton(
              context: context,
              dropdownValue: context.watch<StringVal>().numOfFloors,
              margin: 8.0,
              list: [
                AppLocalizations.of(context)!.numOfFloors,
                '1',
                '2',
                '3',
                '4',
                '5',
                '6',
                '7',
                '8',
                '9',
                '10',
                '(10/15)',
                '(15/20)',
                '(20/25)',
                '(25/30)',
                '(30/...)'
              ],
              function: (String? valueChange) {
                context.read<StringVal>().updateNumOfFloors(valueChange!);
              },
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
                context.read<StringVal>().updateBuildingAgeState(valueChange!);
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
                          width: MediaQuery.of(context).size.width * 40 / 100,
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
        ),
      ),
    );
  }

  // this is item for list in checkInfo add for push to database
  void listOfItemsHousing(BuildContext context) {
    // sub2CatToDtabase,
    listCheckInfoAds.clear();
    String text = AppLocalizations.of(context)!.unKnow;
    final list = [
      '${AppLocalizations.of(context)!.title} : ${context.read<StringVal>().advertTitle ?? text}',
      '${AppLocalizations.of(context)!.explanation} : ${context.read<StringVal>().explanation ?? text}',
      '${AppLocalizations.of(context)!.price} :  ${context.read<StringVal>().price ?? text} ${context.read<StringVal>().currancyType ?? '\$'}',
      '${AppLocalizations.of(context)!.view} : ${context.read<StringVal>().view ?? text}',
      '${AppLocalizations.of(context)!.additionalFeatures} : ${context.read<StringVal>().additionalFeatures ?? text}',
      '${AppLocalizations.of(context)!.services} : ${context.read<StringVal>().services ?? text}',
      '${AppLocalizations.of(context)!.roomNum} : ${context.read<StringVal>().numOfRomms ?? text}',
      '${AppLocalizations.of(context)!.numOfFloors} : ${context.read<StringVal>().numOfFloors ?? text}',
      '${AppLocalizations.of(context)!.buldingAge} : ${context.read<StringVal>().buildingAge ?? text}',
    ];
    listCheckInfoAds.addAll(list);
  }

  // this method for check required Field befor nav to next page
  void checkBefore(BuildContext context) {
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
      sub2CatToDtabase = 'hotelSub';
      listOfItemsHousing(context);
      GlobalMethods()
          .pushToNewScreen(context: context, routeName: toStartPickLocation);
    }
  }
}
