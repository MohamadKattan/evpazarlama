import 'package:flutter/material.dart';

Widget customSpacer({double? height, double? width}) {
  return SizedBox(
    height: height ?? 0.0,
    width: width ?? 0.0,
  );
}
