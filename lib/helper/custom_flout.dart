import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';

Widget customFloutButton(
    {required Function function,
    required Widget child,
    Color? backColor,
    String? tooltip,
    Color? focusColor}) {
  return FloatingActionButton(
      onPressed: () => function(),
      backgroundColor: backColor ?? mainColor,
      tooltip: tooltip ?? 'Click',
      focusColor: focusColor ?? secondColor,
      child: child);
}
