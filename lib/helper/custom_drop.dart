import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';

class MyDropButton {
  Widget customDropButton(
      {required BuildContext context,
      double? width,
      double? fontSizeC,
      double? margin,
      required String? dropdownValue,
      required List<String> list,
      required Function(String? valueChange) function}) {
    // String? dropdownValue = context.watch<StringVal>().dropdownValue;
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      margin:  EdgeInsets.all(margin??0.0),
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue ?? list.first,
        dropdownColor: Colors.white,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 35.0,
        elevation: 16,
        style: TextStyle(color: mainColor, fontSize: fontSizeC ?? 16),
        underline: Container(
          color: Colors.transparent,
        ),
        onChanged: (String? value) {
          // Provider.of<StringVal>(context, listen: false)
          //     .updateDropdownVal(value!);
          function(value);
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
