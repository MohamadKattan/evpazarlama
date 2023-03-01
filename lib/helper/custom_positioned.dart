import 'package:flutter/material.dart';

Widget customPositioned(
    {required Widget child,
    double? bottom,
    double? top,
    double? left,
    double? right}) {
  return Positioned(
    right: right,
    left: left,
    bottom: bottom,
    top: top,
    child: child,
  );
}
