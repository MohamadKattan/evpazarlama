import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

import '../helper/config.dart';
import '../state-maneg/image_val.dart';

class GlobalMethods {
  //=======================================================================
  //========================image picker method============================
  //=======================================================================

  // this metho for pick an imgae or list of image
  Future<void> pickImagesMethod(ImageSource source, BuildContext? context,
      {bool isMultiImage = false}) async {
    final ImagePicker picker = ImagePicker();
    if (isMultiImage) {
      try {
        final List<XFile> pickedFileList = await picker.pickMultiImage(
          maxWidth: 350.0,
          maxHeight: 350.0,
          imageQuality: 100,
        );
        Provider.of<ImageVal>(context!, listen: false)
            .updatImagePickerState(pickedFileList);
      } catch (e) {
        CustomDailog().customSnackBar(
            context: context!, text: e.toString(), color: Colors.red);
      }
    } else {
      try {
        final XFile? pickedFile = await picker.pickImage(
          source: source,
          maxWidth: 200.0,
          maxHeight: 200.0,
          imageQuality: 100,
        );
        List<XFile>? oneImage;
        oneImage = pickedFile == null ? null : <XFile>[pickedFile];
        Provider.of<ImageVal>(context!, listen: false)
            .updatImagePickerState(oneImage);
      } catch (e) {
        CustomDailog().customSnackBar(
            context: context!, text: e.toString(), color: Colors.red);
      }
    }
  }

  //========================================================================
  //===========================Navgator Methods=============================
  //========================================================================

