import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/helper/custom_text_field.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:evpazarlama/state-maneg/booling_val.dart';
import 'package:evpazarlama/state-maneg/string_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../client-srv/https_srv.dart';

class FilterDetails extends StatefulWidget {
  final List<AdsModel> list;
  const FilterDetails({super.key, required this.list});

  @override
  State<FilterDetails> createState() => _FilterDetailsState();
}

class _FilterDetailsState extends State<FilterDetails> {
  TextEditingController? _contry;
  TextEditingController? _city;
  TextEditingController? _area;
  TextEditingController? _mainStraet;
  TextEditingController? _streat;
  TextEditingController? _minPrice;
  TextEditingController? _maxPrice;
  bool isAutoSrearch = true;
  String? _contryOn, _cityOn, _areaOn;
  @override
  void initState() {
    getAdress();
    _contry = TextEditingController();
    _city = TextEditingController();
    _area = TextEditingController();
    _mainStraet = TextEditingController();
    _streat = TextEditingController();
    _minPrice = TextEditingController();
    _maxPrice = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _contry?.dispose();
    _city?.dispose();
    _area?.dispose();
    _mainStraet?.dispose();
    _streat?.dispose();
    _minPrice?.dispose();
    _maxPrice?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(
              text: AppLocalizations.of(context)!.filter,
              textColor: Colors.white),
        ),
        body: Stack(
          children: [
            isAutoSrearch ? autoFillAdress() : writeAdress(),
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
            )
          ],
        ),
      ),
    );
  }

  // this method for use current device location
  Future<void> getAdress() async {
    String? country, city, area, mainStreat, streat, strestNo;
    if (!context.mounted) return;
    await GlobalMethods().getLocations(context).whenComplete(
      () async {
        var res = await ClintHttpSrv()
            .getDataFromApi(context: context, urlApi: geocodingUrl);
        if (res != 'failed') {
          Map<String, dynamic> map = Map<String, dynamic>.from(res as Map);
          if (map['status'] == 'OK') {
            final listRes = map['results'][0]['address_components'];
            // streat = listRes[0]['long_name'];
            strestNo = listRes[1]['long_name'];
            for (var i = 0; i < listRes.length; i++) {
              if (listRes[i]['types'][0] == 'administrative_area_level_4') {
                streat = listRes[i]['long_name'];
              } else if (listRes[i]['types'][0] ==
                  'administrative_area_level_3') {
                mainStreat = listRes[i]['long_name'];
              } else if (listRes[i]['types'][0] ==
                  'administrative_area_level_2') {
                area = listRes[i]['long_name'];
              } else if (listRes[i]['types'][0] ==
                  'administrative_area_level_1') {
                city = listRes[i]['long_name'];
              } else if (listRes[i]['types'][0] == 'country') {
                country = listRes[i]['long_name'];
              }
            }

            if (context.mounted) {
              context.read<StringVal>().updatAdresse(
                  country ?? 'Unknow',
                  city ?? 'Unknow',
                  area ?? 'Unknow',
                  mainStreat ?? 'Unknow',
                  streat ?? 'Unknow',
                  strestNo ?? 'Unknow');
              context.read<BoolingVal>().loadingAuth(false);
            }
          }
        }
      },
    );
    if (context.mounted) context.read<BoolingVal>().loadingAuth(false);
  }

