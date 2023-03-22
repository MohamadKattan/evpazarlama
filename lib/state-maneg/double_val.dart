import 'package:flutter/foundation.dart';

class DoubleVal with ChangeNotifier, DiagnosticableTreeMixin {
  double? _latitude;
  double? _longitude;
  double? get latitude => _latitude;
  double? get longitude => _longitude;

  void updateLatLon(double lat, double lon) {
    _latitude = lat;
    _longitude = lon;
    notifyListeners();
  }
}
