import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../models/model_ads_hoseing.dart';
import '../models/user_info.dart';

//0==============UserConfig===============
FirebaseAuth authInstance = FirebaseAuth.instance; //auth
String userId = authInstance.currentUser?.uid ?? 'null'; //auth
final storage = FirebaseStorage.instance.ref(); //storage
FirebaseFirestore firestore = FirebaseFirestore.instance; //cloud
CollectionReference usersProfileCollection =
    firestore.collection('users').doc(userId).collection('profile'); //cloud
String mapKey = 'AIzaSyDDWVGy2LEOWSMpnV8ov7xTXYsysthl8iY'; //googleMapAuth

UserInfoProfile? userInfoProfile;
AdsHoseingModel? adsHoseingModel;
// 1_============proprty===================
const Color mainColor = Color(0xFF00A3E0);
const Color secondColor = Color(0xFFFBC408);
const Color defColor = Colors.white;
final Color greyColor = Colors.grey.shade300;
//2_===========val for condtions============

//for chose main catogry realEstate,Vehicle,Hotels,lastADS,UrgentUrgent
// Estate0,Vehicle1,Hotel2,last38Ads3,Urgent4
int mainCatogry = 0;
// housItems 0,workPlace1,Motor2,car3,Mini4,Electric5,commer6
int listOfItemVal = 0;
// sale 0, rent 1, daily 2,trans 3 for send to data
int saleRentElseVal = 0;
//3===============_root====================
const toSplash = '/';
const toHomeScreen = '/HomeScreen';
const toMainCategory = '/MainCategory';
const toVehicleCategory = '/VehicleCategory';
const toHotelsCategory = '/HotelsCategory';
const toLastAds = '/LastAds';
const toUrgentScrren = '/UrgentScrren';
const toResAllReal = '/ResAllRealState';
const toListOfIteam = '/ListOfIteam';
const toProfileScreen = '/ProfileScreen';
const toLoginScreen = '/LoginScreen';
const toCodePhone = '/CodePhone';
const toProfileInfo = '/ProfileInfo';
const toAddNewAds = '/AddNewAds';
const toAdsMainCategory = '/AdsMainCategory';
const toAdsListOfItems = '/AdsListOfItem';
const toAdsDetailsHoseing = '/AdsDetailsHoseing';
const toAdsDetailsWorkPlace = '/toAdsDetailsWorkPlace';
const toAdsDetailsLand = '/AdsDetailsland';
const toAdsDetailsBulding = '/AdsDetailsBulding';
const toAdsDetailsVehicles = '/AdsDetailsVehicles';
const toAdsDetailsHotels = '/AdsDetailsHotels';
const toStartPickLocation = '/StartPickLocation';

//==================values ads to database===============
String? mainCatToDtbase;
String? subCatToDtabase;
String? operationtypeToDatBase;
String? advTitleToDtbase;
String? explanationToDtbase;
String? priceToDtbase;
String? frontToDtbase;
String? grossMetersToDtabase;
String? netMetersToDtabase;
String? roomNumToDtabase;
String? buldingAgeToDtabase;
String? floorLocationToDtabase;
String? numOfFloorsToDtabase;
String? heatingToDtabase;
String? numberofPathToDtabase;
String? balconyToDtabase;
String? furnishedToDtabase;
String? usingStatusToDtabase;
String? duesToDtabase;
String? deedToDtabase;
String? watchingToDtabase;
String? barteredToDtabase;
