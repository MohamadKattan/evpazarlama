import 'package:flutter/foundation.dart';

class BoolingVal with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isLodingAuth = false;
  bool _adInfo = true;
  bool _explantion = false;
  bool _location = false;

  bool get isLodingAuth => _isLodingAuth;
  bool get adInfo => _adInfo;
  bool get explantion => _explantion;
  bool get location => _location;

  // this method for loading circelIndector while loading
  void loadingAuth(bool state) {
    _isLodingAuth = state;
    notifyListeners();
  }

  void updateAdInfoBtn(bool state) {
    _adInfo = state;
    _explantion = false;
    _location = false;
    notifyListeners();
  }

  void updateExplantionoBtn(bool state) {
    _explantion = state;
    _adInfo = false;
    _location = false;
    notifyListeners();
  }

  void updateLocationBtn(bool state) {
    _location = state;
    _explantion = false;
    _adInfo = false;
    notifyListeners();
  }
}
