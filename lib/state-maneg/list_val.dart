import 'package:evpazarlama/models/ads_model.dart';
import 'package:flutter/foundation.dart';

class ListVal with ChangeNotifier, DiagnosticableTreeMixin {
  final List<AdsModel> _listFavior = [];
  final List<AdsModel> _myAdsOk = [];
  final List<AdsModel> _myAdsPanding = [];

  List<AdsModel> get listFavior => _listFavior;
  List<AdsModel> get myAdsOk => _myAdsOk;
  List<AdsModel> get myAdsPanding => _myAdsPanding;

  void updateFaviorList(AdsModel adsModel) {
    _listFavior.add(adsModel);
    notifyListeners();
  }

  void deleteAnIndexFaviorList(int index) {
    _listFavior.removeAt(index);
    notifyListeners();
  }

  void updateMyAdsOk(AdsModel adsModel) {
    _myAdsOk.add(adsModel);
    notifyListeners();
  }

  void updateMyAdsPanding(AdsModel adsModel) {
    _myAdsPanding.add(adsModel);
    notifyListeners();
  }

  void deleteAnIndexPanding(int index) {
    _myAdsPanding.removeAt(index);
    notifyListeners();
  }
}