// this widget by defult it will display for chose auto or manuel
  Widget autoFillAdress() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
            child: customText(
                text: AppLocalizations.of(context)!.autoLoactionExplain,
                textColor: mainColor,
                textAlign: TextAlign.center),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: mainColor, width: 1.0)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customText(
                      text: '${context.watch<StringVal>().country} - '
                          '${context.watch<StringVal>().city} - '
                          '${context.watch<StringVal>().area}',
                      textColor: mainColor,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customText(
                      text: '${context.watch<StringVal>().mainStraet} - '
                          '${context.watch<StringVal>().straet}',
                      textColor: mainColor,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          customTextFailed(
            controller: _minPrice,
            lable: AppLocalizations.of(context)!.minPrice,
            hintText: AppLocalizations.of(context)!.minPrice,
            inputType: TextInputType.number,
            labelColor: mainColor,
            fillColor: Colors.white,
            margin: 8.0,
            function: (String onChanged) {},
          ),
          customTextFailed(
            controller: _maxPrice,
            lable: AppLocalizations.of(context)!.maxPrice,
            hintText: AppLocalizations.of(context)!.maxPrice,
            inputType: TextInputType.number,
            labelColor: mainColor,
            fillColor: Colors.white,
            margin: 8.0,
            function: (String onChanged) {},
          ),
          customSpacer(height: 16.0),
          GestureDetector(
            onTap: () {
              adressFilter();
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(left: 8.0, right: 8.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child:
                  customText(text: AppLocalizations.of(context)!.displayResult),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customText(
                text: '- ${AppLocalizations.of(context)!.or} -',
                textColor: secondColor,
                textFontSize: 20.0,
                textWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              isAutoSrearch = false;
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(left: 8.0, right: 8.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child:
                  customText(text: AppLocalizations.of(context)!.mainuilSearch),
            ),
          ),
        ],
      ),
    );
  }

//this widget it well display if user want to enter locaton manuel
  Widget writeAdress() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customText(
                text: AppLocalizations.of(context)!.locationManaul,
                textColor: mainColor),
          ),
          customTextFailed(
            controller: _contry,
            lable: context.watch<StringVal>().country,
            hintText: AppLocalizations.of(context)!.choseCountry,
            inputType: TextInputType.text,
            labelColor: mainColor,
            fillColor: Colors.white,
            margin: 8.0,
            function: (String onChanged) {
              _contryOn = onChanged;
              setAdreesOnchange();
            },
          ),
          customTextFailed(
            controller: _city,
            lable: context.watch<StringVal>().city,
            hintText: AppLocalizations.of(context)!.choseCity,
            inputType: TextInputType.text,
            labelColor: mainColor,
            fillColor: Colors.white,
            margin: 8.0,
            function: (String onChanged) {
              _cityOn = onChanged;
              setAdreesOnchange();
            },
          ),
          customTextFailed(
            controller: _area,
            lable: context.watch<StringVal>().area,
            hintText: AppLocalizations.of(context)!.choseArea,
            inputType: TextInputType.text,
            labelColor: mainColor,
            fillColor: Colors.white,
            margin: 8.0,
            function: (String onChanged) {
              _areaOn = onChanged;
              setAdreesOnchange();
            },
          ),
          customTextFailed(
            controller: _mainStraet,
            lable: context.watch<StringVal>().mainStraet,
            hintText: AppLocalizations.of(context)!.choseStreat,
            inputType: TextInputType.text,
            labelColor: mainColor,
            fillColor: Colors.white,
            margin: 8.0,
            function: (String onChanged) {
              // cityChVAL = onChanged;
              // myFilter();
            },
          ),
          customTextFailed(
            controller: _minPrice,
            lable: AppLocalizations.of(context)!.minPrice,
            hintText: AppLocalizations.of(context)!.minPrice,
            inputType: TextInputType.number,
            labelColor: mainColor,
            fillColor: Colors.white,
            margin: 8.0,
            function: (String onChanged) {
              // myFilter();
            },
          ),
          customTextFailed(
            controller: _maxPrice,
            lable: AppLocalizations.of(context)!.maxPrice,
            hintText: AppLocalizations.of(context)!.maxPrice,
            inputType: TextInputType.number,
            labelColor: mainColor,
            fillColor: Colors.white,
            margin: 8.0,
            function: (String onchngeVal) {},
          ),
          customSpacer(height: 16.0),
          GestureDetector(
            onTap: () {
              adressFilter();
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child:
                  customText(text: AppLocalizations.of(context)!.displayResult),
            ),
          ),
        ],
      ),
    );
  }

  // this method for change adress in provder while write on textFailed
  void setAdreesOnchange() {
    context.read<StringVal>().updatAdresse(
        _contryOn ?? context.read<StringVal>().country!,
        _cityOn ?? context.read<StringVal>().city!,
        _areaOn ?? context.read<StringVal>().area!,
        context.read<StringVal>().mainStraet!,
        context.read<StringVal>().straet!,
        context.read<StringVal>().straetNo!);
  }

//  this method for filtter
  void adressFilter() {
    context.read<BoolingVal>().loadingAuth(true);
    listOfFilter.clear();

    String? con = context.read<StringVal>().country?.toLowerCase().trim();
    String? cit = context.read<StringVal>().city?.toLowerCase().trim();
    String? area = context.read<StringVal>().area?.toLowerCase().trim();

    for (var i = 0; i < widget.list.length; i++) {
      if (widget.list[i].country!.contains(con!) &&
          widget.list[i].city!.contains(cit!)) {
        if (widget.list[i].area!.contains(area!)) {
          if (_maxPrice!.text.isNotEmpty) {
            int listVal =
                int.parse(widget.list[i].details![2].toString().trim());
            int maxP = int.parse(_maxPrice!.text.trim());
            if (listVal <= maxP) {
              listOfFilter.add(widget.list[i]);
            }
          } else {
            listOfFilter.add(widget.list[i]);
          }
        }
        if (i + 1 == widget.list.length) {
          context.read<BoolingVal>().loadingAuth(false);
          if (listOfFilter.isNotEmpty) {
            Navigator.pop(context, true);
          } else {
            CustomDailog().customSnackBar(
                context: context, text: AppLocalizations.of(context)!.noFound);
            Navigator.pop(context, false);
          }
        }
      }
    }
  }
}
