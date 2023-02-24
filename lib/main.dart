import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/pages/main-screens/category_hotels.dart';
import 'package:evpazarlama/pages/main-screens/category_realstate.dart';
import 'package:evpazarlama/pages/main-screens/home_screen.dart';
import 'package:evpazarlama/pages/main-screens/last_ads.dart';
import 'package:evpazarlama/pages/sub-realEstatae/list_of_item.dart';
import 'package:evpazarlama/pages/sub-realEstatae/result_all_real.dart';
import 'package:evpazarlama/pages/main-screens/urgent_screen.dart';
import 'package:evpazarlama/pages/main-screens/category_vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'pages/main-screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// project start build at 17/2/2023
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ev Pazarlama',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // aribic
        Locale('tr'), // aribic
      ],
      initialRoute: '/',
      routes: {
        toSplash: (context) => const SplashScreen(),
        toHomeScreen: (context) => const HomeScreen(),
        toRealCategory: (context) => const RealEstateCategory(),
        toVehicleCategory: (context) => const VehicleCategory(),
        toHotelsCategory: (context) => const HotelsCategory(),
        toLastAds: (context) => const LastAds(),
        toUrgentScrren: (context) => const UrgentScrren(),
        toResAllReal: (context) => const ResAllRealState(),
        toListOfIteamRealEstate: (context) => const ListOfIteamRealEstate(),
      },
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