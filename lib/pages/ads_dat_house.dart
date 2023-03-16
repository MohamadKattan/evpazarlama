import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_container.dart';
import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:evpazarlama/helper/custom_positioned.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/helper/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../state-maneg/booling_val.dart';
import '../state-maneg/string_val.dart';

class AdsDetailsHoseing extends StatefulWidget {
  const AdsDetailsHoseing({super.key});
  @override
  State<AdsDetailsHoseing> createState() => _AdsDetailsHoseingState();
}

class _AdsDetailsHoseingState extends State<AdsDetailsHoseing> {
  late TextEditingController advertTitle;
  late TextEditingController explanation;
  late TextEditingController price;
  late TextEditingController front;
  late TextEditingController grossMeters;
  late TextEditingController netMeters;
  late TextEditingController roomNum;
  late TextEditingController buldingAge;
  late TextEditingController floorLocation;
  late TextEditingController numOfFloors;
  late TextEditingController heating;
  late TextEditingController numberofPath;
  late TextEditingController balcony;
  late TextEditingController furnished;
  late TextEditingController usingStatus;
  late TextEditingController dues;
  late TextEditingController deed;
  late TextEditingController watching;
  late TextEditingController bartered;
  @override
  void initState() {
    GlobalMethods().locatioServiceEnabled(context);
    advertTitle = TextEditingController();
    explanation = TextEditingController();
    price = TextEditingController();
    front = TextEditingController();
    grossMeters = TextEditingController();
    netMeters = TextEditingController();
    roomNum = TextEditingController();
    buldingAge = TextEditingController();
    floorLocation = TextEditingController();
    numOfFloors = TextEditingController();
    heating = TextEditingController();
    numberofPath = TextEditingController();
    balcony = TextEditingController();
    furnished = TextEditingController();
    usingStatus = TextEditingController();
    dues = TextEditingController();
    deed = TextEditingController();
    watching = TextEditingController();
    bartered = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    advertTitle.dispose();
    explanation.dispose();
    price.dispose();
    front.dispose();
    grossMeters.dispose();
    netMeters.dispose();
    roomNum.dispose();
    buldingAge.dispose();
    floorLocation.dispose();
    numOfFloors.dispose();
    heating.dispose();
    numberofPath.dispose();
    furnished.dispose();
    usingStatus.dispose();
    dues.dispose();
    deed.dispose();
    watching.dispose();
    bartered.dispose();

    super.dispose();
  }

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

                    ///
                    customSpacer(height: 20.0),
                    customTextFailed(
                        controller: front,
                        lable: AppLocalizations.of(context)!.front,
                        hintText: AppLocalizations.of(context)!.front,
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
                              child: customText(text: '(1/5)'))
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<BoolingVal>().loadingAuth(true);
                          checkBefore(context);
                        },
                        child: customContainer(
                          colorBack: mainColor,
                          width: MediaQuery.of(context).size.width * 45 / 100,
                          ridusBL: 12.0,
                          ridusBR: 12.0,
                          ridusR: 12.0,
                          ridusl: 12.0,
                          child: circleOrText(),
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

  // this method for exstued val of list item and set to en val just
  void checkValSubCategory(BuildContext context) {
    String? val = context.watch<StringVal>().subCategoryValue ?? 'null';
    if (val.contains(AppLocalizations.of(context)!.apart1)) {
      subCatToDtabase = 'apart1';
    } else if (val.contains(AppLocalizations.of(context)!.residence)) {
      subCatToDtabase = 'residence';
    } else if (val.contains(AppLocalizations.of(context)!.detachedHouse)) {
      subCatToDtabase = 'detachedHouse';
    } else if (val.contains(AppLocalizations.of(context)!.villa)) {
      subCatToDtabase = 'villa';
    } else if (val.contains(AppLocalizations.of(context)!.farmHouse)) {
      subCatToDtabase = 'farmHouse';
    } else if (val.contains(AppLocalizations.of(context)!.mansion)) {
      subCatToDtabase = 'mansion';
    } else if (val.contains(AppLocalizations.of(context)!.summerhouse)) {
      subCatToDtabase = 'summerhouse';
    } else if (val.contains(AppLocalizations.of(context)!.prefabricatedHouse)) {
      subCatToDtabase = 'prefabricatedHouse';
    } else {
      subCatToDtabase = 'cooperative';
    }
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
      setAllVal();
    }
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      context.read<BoolingVal>().loadingAuth(false);
    });
  }

  void setAllVal() {
    mainCatToDtbase = mainCatogry.toString();
    operationtypeToDatBase = saleRentElseVal.toString();
    advTitleToDtbase = advertTitle.text;
    explanationToDtbase = explanation.text;
    priceToDtbase = price.text;
    frontToDtbase = front.text;
    grossMetersToDtabase = grossMeters.text;
    netMetersToDtabase = netMeters.text;
    roomNumToDtabase = roomNum.text;
    buldingAgeToDtabase = buldingAge.text;
    floorLocationToDtabase = floorLocation.text;
    numOfFloorsToDtabase = numOfFloors.text;
    heatingToDtabase = heating.text;
    numberofPathToDtabase = numberofPath.text;
    balconyToDtabase = balcony.text;
    furnishedToDtabase = furnished.text;
    usingStatusToDtabase = usingStatus.text;
    duesToDtabase = dues.text;
    deedToDtabase = deed.text;
    watchingToDtabase = watching.text;
    barteredToDtabase = bartered.text;
    GlobalMethods()
        .pushToNewScreen(context: context, routeName: toStartPickLocation);
  }

  Widget circleOrText() {
    bool val = context.watch<BoolingVal>().isLodingAuth;
    return val
        ? const CircularProgressIndicator(
            color: Colors.white,
          )
        : customText(
            text: AppLocalizations.of(context)!.next, textColor: Colors.white);
  }
}
