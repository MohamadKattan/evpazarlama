import 'package:flutter/foundation.dart';

class StringVal with ChangeNotifier, DiagnosticableTreeMixin {
  String? _dropdownValue;
  String? _subCategoryValue;
  String? get dropdownValue => _dropdownValue;
  String? get subCategoryValue => _subCategoryValue;

  // this method for got  dropdownValue
  void updateDropdownVal(String state) {
    _dropdownValue = state;
    notifyListeners();
  }

  // this method for got sub catogry of item as apartment or eles base on index
  void updateSubCatogryVal(String state) {
    _subCategoryValue = state;
    notifyListeners();
  }
}
