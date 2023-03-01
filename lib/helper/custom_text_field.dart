import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';

Widget customTextFailed(
    {required TextEditingController? controller,
    String? lable,
    String? hintText,
    TextInputType? inputType,
   }) {
  return TextField(
    controller: controller,
    keyboardType:inputType ,
    enabled: true,
    decoration: InputDecoration(
      labelText: lable ?? 'Lable',
      hintText: hintText ?? 'Text',
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: mainColor, width: 1.0),
        
      ),
    ),
  );
}
