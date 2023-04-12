// ignore_for_file: avoid_print

import 'package:evpazarlama/client-srv/database_srv.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';
import '../../global-methods/methods.dart';
import '../../helper/custom_icon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pushAftrer3Second(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: cutomImage(imagePath: 'splash.png'),
        ),
      ),
    );
  }
}

Future<void> pushAftrer3Second(BuildContext context) async {
  GlobalMethods().requestPermission(context);
  await DataBaseSrv().getUserProfileInfo(context);
  // await DataBaseSrv().getStreamAllAds();
  if (context.mounted) {
    DataBaseSrv().getOwnerAds(context);
    DataBaseSrv().getMyFavori(context);
    DataBaseSrv().changeStatusAds(context);
  }

  await Future.delayed(const Duration(milliseconds: 1000));
  if (context.mounted) {
    GlobalMethods()
        .pushReplaceToNewScreen(context: context, routeName: toHomeScreen);
  }
}
