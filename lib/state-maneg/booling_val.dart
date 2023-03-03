import 'package:flutter/foundation.dart';

class BoolingVal with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isLodingAuth = false;
  bool get isLodingAuth => _isLodingAuth;

  // this method for loading when user start singUp
  void loadingAuth(bool state) {
    _isLodingAuth = state;
    notifyListeners();
  }
}
