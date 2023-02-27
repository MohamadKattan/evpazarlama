import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';

Widget cutomImageIcon(
    {required String imagePath, double? height, double? width}) {
  return Image.asset(
    'assets/icons/$imagePath',
    width: width ?? 25.0,
    height: height ?? 25.0,
  );
}

Widget cutomImage({required String imagePath,double?height,double?width}) {
  return Image.asset('assets/imgs/$imagePath',width: width??250,height: height??250.0,);
}

Widget customIcon({required IconData iconData, Color? color, double? size}) {
  return Icon(
    iconData,
    size: size ?? 20.0,
    color: color ?? defColor,
  );
}
