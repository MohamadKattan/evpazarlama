import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_container.dart';
import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:evpazarlama/helper/custom_positioned.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/helper/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdsDetailsHoseing extends StatelessWidget {
  const AdsDetailsHoseing({super.key});

  static TextEditingController advertTitle = TextEditingController();
  static TextEditingController explanation = TextEditingController();
  static TextEditingController price = TextEditingController();
  static TextEditingController grossMeters = TextEditingController();
  static TextEditingController netMeters = TextEditingController();
  static TextEditingController roomNum = TextEditingController();
  static TextEditingController buldingAge = TextEditingController();
  static TextEditingController floorLocation = TextEditingController();
  static TextEditingController numOfFloors = TextEditingController();
  static TextEditingController heating = TextEditingController();
  static TextEditingController numberofPath = TextEditingController();
  static TextEditingController balcony = TextEditingController();
  static TextEditingController furnished = TextEditingController();
  static TextEditingController usingStatus = TextEditingController();
  static TextEditingController dues = TextEditingController();
  static TextEditingController deed = TextEditingController();
  static TextEditingController watching = TextEditingController();
  static TextEditingController bartered = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 100 / 100,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 80 / 100,
                child: ListView(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  children: [
                    customSpacer(height: 20.0),
                    customText(
                        text: '${AppLocalizations.of(context)!.requiredField}*',
                        textColor: Colors.red,
                        textFontSize: 14,
                        textAlign: TextAlign.start),
                    customSpacer(height: 6.0),
                    customTextFailed(
                        controller: advertTitle,
                        lable: AppLocalizations.of(context)!.advertTitle,
                        hintText: AppLocalizations.of(context)!.advertTitle,
                        inputType: TextInputType.text,
                        labelColor: mainColor,
                        fillColor: Colors.white),
                    customSpacer(height: 20.0),
                    customText(
                        text: '${AppLocalizations.of(context)!.requiredField}*',
                        textColor: Colors.red,
                         textFontSize: 14,
                        textAlign: TextAlign.start),
                    customSpacer(height: 6.0),
                    customTextFailed(
                        controller: explanation,
                        lable: AppLocalizations.of(context)!.explanation,
                        hintText: AppLocalizations.of(context)!.explanation,
                        inputType: TextInputType.text,
                        labelColor: mainColor,
                        fillColor: Colors.white),
                    customSpacer(height: 20.0),
                    customText(
                        text: '${AppLocalizations.of(context)!.requiredField}*',
                        textColor: Colors.red,
                         textFontSize: 14,
                        textAlign: TextAlign.start),
                    customSpacer(height: 6.0),
                    customTextFailed(
                        controller: price,
                        lable: AppLocalizations.of(context)!.price,
                        hintText: AppLocalizations.of(context)!.price,
                        inputType: TextInputType.number,
                        labelColor: mainColor,
                        fillColor: Colors.white),
                    customSpacer(height: 20.0),
                    customTextFailed(
                        controller: grossMeters,
                        lable: AppLocalizations.of(context)!.grossMeters,
                        hintText: AppLocalizations.of(context)!.grossMeters,
                        inputType: TextInputType.number,
                        labelColor: mainColor,
                        fillColor: Colors.white),
                    customSpacer(height: 20.0),
                    customTextFailed(
                        controller: netMeters,
                        lable: AppLocalizations.of(context)!.netMeters,
                        hintText: AppLocalizations.of(context)!.netMeters,
                        inputType: TextInputType.number,
                        labelColor: mainColor,
                        fillColor: Colors.white),
                    customSpacer(height: 20.0),
                    customTextFailed(
                        controller: roomNum,
                        lable: AppLocalizations.of(context)!.roomNum,
                        hintText: AppLocalizations.of(context)!.roomNum,
                        inputType: TextInputType.number,
                        labelColor: mainColor,
                        fillColor: Colors.white),
                    customSpacer(height: 20.0),
                    customTextFailed(
                        controller: buldingAge,
                        lable: AppLocalizations.of(context)!.buldingAge,
                        hintText: AppLocalizations.of(context)!.buldingAge,
                        inputType: TextInputType.number,
                        labelColor: mainColor,
                        fillColor: Colors.white),
                    customSpacer(height: 20.0),
                    customTextFailed(
                        controller: floorLocation,
                        lable: AppLocalizations.of(context)!.floorLocation,
                        hintText: AppLocalizations.of(context)!.floorLocation,
                        inputType: TextInputType.number,
                        labelColor: mainColor,
                        fillColor: Colors.white),
                    customSpacer(height: 20.0),
                    customTextFailed(
                      controller: numOfFloors,
                      lable: AppLocalizations.of(context)!.numOfFloors,
                      hintText: AppLocalizations.of(context)!.numOfFloors,
                      inputType: TextInputType.number,
                      labelColor: mainColor,
                      fillColor: Colors.white,
                    ),
                    customSpacer(height: 20.0),
                    customTextFailed(
                      controller: heating,
                      lable: AppLocalizations.of(context)!.heating,
                      hintText: AppLocalizations.of(context)!.heating,
                      inputType: TextInputType.text,
                      labelColor: mainColor,
                      fillColor: Colors.white,
                    ),
                    customSpacer(height: 20.0),
                    customTextFailed(
                      controller: numberofPath,
                      lable: AppLocalizations.of(context)!.pathNum,
                      hintText: AppLocalizations.of(context)!.pathNum,
                      inputType: TextInputType.number,
                      labelColor: mainColor,
                      fillColor: Colors.white,
                    ),
                    customSpacer(height: 20.0),
                    customTextFailed(
                      controller: balcony,
                      lable: AppLocalizations.of(context)!.balcony,
                      hintText: AppLocalizations.of(context)!.balcony,
                      inputType: TextInputType.text,
                      labelColor: mainColor,
                      fillColor: Colors.white,
                    ),
                    customSpacer(height: 20.0),
                    customTextFailed(
                      controller: furnished,
                      lable: AppLocalizations.of(context)!.furnished,
                      hintText: AppLocalizations.of(context)!.furnished,
                      inputType: TextInputType.text,
                      labelColor: mainColor,
                      fillColor: Colors.white,
                    ),
                    customSpacer(height: 20.0),
                    customTextFailed(
                      controller: usingStatus,
                      lable: AppLocalizations.of(context)!.usingStatus,
                      hintText: AppLocalizations.of(context)!.usingStatus,
                      inputType: TextInputType.text,
                      labelColor: mainColor,
                      fillColor: Colors.white,
                    ),
                    customSpacer(height: 20.0),
                    customTextFailed(
                      controller: dues,
                      lable: AppLocalizations.of(context)!.dues,
                      hintText: AppLocalizations.of(context)!.dues,
                      inputType: TextInputType.text,
                      labelColor: mainColor,
                      fillColor: Colors.white,
                    ),
                    customSpacer(height: 20.0),
                    customTextFailed(
                      controller: deed,
                      lable: AppLocalizations.of(context)!.deed,
                      hintText: AppLocalizations.of(context)!.deed,
                      inputType: TextInputType.text,
                      labelColor: mainColor,
                      fillColor: Colors.white,
                    ),
                    customSpacer(height: 20.0),
                    customTextFailed(
                      controller: watching,
                      lable: AppLocalizations.of(context)!.watching,
                      hintText: AppLocalizations.of(context)!.watching,
                      inputType: TextInputType.text,
                      labelColor: mainColor,
                      fillColor: Colors.white,
                    ),
                    customSpacer(height: 20.0),
                    customTextFailed(
                      controller: bartered,
                      lable: AppLocalizations.of(context)!.bartered,
                      hintText: AppLocalizations.of(context)!.bartered,
                      inputType: TextInputType.text,
                      labelColor: mainColor,
                      fillColor: Colors.white,
                    ),
                    customSpacer(height: 20.0),
                  ],
                ),
              ),
              customPositioned(
                right: 0.0,
                left: 0.0,
                bottom: 0.0,
                child: customContainer(
                  height: 60,
                  colorBack: Colors.white,
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
                              child: customText(text: '(1/5)'))
                        ],
                      ),
                      GestureDetector(
                        onTap: () => checkBefore(context),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  // this method for check required Field befor nav to next page
  checkBefore(BuildContext context) {
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
      final main = advertTitle.text;
      final bb = explanation.text;
      final cc = price.text;
    }
  }
}
