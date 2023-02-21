import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/pages/home_screen.dart';
import 'package:flutter/material.dart';

import 'pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// project start build at 17/2/2023
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ev Pazarlama',
        initialRoute: '/',
        routes: {
          toSplash:(context)=> const SplashScreen(),
          toHomeScreen:(context)=>const HomeScreen(),
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