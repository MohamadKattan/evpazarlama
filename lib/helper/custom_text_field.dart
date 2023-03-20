import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';

Widget customTextFailed({
  required TextEditingController? controller,
  required Function(String onchngeVal) function,
  String? lable,
  String? hintText,
  TextInputType? inputType,
  Color? fillColor,
  Color? labelColor,
  double? margin,
}) {
  return Container(
    margin: EdgeInsets.all(margin ?? 0.0),
    child: TextField(
      controller: controller,
      onChanged: (value) {
        function(value);
      },
      keyboardType: inputType,
      enabled: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15.0),
        filled: true,
        fillColor: fillColor ?? Colors.transparent,
        labelText: lable ?? 'Lable',
        labelStyle: TextStyle(color: labelColor ?? Colors.grey),
        hintText: hintText ?? 'Text',
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: mainColor, width: 1.0),
        ),
      ),
    ),
  );
}
