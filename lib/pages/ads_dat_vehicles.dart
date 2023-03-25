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

class AdsDetailsVehicles extends StatelessWidget {
  const AdsDetailsVehicles({super.key});
  static TextEditingController advertTitle = TextEditingController();
  static TextEditingController explanation = TextEditingController();
  static TextEditingController price = TextEditingController();
  static TextEditingController model = TextEditingController();
  static TextEditingController yearMade = TextEditingController();
  static TextEditingController yearRigstert = TextEditingController();
  static TextEditingController kilometers = TextEditingController();
  static TextEditingController color = TextEditingController();

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
              controller: model,
              lable: AppLocalizations.of(context)!.model,
              hintText: AppLocalizations.of(context)!.model,
              inputType: TextInputType.text,
              labelColor: mainColor,
              fillColor: Colors.white,
              margin: 8.0,
              function: (String onchngeVal) {
                context.read<StringVal>().updateModel(onchngeVal);
              }),
          customTextFailed(
              controller: yearMade,
              lable: AppLocalizations.of(context)!.yearMade,
              hintText: AppLocalizations.of(context)!.yearMade,
              inputType: TextInputType.number,
              labelColor: mainColor,
              fillColor: Colors.white,
              margin: 8.0,
              function: (String onchngeVal) {
                context.read<StringVal>().updateYearMade(onchngeVal);
              }),
          customTextFailed(
              controller: yearRigstert,
              lable: AppLocalizations.of(context)!.yearRigester,
              hintText: AppLocalizations.of(context)!.yearRigester,
              inputType: TextInputType.number,
              labelColor: mainColor,
              fillColor: Colors.white,
              margin: 8.0,
              function: (String onchngeVal) {
                context.read<StringVal>().updateYearRigester(onchngeVal);
              }),
          customTextFailed(
              controller: kilometers,
              lable: AppLocalizations.of(context)!.kilometers,
              hintText: AppLocalizations.of(context)!.kilometers,
              inputType: TextInputType.number,
              labelColor: mainColor,
              fillColor: Colors.white,
              margin: 8.0,
              function: (String onchngeVal) {
                context.read<StringVal>().updateKilometers(onchngeVal);
              }),
          customTextFailed(
              controller: color,
              lable: AppLocalizations.of(context)!.color,
              hintText: AppLocalizations.of(context)!.color,
              inputType: TextInputType.text,
              labelColor: mainColor,
              fillColor: Colors.white,
              margin: 8.0,
              function: (String onchngeVal) {
                context.read<StringVal>().updateColor(onchngeVal);
              }),
          MyDropButton().customDropButton(
            context: context,
            width: 80.0,
            margin: 8.0,
            fontSizeC: 24,
            dropdownValue: context.watch<StringVal>().motorClass,
            list: [
              AppLocalizations.of(context)!.motorClass,
              AppLocalizations.of(context)!.binzin,
              AppLocalizations.of(context)!.diseal,
              AppLocalizations.of(context)!.gaz,
              AppLocalizations.of(context)!.hybrid,
              AppLocalizations.of(context)!.electrical
            ],
            function: (String? valueChange) {
              context.read<StringVal>().updateMotorType(valueChange!);
            },
          ),
          MyDropButton().customDropButton(
            context: context,
            width: 80.0,
            margin: 8.0,
            fontSizeC: 24,
            dropdownValue: context.watch<StringVal>().withinWarranty,
            list: [
              AppLocalizations.of(context)!.withinWarranty,
              AppLocalizations.of(context)!.yes,
              AppLocalizations.of(context)!.no,
              AppLocalizations.of(context)!.unKnow,
            ],
            function: (String? valueChange) {
              context.read<StringVal>().updateWithinWarranty(valueChange!);
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
                        left: 0.0, right: 0.0, child: customText(text: '(1/4)'))
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
    ));
  }

  // this is item for list in checkInfo add for push to database
  void listOfItemsHousing(BuildContext context) {
    listCheckInfoAds.clear();
    String text = AppLocalizations.of(context)!.unKnow;
    final list = [
      '${AppLocalizations.of(context)!.title} : ${context.read<StringVal>().advertTitle ?? text}',
      '${AppLocalizations.of(context)!.explanation} : ${context.read<StringVal>().explanation ?? text}',
      '${AppLocalizations.of(context)!.price} :  ${context.read<StringVal>().price ?? text} ${context.read<StringVal>().currancyType ?? '\$'}',
      '${AppLocalizations.of(context)!.model} : ${context.read<StringVal>().model ?? text}',
      '${AppLocalizations.of(context)!.yearMade} : ${context.read<StringVal>().yearMade ?? text}',
      '${AppLocalizations.of(context)!.yearRigester} : ${context.read<StringVal>().yearRigester ?? text}',
      '${AppLocalizations.of(context)!.kilometers} : ${context.read<StringVal>().kilometers ?? text}',
      '${AppLocalizations.of(context)!.color} : ${context.read<StringVal>().color ?? text}',
      '${AppLocalizations.of(context)!.motorClass} : ${context.read<StringVal>().motorClass ?? text}',
      '${AppLocalizations.of(context)!.withinWarranty} : ${context.read<StringVal>().withinWarranty ?? text}',
    ];
    listCheckInfoAds.addAll(list);
  }

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
      sub2CatToDtabase = context.read<StringVal>().subCategoryValue ?? 'null';
      listOfItemsHousing(context);
      GlobalMethods()
          .pushToNewScreen(context: context, routeName: toStartPickLocation);
    }
  }
}
