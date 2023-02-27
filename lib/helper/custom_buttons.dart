import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:flutter/material.dart';

Widget customIconButton(
    {required VoidCallback function, required IconData icon, Color? color}) {
  return IconButton(
      onPressed:function,
      icon: customIcon(
        iconData: icon,
        color: color,
      ));
}
