import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/state-maneg/double_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../helper/config.dart';
import '../helper/custom_container.dart';
import '../helper/custom_dailog.dart';
import '../helper/custom_positioned.dart';
import '../helper/custom_spacer.dart';
import '../helper/custom_text.dart';
import '../helper/custom_text_field.dart';
import '../state-maneg/booling_val.dart';
import '../state-maneg/string_val.dart';

class StartWriteLocation extends StatelessWidget {
  const StartWriteLocation({super.key});
  static final TextEditingController _country = TextEditingController();
  static final TextEditingController _city = TextEditingController();
  static final TextEditingController _area = TextEditingController();
  static final TextEditingController _streat = TextEditingController();
  static final TextEditingController _streatNo = TextEditingController();
  static String? _countryOn, _cityOn, _areaOn, _streatOn, _streatNoOn;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(text: AppLocalizations.of(context)!.pickLocation),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: customText(
                          text:
                              '${AppLocalizations.of(context)!.requiredField}*',
                          textColor: Colors.red,
                          textFontSize: 14,
                          textAlign: TextAlign.start),
                    ),
                    customTextFailed(
                        controller: _country,
                        lable: AppLocalizations.of(context)!.choseCountry,
                        hintText: AppLocalizations.of(context)!.choseCountry,
                        inputType: TextInputType.text,
                        labelColor: mainColor,
                        fillColor: Colors.white,
                        margin: 8.0,
                        function: (String onchngeVal) {
                          _countryOn = onchngeVal;
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: customText(
                          text:
                              '${AppLocalizations.of(context)!.requiredField}*',
                          textColor: Colors.red,
                          textFontSize: 14,
                          textAlign: TextAlign.start),
                    ),
                    customTextFailed(
                        controller: _city,
                        lable: AppLocalizations.of(context)!.choseCity,
                        hintText: AppLocalizations.of(context)!.choseCity,
                        inputType: TextInputType.text,
                        labelColor: mainColor,
                        fillColor: Colors.white,
                        margin: 8.0,
                        function: (String onchngeVal) {
                          _cityOn = onchngeVal;
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: customText(
                          text:
                              '${AppLocalizations.of(context)!.requiredField}*',
                          textColor: Colors.red,
                          textFontSize: 14,
                          textAlign: TextAlign.start),
                    ),
                    customTextFailed(
                        controller: _area,
                        lable: AppLocalizations.of(context)!.choseArea,
                        hintText: AppLocalizations.of(context)!.choseArea,
                        inputType: TextInputType.text,
                        labelColor: mainColor,
                        fillColor: Colors.white,
                        margin: 8.0,
                        function: (String onchngeVal) {
                          _areaOn = onchngeVal;
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: customText(
                          text:
                              '${AppLocalizations.of(context)!.requiredField}*',
                          textColor: Colors.red,
                          textFontSize: 14,
                          textAlign: TextAlign.start),
                    ),
                    customTextFailed(
                        controller: _streat,
                        lable: AppLocalizations.of(context)!.choseStreat,
                        hintText: AppLocalizations.of(context)!.choseStreat,
                        inputType: TextInputType.text,
                        labelColor: mainColor,
                        fillColor: Colors.white,
                        margin: 8.0,
                        function: (String onchngeVal) {
                          _streatOn = onchngeVal;
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: customText(
                          text:
                              '${AppLocalizations.of(context)!.requiredField}*',
                          textColor: Colors.red,
                          textFontSize: 14,
                          textAlign: TextAlign.start),
                    ),
                    customTextFailed(
                        controller: _streatNo,
                        lable: AppLocalizations.of(context)!.choseStreatNo,
                        hintText: AppLocalizations.of(context)!.choseStreatNo,
                        inputType: TextInputType.number,
                        labelColor: mainColor,
                        fillColor: Colors.white,
                        margin: 8.0,
                        function: (String onchngeVal) {
                          _streatNoOn = onchngeVal;
                        }),
                    customSpacer(height: 40.0),
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
                            width: MediaQuery.of(context).size.width * 25 / 100,
                            height: 20,
                            ridusBL: 12.0,
                            ridusBR: 12.0,
                            ridusR: 12.0,
                            ridusl: 12.0,
                          ),
                          customPositioned(
                              left: 0.0,
                              right: 0.0,
                              child: customText(text: '(2/5)'))
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
                          child: circleOrText(context),
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

  Widget circleOrText(BuildContext context) {
    bool val = context.watch<BoolingVal>().isLodingAuth;
    return val
        ? const CircularProgressIndicator(
            color: Colors.white,
          )
        : customText(
            text: AppLocalizations.of(context)!.next, textColor: Colors.white);
  }

  // this method for check text Faile if it is not empty
  void checkBefore(BuildContext context) {
    if (_country.text.isEmpty) {
      CustomDailog().customSnackBar(
          context: context,
          text:
              '${AppLocalizations.of(context)!.choseCountry} ${AppLocalizations.of(context)!.requiredField}',
          color: Colors.red);
    } else if (_city.text.isEmpty) {
      CustomDailog().customSnackBar(
          context: context,
          text:
              '${AppLocalizations.of(context)!.choseCity} ${AppLocalizations.of(context)!.requiredField}',
          color: Colors.red);
    } else if (_area.text.isEmpty) {
      CustomDailog().customSnackBar(
          context: context,
          text:
              '${AppLocalizations.of(context)!.choseArea} ${AppLocalizations.of(context)!.requiredField}',
          color: Colors.red);
    } else if (_streat.text.isEmpty) {
      CustomDailog().customSnackBar(
          context: context,
          text:
              '${AppLocalizations.of(context)!.choseStreat} ${AppLocalizations.of(context)!.requiredField}',
          color: Colors.red);
    } else if (_streatNo.text.isEmpty) {
      CustomDailog().customSnackBar(
          context: context,
          text:
              '${AppLocalizations.of(context)!.choseStreatNo} ${AppLocalizations.of(context)!.requiredField}',
          color: Colors.red);
    } else {
      setValForDataBase(context);
    }
  }

  void setValForDataBase(BuildContext context) {
    Provider.of<BoolingVal>(context, listen: false).loadingAuth(true);
    GlobalMethods().getLocations(context);
    context.read<StringVal>().updatAdresse(_countryOn ?? '', _cityOn ?? '',
        _areaOn ?? '', '', _streatOn ?? '', _streatNoOn ?? '');

    context
        .read<DoubleVal>()
        .updateLatLon(latitudeVal ?? 0.0, longitudeVal ?? 0.0);

    Provider.of<BoolingVal>(context, listen: false).loadingAuth(false);
    GlobalMethods().pushToNewScreen(context: context, routeName: toAddPhoto);
  }
}
