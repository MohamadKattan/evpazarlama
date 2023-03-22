import 'package:evpazarlama/state-maneg/double_val.dart';
import 'package:evpazarlama/state-maneg/string_val.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/config.dart';

class AdsModel {
  String? amainCatogry;
  String? asubCatogry;
  String? asub2Catogry;
  String? aoperation;
  String? adsNumber;
  Map? adress;
  List? images;
  List? details;
  Map? sitting;
  AdsModel(
      {this.amainCatogry,
      this.asubCatogry,
      this.asub2Catogry,
      this.aoperation,
      this.adsNumber,
      this.adress,
      this.images,
      this.details,
      this.sitting});
  AdsModel.fromJson(Map<String, dynamic> map)
      : this(
          amainCatogry: map['amainCatogry'],
          asubCatogry: map['asubCatogry'],
          asub2Catogry: map['asub2Catogry'],
          aoperation: map['aoperation'],
          adsNumber: map['adsNumber'],
          adress: map['adress'],
          images: map['images'],
          details: map['details'],
          sitting: map['sitting'],
        );
  Map<String, dynamic> toJson(
          {required BuildContext context,
          required int adsNumber,
          required List urlImages}) =>
      {
        "amainCatogry": mainCatogry.toString(),
        "asubCatogry": listOfItemVal.toString(),
        "asub2Catogry": sub2CatToDtabase,
        "aoperation": saleRentElseVal.toString(),
        "adsNumber": adsNumber.toString(),
        "adress": {
          "country": context.read<StringVal>().country,
          "city": context.read<StringVal>().city,
          "area": context.read<StringVal>().area,
          "mainStreat": context.read<StringVal>().mainStraet,
          "streat": context.read<StringVal>().straet,
          "streatNo": context.read<StringVal>().straetNo,
          "latitude": context.read<DoubleVal>().latitude,
          "longitude": context.read<DoubleVal>().longitude,
        },
        "images": urlImages,
        "details": listCheckInfoAds,
        "sitting": {
          "userId": userId,
          "status": "ok",
          "dateStart": DateTime.utc(year, monthe, day),
          "dateExpired": DateTime.utc(exPirtyear, expirtMont, day),
        }
      };
}
