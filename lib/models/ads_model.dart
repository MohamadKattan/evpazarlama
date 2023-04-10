import 'package:cloud_firestore/cloud_firestore.dart';
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
  String? country;
  String? city;
  String? area;
  String? mainStreat;
  String? streat;
  String? streatNo;
  double? latitude;
  double? longitude;
  List? owner;
  List? images;
  List? details;
  List? title;
  Timestamp? dateExpired;
  Timestamp? dateStart;
  String? status;
  String? ownerId;
  String? adsId;
  AdsModel(
      {this.amainCatogry,
      this.asubCatogry,
      this.asub2Catogry,
      this.aoperation,
      this.adsNumber,
      this.country,
      this.city,
      this.area,
      this.mainStreat,
      this.streat,
      this.streatNo,
      this.latitude,
      this.longitude,
      this.owner,
      this.images,
      this.details,
      this.title,
      this.dateExpired,
      this.dateStart,
      this.status,
      this.ownerId,
      this.adsId});
  AdsModel.fromJson(Map<String, dynamic> map)
      : this(
            amainCatogry: map['amainCatogry'],
            asubCatogry: map['asubCatogry'],
            asub2Catogry: map['asub2Catogry'],
            aoperation: map['aoperation'],
            adsNumber: map['adsNumber'],
            owner: map['owner'],
            country: map['adress']['country'],
            city: map['adress']['city'],
            area: map['adress']['area'],
            mainStreat: map['adress']['mainStreat'],
            streat: map['adress']['streat'],
            streatNo: map['adress']['streatNo'],
            latitude: map['adress']['latitude'],
            longitude: map['adress']['longitude'],
            images: map['images'],
            details: map['details'],
            title: map['title'],
            dateExpired: map['sitting']['dateExpired'],
            dateStart: map['sitting']['dateStart'],
            status: map['sitting']['status'],
            ownerId: map['sitting']['userId'],
            adsId: map['sitting']['adsId']);
  Map<String, dynamic> toJson(
          {required BuildContext context,
          required int adsNumber,
          required List urlImages,
          required String adsId}) =>
      {
        "amainCatogry": mainCatogry.toString(),
        "asubCatogry": listOfItemVal.toString(),
        "asub2Catogry": sub2CatToDtabase,
        "aoperation": saleRentElseVal.toString(),
        "adsNumber": adsNumber.toString(),
        "owner": [
          userInfoProfile?.userName ?? 'name',
          userInfoProfile?.userPhone ?? '+90..',
          userInfoProfile?.userAccountType ?? 'Tax'
        ],
        "adress": {
          "country": context.read<StringVal>().country?.toLowerCase().trim(),
          "city": context.read<StringVal>().city?.toLowerCase().trim(),
          "area": context.read<StringVal>().area?.toLowerCase().trim(),
          "mainStreat": context.read<StringVal>().mainStraet?.toLowerCase(),
          "streat": context.read<StringVal>().straet?.toLowerCase(),
          "streatNo": context.read<StringVal>().straetNo?.toLowerCase(),
          "latitude": context.read<DoubleVal>().latitude,
          "longitude": context.read<DoubleVal>().longitude,
        },
        "images": urlImages,
        "details": listDetailsAds,
        "title": listTitleDetails,
        "sitting": {
          "userId": userId,
          "adsId": '$adsId$userId',
          "status": "ok",
          "dateStart": DateTime.utc(year, monthe, day),
          "dateExpired": DateTime.utc(exPirtyear, expirtMont, day),
        }
      };
}
