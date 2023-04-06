import 'package:flutter/foundation.dart';

class IntVal with ChangeNotifier, DiagnosticableTreeMixin {
  int? _indexImage;
  int? _indexImageCounter;
  int? _pageViewIndex;
  int? get indexImage => _indexImage;
  int? get indexImageCounter => _indexImageCounter;
  int? get pageViewIndex => _pageViewIndex;

// this method for update index image list
  void updateImageListIndex(int state) {
    _indexImage = state;
    _indexImageCounter = state + 1;
    notifyListeners();
  }

  // update index page view
  void updateIndexPageView(int state) {
    _pageViewIndex = state;
    notifyListeners();
  }
}
