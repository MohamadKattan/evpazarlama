import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/pages/login_screen.dart';
import 'package:evpazarlama/pages/profile_info.dart';
import 'package:evpazarlama/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'pages/main_category.dart';
import 'pages/home_screen.dart';
import 'pages/last_ads.dart';
import 'pages/list_of_item.dart';
import 'pages/result_all_real.dart';
import 'pages/splash_screen.dart';
import 'pages/urgent_screen.dart';
import 'state-maneg/booling_val.dart';
import 'state-maneg/image_val.dart';
import 'state-maneg/string_val.dart';

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
          Locale('en'), // enÍ
          Locale('ar'), // ar
          Locale('tr'), // tr
        ],
        initialRoute: '/',
        routes: {
          toSplash: (context) => const SplashScreen(),
          toHomeScreen: (context) => const HomeScreen(),
          toMainCategory: (context) => const MainCategory(),
          toLastAds: (context) => const LastAds(),
          toUrgentScrren: (context) => const UrgentScrren(),
          toResAllReal: (context) => const ResAllRealState(),
          toListOfIteamRealEstate: (context) => const ListOfIteam(),
          toLoginScreen: (context) => const LoginScreen(),
          toProfileInfo: (context) => const ProfileInfo(),
          toProfileScreen: (context) => const ProfileScreen()
        },
      ),
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