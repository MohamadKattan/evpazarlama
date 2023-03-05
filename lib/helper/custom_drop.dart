import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state-maneg/string_val.dart';

Widget customDropButton(
    {required List<String> list, required BuildContext context}) {
  String? dropdownValue =context.watch<StringVal>().dropdownValue;
    // Provider.of<StringVal>(context).dropdownValue;
  return Container(
    margin: const EdgeInsets.all(8.0),
    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
    child: DropdownButton<String>(
      isExpanded: true,
      value:dropdownValue?? list.first,
      dropdownColor: Colors.white,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 35.0,
      elevation: 16,
      style: const TextStyle(color: mainColor),
      underline: Container(
        color: Colors.transparent,
      ),
      onChanged: (String? value) {
        Provider.of<StringVal>(context, listen: false)
            .updateDropdownVal(value!);
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
