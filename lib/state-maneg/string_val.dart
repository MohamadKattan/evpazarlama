import 'package:flutter/foundation.dart';

class StringVal with ChangeNotifier, DiagnosticableTreeMixin {
  String? _dropdownValue;
  String? _subCategoryValue;
  String? _advertTitle;
  String? _explanation;
  String? _price;
  String? _currancyType;
  String? _front;
  String? _grossMeter;
  String? _netMeter;
  String? _heating;
  String? _numOfRooms;
  String? _buildingAge;
  String? _floorLocation;
  String? _numOfFloors;
  String? _numOfPathRoom;
  String? _balcony;
  String? _furnished;
  String? _usingStatus;
  String? _dues;
  String? _deed;
  String? _watching;
  String? _bartered;
  String? _dailySale;
  String? _dailyCurrancyT;
  String? _islandNo;
  String? _parcelNo;
  String? _sheetNo;
  String? _model;
  String? _yearMade;
  String? _yearRigester;
  String? _kilometers;
  String? _color;
  String? _motorClass;
  String? _withinWarranty;
  String? _view;
  String? _services;
  String? _additionalFeatures;
  String? _country;
  String? _city;
  String? _area;
  String? _mainStreat;
  String? _streat;
  String? _streatNo;
  String? _isNewMessage;

  String? get dropdownValue => _dropdownValue;
  String? get subCategoryValue => _subCategoryValue;
  String? get advertTitle => _advertTitle;
  String? get explanation => _explanation;
  String? get price => _price;
  String? get currancyType => _currancyType;
  String? get front => _front;
  String? get grossMeter => _grossMeter;
  String? get netMeter => _netMeter;
  String? get heating => _heating;
  String? get numOfRomms => _numOfRooms;
  String? get buildingAge => _buildingAge;
  String? get floorLocation => _floorLocation;
  String? get numOfFloors => _numOfFloors;
  String? get numOfPathRoom => _numOfPathRoom;
  String? get balcony => _balcony;
  String? get furnished => _furnished;
  String? get usingStatus => _usingStatus;
  String? get dues => _dues;
  String? get deed => _deed;
  String? get watching => _watching;
  String? get bartered => _bartered;
  String? get dailySale => _dailySale;
  String? get dailyCurrancyT => _dailyCurrancyT;
  String? get islandNo => _islandNo;
  String? get parcelNo => _parcelNo;
  String? get sheetNo => _sheetNo;
  String? get model => _model;
  String? get yearMade => _yearMade;
  String? get yearRigester => _yearRigester;
  String? get kilometers => _kilometers;
  String? get color => _color;
  String? get motorClass => _motorClass;
  String? get withinWarranty => _withinWarranty;
  String? get view => _view;
  String? get services => _services;
  String? get additionalFeatures => _additionalFeatures;
  String? get country => _country;
  String? get city => _city;
  String? get area => _area;
  String? get mainStraet => _mainStreat;
  String? get straet => _streat;
  String? get straetNo => _streatNo;
  String? get isNewMessage => _isNewMessage;

//======================0========================
  // this method for got  dropdownValue
  void updateDropdownVal(String state) {
    _dropdownValue = state;
    notifyListeners();
  }

//=====================1=========================
  // this method for got sub catogry of item as apartment or eles base on index
  void updateSubCatogryVal(String state) {
    _subCategoryValue = state;
    notifyListeners();
  }

  // this method for update AdvertTitle
  void updateAdvertTitle(String state) {
    _advertTitle = state;
    notifyListeners();
  }

  // this method for update Explanation
  void updateExplanation(String state) {
    _explanation = state;
    notifyListeners();
  }

  // this method for update Price
  void updatePrice(String state) {
    _price = state;
    notifyListeners();
  }

  // this method for updata curancy in drop Button
  void updateCurancyState(String state) {
    _currancyType = state;
    notifyListeners();
  }

  // this method for update Front
  void updateFront(String state) {
    _front = state;
    notifyListeners();
  }

  // this method for update groos Meter
  void updateGroosMeter(String state) {
    _grossMeter = state;
    notifyListeners();
  }

  // this method for update Net Meter
  void updateNetMeter(String state) {
    _netMeter = state;
    notifyListeners();
  }

  // this method for update Heating
  void updateHeating(String state) {
    _heating = state;
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

  // this method for update dues
  void updateDues(String state) {
    _dues = state;
    notifyListeners();
  }

  // this method for update deed
  void updateDeed(String state) {
    _deed = state;
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

  // this method for  updat eDaily Sale
  void updateDailySale(String state) {
    _dailySale = state;
    notifyListeners();
  }

  // this method for  update Daily CurrancyT
  void updateDailyCurrancyT(String state) {
    _dailyCurrancyT = state;
    notifyListeners();
  }

  // this method for  update IslandNo
  void updateIslandNo(String state) {
    _islandNo = state;
    notifyListeners();
  }

  // this method for update Parcel
  void updateParcelNo(String state) {
    _parcelNo = state;
    notifyListeners();
  }

  // this method for update sheetNo
  void updateSheetNo(String state) {
    _sheetNo = state;
    notifyListeners();
  }

  // this method for updateModel
  void updateModel(String state) {
    _model = state;
    notifyListeners();
  }

  // this method for updateYearMade
  void updateYearMade(String state) {
    _yearMade = state;
    notifyListeners();
  }

  // this method for updateYearRigester
  void updateYearRigester(String state) {
    _yearRigester = state;
    notifyListeners();
  }

  // this method for updateKilometers
  void updateKilometers(String state) {
    _kilometers = state;
    notifyListeners();
  }

  // this method for updateColor
  void updateColor(String state) {
    _color = state;
    notifyListeners();
  }

  // this method for updateMotorType
  void updateMotorType(String state) {
    _motorClass = state;
    notifyListeners();
  }

  // this method for updateWithinWarranty
  void updateWithinWarranty(String state) {
    _withinWarranty = state;
    notifyListeners();
  }

  // this method for updateView
  void updateView(String state) {
    _view = state;
    notifyListeners();
  }

  // this method for updateServices
  void updateServices(String state) {
    _services = state;
    notifyListeners();
  }

  // this method for updateAdditionalFeatures
  void updateAdditionalFeatures(String state) {
    _additionalFeatures = state;
    notifyListeners();
  }

  //=========================2=====================
  //this method for update adrres location api or manule
  void updatAdresse(String counSt, String citySt, String areaSt,
      String mainStratSt, String streatST, String straetNoSt) {
    _country = counSt;
    _city = citySt;
    _area = areaSt;
    _mainStreat = mainStratSt;
    _streat = streatST;
    _streatNo = straetNoSt;
    notifyListeners();
  }
  // this method for notify user about new Messags in main btn message in drawer
  void updateNewMessage(String state) {
    _isNewMessage = state;
    notifyListeners();
  }
}
