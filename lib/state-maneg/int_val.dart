import 'package:flutter/foundation.dart';

class IntVal with ChangeNotifier, DiagnosticableTreeMixin {
  int? _indexImage;
  int? _indexImageCounter;
  int? get indexImage => _indexImage;
  int? get indexImageCounter => _indexImageCounter;
// this method for update index image list
  void updateImageListIndex(int state) {
    _indexImage = state;
    _indexImageCounter = state + 1;
    notifyListeners();
  }
}
