import 'package:flutter/foundation.dart';

class StringVal with ChangeNotifier, DiagnosticableTreeMixin {
  String? _dropdownValue;
  String? _subCategoryValue;
  String? _currancyType;
  String? _numOfRooms;
  String? _buildingAge;
  String? _floorLocation;
  String? _numOfFloors;
  String? _numOfPathRoom;
  String? _balcony;
  String? _furnished;
  String? _usingStatus;
  String? _watching;
  String? _bartered;
  String? get dropdownValue => _dropdownValue;
  String? get subCategoryValue => _subCategoryValue;
  String? get currancyType => _currancyType;
  String? get numOfRomms => _numOfRooms;
  String? get buildingAge => _buildingAge;
  String? get floorLocation => _floorLocation;
  String? get numOfFloors => _numOfFloors;
  String? get numOfPathRoom => _numOfPathRoom;
  String? get balcony => _balcony;
  String? get furnished => _furnished;
  String? get usingStatus => _usingStatus;
  String? get watching => _watching;
  String? get bartered => _bartered;

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

  // this method for updata curancy in drop Button
  void updateCurancyState(String state) {
    _currancyType = state;
    notifyListeners();
  }

  // this method for update number of rooms dropButton
  void updateNumOfRoomsState(String state) {
    _numOfRooms = state;
    notifyListeners();
  }

  // this method for update building age in dropButton
  void updateBuildingAgeState(String state) {
    _buildingAge = state;
    notifyListeners();
  }

  // this method for update floor location in dropButton
  void updateFloorLocation(String state) {
    _floorLocation = state;
    notifyListeners();
  }

  // this method for update number of floors in dropButton
  void updateNumOfFloors(String state) {
    _numOfFloors = state;
    notifyListeners();
  }

  // this method for update number of path room in dropButton
  void updateNumOfPathRoom(String state) {
    _numOfPathRoom = state;
    notifyListeners();
  }

  // this method for update balcony dropButton
  void updateBalcony(String state) {
    _balcony = state;
    notifyListeners();
  }

  // this method for update furnshed dropButton
  void updateFurnshed(String state) {
    _furnished = state;
    notifyListeners();
  }

  // this method for update furnshed dropButton
  void updateUsingStatus(String state) {
    _usingStatus = state;
    notifyListeners();
  }

  // this method for update furnshed dropButton
  void updateWatching(String state) {
    _watching = state;
    notifyListeners();
  }

  // this method for  update Bartered dropButton
  void updateBartered(String state) {
    _bartered = state;
    notifyListeners();
  }
}
