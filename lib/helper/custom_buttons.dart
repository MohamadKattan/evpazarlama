import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomIconButton {
  Widget customIconButton(
      {required VoidCallback function,
      required IconData icon,
      Color? color,
      double? size}) {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: function,
        icon: customIcon(iconData: icon, color: color, size: size));
  }
}
