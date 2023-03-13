// this model for store data while fitch to/from data

class AdsHoseingModel {
  String? mainCategory;
  String? operationType;
  String? subCategory;
  String? advertTile;
  String? exolanation;
  String? price;
  String? meterGross;
  String? meterNet;
  String? numberOfRooms;
  String? buildingAge;
  String? floorLocation;
  String? numOfFloors;
  String? heating;
  String? numberofPath;
  String? balcony;
  String? furnished;
  String? usingStatus;
  String? dues;
  String? deed;
  String? watching;
  String? bartered;
  AdsHoseingModel(
      {this.advertTile,
      this.balcony,
      this.bartered,
      this.buildingAge,
      this.deed,
      this.dues,
      this.exolanation,
      this.floorLocation,
      this.furnished,
      this.heating,
      this.mainCategory,
      this.meterGross,
      this.meterNet,
      this.numOfFloors,
      this.numberOfRooms,
      this.numberofPath,
      this.operationType,
      this.price,
      this.subCategory,
      this.usingStatus,
      this.watching});

  AdsHoseingModel.fromJson(Map<String, Object?> map) : this();

  Map<String, dynamic> toJson() => {};
}
