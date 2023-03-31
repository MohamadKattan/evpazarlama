import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../models/user_info.dart';

//0==============UserConfig===============
FirebaseAuth authInstance = FirebaseAuth.instance; //auth
String userId = authInstance.currentUser?.uid ?? 'null'; //auth
final storage = FirebaseStorage.instance.ref(); //storage
FirebaseFirestore firestore = FirebaseFirestore.instance; //cloud
CollectionReference usersProfileCollection =
    firestore.collection('users').doc(userId).collection('profile'); //cloud
CollectionReference myAdsCollection =
    firestore.collection('users').doc(userId).collection('myAds');
CollectionReference adsCollection = firestore.collection('allAds'); //cloud
UserInfoProfile? userInfoProfile;
// 1_============proprty===================
const Color mainColor = Color(0xFF00A3E0);
const Color secondColor = Color(0xFFFBC408);
const Color defColor = Colors.white;
final Color greyColor = Colors.grey.shade300;
String urlHolder = 'https://placehold.jp/200x145.png';
Position? currentPosition;
double? latitudeVal;
double? longitudeVal;

//2_===========val for condtions============

//for chose main catogry realEstate,Vehicle,Hotels,lastADS,UrgentUrgent
int mainCatogry = 0; // Estate0,Vehicle1,Hotel2,last38Ads3,Urgent4
int listOfItemVal = 0; // housItems0,workPlace1,Motor2,car3,Mini4....
int saleRentElseVal = 0; // sale 0, rent 1, daily 2,trans 3 for send to data
String? sub2CatToDtabase;
List listDetailsAds = [];
List listTitleDetails = [];
int day = DateTime.now().day;
int monthe = DateTime.now().month;
int expirtMont = monthe != 12 ? DateTime.now().month + 1 : 1;
int year = DateTime.now().year;
int exPirtyear = monthe != 12 ? DateTime.now().year : DateTime.now().year + 1;
List<AdsModel> listownerAdsOk = [];
List<AdsModel> listownerAdsPandding = [];
List<AdsModel> listGenarlAds = [];
List<AdsModel> listAds48Houer = [];
List<AdsModel> list48AllRealEstate = [];
List<AdsModel> list48AllVehicles = [];
List<AdsModel> list48AllHotels = [];
List<AdsModel> listAllRealEstate = [];
List<AdsModel> listAllVehicles = [];
List<AdsModel> listAllHotels = [];
List<AdsModel> listLand = [];
List<AdsModel> listBuilding = [];
List<AdsModel> listHousing = [];
List<AdsModel> listWorkPlace = [];
List<AdsModel> listMotor = [];
List<AdsModel> listCar = [];
List<AdsModel> listHotel = [];
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
const toAddPhoto = '/AddPhotos';
const toStartMapLocation = '/StartMapLocation';
const toSatrtWriteLocation = "/StartWriteLocation";
const toPlanScreen = '/PlanScreen';
const toCheckInfoAds = '/CheckInfoAds';

//================================GoogleApi================================
String mapKey = 'AIzaSyDDWVGy2LEOWSMpnV8ov7xTXYsysthl8iY'; //googleMapAuth
String geocodingUrl =
    'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitudeVal,$longitudeVal&key=$mapKey';
