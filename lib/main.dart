import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/pages/add_new_ads.dart';
import 'package:evpazarlama/pages/add_photo.dart';
import 'package:evpazarlama/pages/ads_dat_bulding.dart';
import 'package:evpazarlama/pages/ads_dat_hotel.dart';
import 'package:evpazarlama/pages/ads_dat_house.dart';
import 'package:evpazarlama/pages/ads_dat_land.dart';
import 'package:evpazarlama/pages/ads_dat_vehicles.dart';
import 'package:evpazarlama/pages/ads_dat_work.dart';
import 'package:evpazarlama/pages/ads_listofitem.dart';
import 'package:evpazarlama/pages/ads_main_cateegory.dart';
import 'package:evpazarlama/pages/check_info_ads.dart';
import 'package:evpazarlama/pages/favori.dart';
import 'package:evpazarlama/pages/plan_screen.dart';
import 'package:evpazarlama/pages/start_map_location.dart';
import 'package:evpazarlama/pages/login_screen.dart';
import 'package:evpazarlama/pages/profile_info.dart';
import 'package:evpazarlama/pages/profile_screen.dart';
import 'package:evpazarlama/pages/start_pick_location.dart';
import 'package:evpazarlama/pages/start_write_location.dart';
import 'package:evpazarlama/state-maneg/double_val.dart';
import 'package:evpazarlama/state-maneg/int_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'pages/home_screen.dart';
import 'pages/last_ads.dart';
import 'pages/splash_screen.dart';
import 'pages/urgent_screen.dart';
import 'state-maneg/booling_val.dart';
import 'state-maneg/image_val.dart';
import 'state-maneg/string_val.dart';

// satrday at 18/3/2023 i got sallary for month 2 =>600$ from nizam
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// project start build at 17/2/2023
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BoolingVal()),
        ChangeNotifierProvider(create: (_) => StringVal()),
        ChangeNotifierProvider(create: (_) => ImageVal()),
        ChangeNotifierProvider(create: (_) => DoubleVal()),
        ChangeNotifierProvider(create: (_) => IntVal())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ev Pazarlama',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // en
            Locale('ar'), // ar
            Locale('tr'), // tr
          ],
          initialRoute: '/',
          routes: {
            toSplash: (context) => const SplashScreen(),
            toHomeScreen: (context) => const HomeScreen(),
            // toMainCategory: (context) => const MainCategory(list: [],),
            toLastAds: (context) => const LastAds(),
            toUrgentScrren: (context) => const UrgentScrren(),
            // toResAllReal: (context) => const ResAllRealState(list:[],),
            // toListOfIteam: (context) => const ListOfIteam(),
            toLoginScreen: (context) => const LoginScreen(),
            toProfileInfo: (context) => const ProfileInfo(),
            toProfileScreen: (context) => const ProfileScreen(),
            toAddNewAds: (context) => const AddNewAds(),
            toAdsMainCategory: (context) => const AdsMainCategory(),
            toAdsListOfItems: (context) => const AdsListOfItem(),
            toAdsDetailsHoseing: (context) => const AdsDetailsHoseing(),
            toAdsDetailsWorkPlace: (context) => const AdsDetailsWorkPlace(),
            toAdsDetailsLand: (context) => const AdsDetailsLand(),
            toAdsDetailsBulding: (context) => const AdsDetailsBulding(),
            toAdsDetailsVehicles: (context) => const AdsDetailsVehicles(),
            toAdsDetailsHotels: (context) => const AdsDetailsHotels(),
            toStartPickLocation: (context) => const StartPickLocation(),
            toAddPhoto: (context) => const AddPhotos(),
            toStartMapLocation: (context) => const StartMapLocation(),
            toSatrtWriteLocation: (context) => const StartWriteLocation(),
            toPlanScreen: (context) => const PlanScreen(),
            toCheckInfoAds: (context) => const CheckInfoAds(),
            toFavoriScreen: (context) => const FavoriScreen()
          }),
    );
  }
}
/*
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/MohamadKattan/evpazarlama.git
git push -u origin main
*/