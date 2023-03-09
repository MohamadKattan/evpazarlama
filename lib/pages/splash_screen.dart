// ignore_for_file: avoid_print

import 'package:evpazarlama/client-srv/database_srv.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';
import '../../global-methods/methods.dart';
import '../../helper/custom_icon.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    pushAftrer3Second(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: mainColor,
            body: Center(child: cutomImage(imagePath: 'splash.png'))));
  }
}

void pushAftrer3Second(BuildContext context) {
  DataBaseSrv().getUserProfileInfo(context).whenComplete(() {
    GlobalMethods()
        .pushReplaceToNewScreen(context: context, routeName: toHomeScreen);
  });
}
