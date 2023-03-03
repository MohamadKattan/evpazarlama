import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//0==============UserConfig===============
FirebaseAuth authInstance = FirebaseAuth.instance;
String userId = authInstance.currentUser?.uid ?? 'null';

// 1_============proprty===================
const Color mainColor = Color(0xFF00A3E0);
const Color secondColor = Color(0xFFFBC408);
const Color defColor = Colors.white;
final Color greyColor = Colors.grey.shade300;
const double spacePadding = 15.0;
const double spaceMarging = 15.0;
//2_===========val for condtions============

//for chose main catogry realEstate,Vehicle,Hotels,lastADS,UrgentUrgent
int mainCatogry = 0; // Estate0,Vehicle1,Hotel2,last38Ads3,Urgent4
int saleRentElseVal = 0; // sale 0, rent 1, daily 2,trans 3 for list dailog
// housItems 0,workPlace1,Motor2,car3,Mini4,Electric5,commer6
int listOfItemVal = 0;
//3===============_root====================
const toSplash = '/';
const toHomeScreen = '/HomeScreen';
const toMainCategory = '/MainCategory';
const toVehicleCategory = '/VehicleCategory';
const toHotelsCategory = '/HotelsCategory';
const toLastAds = '/LastAds';
const toUrgentScrren = '/UrgentScrren';
const toResAllReal = '/ResAllRealState';
const toListOfIteamRealEstate = '/ListOfIteamRealEstate';
const toProfileScreen = '/ProfileScreen';
const toLoginScreen = '/LoginScreen';
const toCodePhone = '/CodePhone';