  // this method for Navigtor with out replace page
  void pushToNewScreen(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  // this method for pop from screen
  void popFromScreen(BuildContext context) {
    Navigator.pop(context);
  }

  // this method for Navigtor with replace screen
  void pushReplaceToNewScreen(
      {required BuildContext context, required String routeName}) {
    Navigator.pushReplacementNamed(context, routeName);
  }

// nav to loginScren or profileScreen conect to user id
  navToLoginOrProfile(BuildContext context) {
    String userName = userInfoProfile?.userName ?? 'null';
    if (userId != 'null') {
      if (userName != 'null') {
        pushToNewScreen(context: context, routeName: toProfileScreen);
      } else {
        pushToNewScreen(context: context, routeName: toProfileInfo);
      }
    } else {
      pushToNewScreen(context: context, routeName: toLoginScreen);
    }
  }

  // nav to add new ads if user already singIn
  void navToAddNewAdsIfSingIn(BuildContext context) {
    if (userId == 'null') {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return CustomDailog().globalDailog(
                context: context,
                title: AppLocalizations.of(context)!.beforAddNewAds,
                textBtn1: AppLocalizations.of(context)!.singup,
                function: () {
                  pushToNewScreen(context: context, routeName: toLoginScreen);
                });
          });
    } else if (userInfoProfile?.userName == null) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return CustomDailog().globalDailog(
                context: context,
                title: AppLocalizations.of(context)!.beforAddNewAds,
                textBtn1: AppLocalizations.of(context)!.singup,
                function: () {
                  pushToNewScreen(context: context, routeName: toProfileInfo);
                });
          });
    } else {
      pushToNewScreen(context: context, routeName: toAddNewAds);
    }
  }

  //=======================================================================
  //==============Methods for display any list of category=================
  //=======================================================================

  // this metod for retrin list of main catogry (Estate,Vehicle,Hotel)
  List typeOfListMainCatogry(BuildContext context) {
    final list = [];

    final listofEstateCategory = [
      AppLocalizations.of(context)!.allReal,
      AppLocalizations.of(context)!.allHome,
      AppLocalizations.of(context)!.workPlace,
      AppLocalizations.of(context)!.land,
      AppLocalizations.of(context)!.building,
      // AppLocalizations.of(context)!.hotel,
    ];

    final listOfVehicleCategory = [
      AppLocalizations.of(context)!.allVehicle,
      AppLocalizations.of(context)!.motorCycle,
      AppLocalizations.of(context)!.cars,
      AppLocalizations.of(context)!.minBus,
      AppLocalizations.of(context)!.electricCars,
      AppLocalizations.of(context)!.commercialCar,
      AppLocalizations.of(context)!.damagedVehicles,
    ];

    final listOfHotelCategory = [
      AppLocalizations.of(context)!.allHotels,
      AppLocalizations.of(context)!.hotel,
      AppLocalizations.of(context)!.resorts,
      AppLocalizations.of(context)!.touristCottages,
      AppLocalizations.of(context)!.hotelAppartments,
      AppLocalizations.of(context)!.touristVillas,
    ];

    switch (mainCatogry) {
      case 0:
        list.addAll(listofEstateCategory);
        break;
      case 1:
        list.addAll(listOfVehicleCategory);
        break;
      case 2:
        list.addAll(listOfHotelCategory);
        break;
      case 3:
        null;
        break;
      case 4:
        null;
        break;
      default:
        null;
        break;
    }

    return list;
  }

  // this metod for retrin list of main catogry (Estate,Vehicle,Hotel) while add new ads
  List listCatogryAddNewAds(BuildContext context) {
    final list = [];

    final listofEstateCategory = [
      AppLocalizations.of(context)!.allHome,
      AppLocalizations.of(context)!.workPlace,
      AppLocalizations.of(context)!.land,
      AppLocalizations.of(context)!.building,
      // AppLocalizations.of(context)!.hotel,
    ];

    final listOfVehicleCategory = [
      AppLocalizations.of(context)!.motorCycle,
      AppLocalizations.of(context)!.cars,
      AppLocalizations.of(context)!.minBus,
      AppLocalizations.of(context)!.electricCars,
      AppLocalizations.of(context)!.commercialCar,
      AppLocalizations.of(context)!.damagedVehicles,
    ];

    final listOfHotelCategory = [
      AppLocalizations.of(context)!.hotel,
      AppLocalizations.of(context)!.resorts,
      AppLocalizations.of(context)!.touristCottages,
      AppLocalizations.of(context)!.hotelAppartments,
      AppLocalizations.of(context)!.touristVillas,
    ];

    switch (mainCatogry) {
      case 0:
        list.addAll(listofEstateCategory);
        break;
      case 1:
        list.addAll(listOfVehicleCategory);
        break;
      case 2:
        list.addAll(listOfHotelCategory);
        break;
      default:
        null;
        break;
    }

    return list;
  }

  /*
   this method to know user any type he is searching sale / rent / daily rent or else
  after that will nav to ListOfIteam screen will display items if realEstatae
  or vichel or hotel ... 
  */
  void switchToAnyTypeListItem(BuildContext context, int index) {
    // val = 0 sale , 1 rent , 2 dailyrent,3 tranfer sale
    switch (index) {
      case 0:
        saleRentElseVal = 0;
        popFromScreen(context);
        pushToNewScreen(context: context, routeName: toListOfIteam);
        break;
      case 1:
        saleRentElseVal = 1;
        popFromScreen(context);
        pushToNewScreen(context: context, routeName: toListOfIteam);
        break;
      case 2:
        saleRentElseVal = 2;
        popFromScreen(context);
        pushToNewScreen(context: context, routeName: toListOfIteam);
        break;
      case 3:
        saleRentElseVal = 3;
        popFromScreen(context);
        pushToNewScreen(context: context, routeName: toListOfIteam);
        break;
      default:
        saleRentElseVal = 0;
        popFromScreen(context);
        pushToNewScreen(context: context, routeName: toListOfIteam);
        break;
    }
  }

  /* 
  this method to know user any type he is searching sale / rent / daily rent or else
  after that will nav to ListOfIteam screen will display items if realEstatae
  or vichel or hotel ... while user going to push new ads
  */
  void switchToAnyTypeListItemAdsNewadd(BuildContext context, int index) {
    // val = 0 sale , 1 rent , 2 dailyrent,3 tranfer sale
    switch (index) {
      case 0:
        saleRentElseVal = 0;
        popFromScreen(context);
        if (listOfItemVal == 20) {
          // lands
          GlobalMethods()
              .pushToNewScreen(context: context, routeName: toAdsDetailsLand);
        } else if (listOfItemVal == 21) {
          // Bulding
          GlobalMethods().pushToNewScreen(
              context: context, routeName: toAdsDetailsBulding);
        } else if (listOfItemVal > 7 && listOfItemVal < 13) {
          // hotoles
          GlobalMethods()
              .pushToNewScreen(context: context, routeName: toAdsDetailsHotels);
        } else {
          pushToNewScreen(context: context, routeName: toAdsListOfItems);
        }
        break;
      case 1:
        saleRentElseVal = 1;
        popFromScreen(context);
        if (listOfItemVal == 20) {
          // lands
          GlobalMethods()
              .pushToNewScreen(context: context, routeName: toAdsDetailsLand);
        } else if (listOfItemVal == 21) {
          // Bulding
          GlobalMethods().pushToNewScreen(
              context: context, routeName: toAdsDetailsBulding);
        } else if (listOfItemVal > 6 && listOfItemVal < 12) {
          // hotoles
          GlobalMethods()
              .pushToNewScreen(context: context, routeName: toAdsDetailsHotels);
        } else {
          pushToNewScreen(context: context, routeName: toAdsListOfItems);
        }
        break;
      case 2:
        saleRentElseVal = 2;
        popFromScreen(context);
        pushToNewScreen(context: context, routeName: toAdsListOfItems);
        break;
      case 3:
        saleRentElseVal = 3;
        popFromScreen(context);
        pushToNewScreen(context: context, routeName: toAdsListOfItems);
        break;
      default:
        saleRentElseVal = 0;
        popFromScreen(context);
        pushToNewScreen(context: context, routeName: toAdsListOfItems);
        break;
    }
  }

  // this method for check val what user slect (housing,workPlace,car..) (sale,rent ...)
  List typeOfListItem(BuildContext context) {
    final list = [];

    final lsitOfHousingItem = [
      AppLocalizations.of(context)!.apart1,
      AppLocalizations.of(context)!.residence,
      AppLocalizations.of(context)!.detachedHouse,
      AppLocalizations.of(context)!.villa,
      AppLocalizations.of(context)!.farmHouse,
      AppLocalizations.of(context)!.mansion,
      AppLocalizations.of(context)!.summerhouse,
      AppLocalizations.of(context)!.prefabricatedHouse,
      AppLocalizations.of(context)!.cooperative,
    ];
    final listOfWorkPlacItem = [
      AppLocalizations.of(context)!.gasStation,
      AppLocalizations.of(context)!.apart1,
      AppLocalizations.of(context)!.villa,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.mall,
      AppLocalizations.of(context)!.buffet,
      AppLocalizations.of(context)!.office,
      AppLocalizations.of(context)!.cafe,
      AppLocalizations.of(context)!.warehouse,
      AppLocalizations.of(context)!.weddingHall,
      AppLocalizations.of(context)!.store,
      AppLocalizations.of(context)!.factory,
      AppLocalizations.of(context)!.fullbuilding,
      AppLocalizations.of(context)!.parking,
    ];
    final listOfCars = [
      'Aion',
      'AlfaRomeo',
      // 'Anadol',
      // 'Arora',
      'AstonMartin',
      'Audi',
      'Bentley',
      'BMW',
      'Bugatti',
      'Buick',
      'Cadilac',
      'Chery',
      'Chevrolet',
      'Chrysler',
      'Citroen',
      'Dacia',
      'Daewoo',
      'Daihatsu',
      'Dodge',
      'Ferrari',
      'Fiat',
      'Fisker',
      'Ford',
      'GMC',
      // 'Geely',
      'Honda',
      'Hyundai',
      // 'Ikco',
      'Infiniti',
      'Jaguar',
      'Jeep',
      'Kia',
      // 'Kral',
      // 'Lada',
      'Lamborghini',
      'Land-Rover',
      'Leapmotor',
      'Lexus',
      'Lincoin',
      'Lotus',
      'Maserati',
      'Mazda',
      'Mclaren',
      'Mercedes-Benz',
      'Mercury',
      'Mini-cooper',
      'Mitsubishi',
      'Nissan',
      'Opel',
      'Peugeot',
      'Porsche',
      'Proton',
      'Renault',
      'Rolls-Royce',
      'Seat',
      'Skoda',
      'Smart',
      'Subaru',
      'Suzuki',
      'Tesla',
      'Toyota',
      'Volkswagen',
      'Volvo',
    ];
    final listOfMotor = [
      'Abush',
      'Altai',
      'Apachi',
      'Aprillia',
      'Arora',
      'Asya',
      'Bajaj',
      'Baotain',
      'Belderia',
      'Beta',
      'Bianchi',
      'Bimota',
      'Bisan',
      'BMW',
      'BRP',
      'Borelli',
      'Brixton',
      'BuMoto',
      'CFMoto',
      'Cheeta',
      'Darlim',
      'Dorado',
      'Ducati',
      'Falcon',
      'Gas Gas',
      'Haojue',
      'Harley',
      'Hero',
      'Honda',
      'Kanuni',
      'Kawasaki',
      'KTM',
      'kIA',
      'Kuba',
      'Kymco',
      'Mondial',
      'Motolux',
      'Yamaha',
    ];

    // const listNull = ['null'];

    switch (listOfItemVal) {
      case 0:
        list.addAll(lsitOfHousingItem);
        break;
      case 1:
        list.addAll(listOfWorkPlacItem);
        break;
      case 2:
        list.addAll(listOfMotor);

        break;
      case 3:
        list.addAll(listOfCars);
        break;
      case 4:
        list.addAll(listOfCars);
        break;
      case 5:
        list.addAll(listOfCars);
        break;
      case 6:
        list.addAll(listOfCars);
        break;
      case 7:
        list.addAll(listOfCars);
        break;
      default:
        // list.addAll(listNull);
        break;
    }
    return list;
  }
  //=====================================================================
  //=========================Location methods============================
  //=====================================================================

  // this method for location requestPermission

  Future<void> requestPermission(BuildContext context) async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(' permissions denied').whenComplete(() {
          CustomDailog().customSnackBar(
            context: context,
            text: AppLocalizations.of(context)!.locationDenied,
          );
        });
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('we cannot request permissions.').whenComplete(() {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return CustomDailog().globalDailog(
                  context: context,
                  title: AppLocalizations.of(context)!.locationDenied,
                  textBtn1: AppLocalizations.of(context)!.openLocSitting,
                  function: () async {
                    await Geolocator.openLocationSettings();
                  });
            });
      });
    }
  }

  Future<void> locatioServiceEnabled(BuildContext context) async {
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.').whenComplete(() {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return CustomDailog().globalDailog(
                  context: context,
                  title: AppLocalizations.of(context)!.locationdisabled,
                  textBtn1: AppLocalizations.of(context)!.openLocSitting,
                  function: () async {
                    await Geolocator.openLocationSettings().whenComplete(() {
                      GlobalMethods().popFromScreen(context);
                    });
                  });
            });
      });
    } else {
      return;
    }
  }

  // this method for got current location
  Future<void> getLocations(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.').whenComplete(() {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return CustomDailog().globalDailog(
                  context: context,
                  title: AppLocalizations.of(context)!.locationdisabled,
                  textBtn1: AppLocalizations.of(context)!.openLocSitting,
                  function: () async {
                    await Geolocator.openLocationSettings();
                  });
            });
      });
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(' permissions denied.').whenComplete(() {
          CustomDailog().customSnackBar(
            context: context,
            text: AppLocalizations.of(context)!.locationDenied,
          );
        });
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('we cannot request permissions.').whenComplete(() {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return CustomDailog().globalDailog(
                  context: context,
                  title: AppLocalizations.of(context)!.locationDenied,
                  textBtn1: AppLocalizations.of(context)!.openLocSitting,
                  function: () async {
                    await Geolocator.openLocationSettings();
                  });
            });
      });
    }
    currentPosition = await Geolocator.getCurrentPosition();
    latitudeVal = currentPosition?.latitude ?? 0.0;
    longitudeVal = currentPosition?.longitude ?? 0.0;
  }
}
