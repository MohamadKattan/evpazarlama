import 'package:flutter/foundation.dart';

class BoolingVal with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isLodingAuth = false;
  bool _adInfo = true;
  bool _explantion = false;
  bool _location = false;
  bool _searchButton = false;
  bool _buttonChat = false;

  bool get isLodingAuth => _isLodingAuth;
  bool get adInfo => _adInfo;
  bool get explantion => _explantion;
  bool get location => _location;
  bool get searchButton => _searchButton;
  bool get buttonChat => _buttonChat;

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

  void updateSearchBtn(bool state) {
    _searchButton = state;
    notifyListeners();
  }

  void updateChatBtn(bool state) {
    _buttonChat = state;
    notifyListeners();
  }
}
