import 'package:flutter/material.dart';

Widget customText(
    {String? text,
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? textColor,
    double? textFontSize,
    FontWeight? textWeight}) {
  return Text(
    text ?? "No val",
    textAlign: textAlign ?? TextAlign.center,
    overflow: overflow ?? TextOverflow.clip,
    style: TextStyle(
        color: textColor ?? Colors.white,
        fontSize: textFontSize ?? 16.0,
        fontWeight: textWeight ?? FontWeight.normal),
  );
}
