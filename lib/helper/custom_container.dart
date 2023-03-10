import 'package:flutter/material.dart';

Widget customContainer(
    {double? height,
    double? width,
    Alignment? alignment,
    double? spaceAroundLeft,
    double? spaceAroundRight,
    double? spaceAroundTop,
    double? spaceAroundBottom,
    double? spaceAroundLeftMargin,
    double? spaceAroundRightMargin,
    double? spaceAroundTopMargin,
    double? spaceAroundBottomMargin,
    double? borderWidth,
    double? ridusl,
    double? ridusR,
    double? ridusBR,
    double? ridusBL,
    Color? borderColor,
    Color? colorBack,
    BoxShape? boxShape,
    Widget? child}) {
  return Container(
    width: width,
    height: height,
    alignment: alignment ?? Alignment.center,
    margin: EdgeInsets.only(
      left: spaceAroundLeftMargin ?? 0.0,
      right: spaceAroundRightMargin ?? 0.0,
      top: spaceAroundTopMargin ?? 0.0,
      bottom: spaceAroundBottomMargin ?? 0.0,
    ),
    padding: EdgeInsets.only(
      left: spaceAroundLeft ?? 8.0,
      right: spaceAroundRight ?? 8.0,
      top: spaceAroundTop ?? 8.0,
      bottom: spaceAroundBottom ?? 8.0,
    ),
    decoration: BoxDecoration(
      color: colorBack ?? Colors.transparent,
      border: Border.all(
          width: borderWidth ?? 0.0, color: borderColor ?? Colors.transparent),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ridusl ?? 0.0),
          topRight: Radius.circular(ridusR ?? 0.0),
          bottomLeft: Radius.circular(ridusBL ?? 0.0),
          bottomRight: Radius.circular(ridusBR ?? 0.0)),
      shape: boxShape ?? BoxShape.rectangle,
    ),
    child: child ?? const SizedBox(),
  );
}
