// ignore_for_file: avoid_print

import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';

import '../global-methods/methods.dart';
import '../helper/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    pushAftrer3Second(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: mainColor,
      body: Center(
          child: customText(
              text: "Ev pazarlama",
              textFontSize: 20,
              textWeight: FontWeight.bold)),
    ));
  }
}

void pushAftrer3Second(BuildContext context) {
  Future.delayed(const Duration(seconds: 4)).whenComplete(
      () => pushReplaceToNewScreen(context: context, routeName: toHomeScreen));
}