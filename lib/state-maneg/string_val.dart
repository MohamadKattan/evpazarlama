import 'package:flutter/foundation.dart';

class StringVal with ChangeNotifier, DiagnosticableTreeMixin {
  String? _dropdownValue;
  String? get dropdownValue => _dropdownValue;

  // this method for got  dropdownValue
  void updateDropdownVal(String state) {
    _dropdownValue = state;
    notifyListeners();
  }
}
