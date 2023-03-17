import 'dart:async';

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_container.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../client-srv/https_srv.dart';
import '../helper/custom_positioned.dart';
import '../state-maneg/booling_val.dart';

class StartMapLocation extends StatefulWidget {
  const StartMapLocation({super.key});

  @override
  State<StartMapLocation> createState() => _StartMapLocationState();
}

class _StartMapLocationState extends State<StartMapLocation> {
  final marker = <Marker>{};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _myLocation = CameraPosition(
      bearing: 0.0,
      target: LatLng(latitudeVal ?? 0.0, longitudeVal ?? 0.0),
      tilt: 0.0,
      zoom: 19.151926040649414);
  @override
  void initState() {
    _updatMayLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(text: AppLocalizations.of(context)!.pickLocation),
        ),
        drawer: customDrawer(context),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  myLocationEnabled: true,
                  markers: marker,
                  padding: const EdgeInsets.only(bottom: 50.0, top: 50.0),
                  mapType: MapType.normal,
                  initialCameraPosition: _initialLocation,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  onTap: (val) {
                    latitudeVal = val.latitude;
                    longitudeVal = val.longitude;
                    _addMarker();
                  },
                ),
              ),
              customContainer(
                height: 50.0,
                spaceAroundBottom: 12.0,
                spaceAroundTop: 12.0,
                colorBack: Colors.black.withOpacity(0.4),
                child: customText(
                    text: AppLocalizations.of(context)!.pickOnMap,
                    textColor: Colors.white,
                    textFontSize: 18,
                    textWeight: FontWeight.normal),
              ),
              customPositioned(
                right: 0.0,
                left: 0.0,
                bottom: 0.0,
                child: customContainer(
                  height: 60,
                  colorBack: Colors.black.withOpacity(0.4),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        children: [
                          customContainer(
                              colorBack: Colors.blueGrey.shade100,
                              ridusBL: 12.0,
                              ridusBR: 12.0,
                              ridusR: 12.0,
                              ridusl: 12.0,
                              width:
                                  MediaQuery.of(context).size.width * 40 / 100,
                              height: 20.0),
                          customContainer(
                            colorBack: mainColor,
                            width: MediaQuery.of(context).size.width * 24 / 100,
                            height: 20,
                            ridusBL: 12.0,
                            ridusBR: 12.0,
                            ridusR: 12.0,
                            ridusl: 12.0,
                          ),
                          customPositioned(
                              left: 0.0,
                              right: 0.0,
                              child: customText(text: '(2/5)'))
                        ],
                      ),
                      GestureDetector(
                        onTap: () => _getAdreesInfo(),
                        child: customContainer(
                          colorBack: mainColor,
                          width: MediaQuery.of(context).size.width * 45 / 100,
                          ridusBL: 12.0,
                          ridusBR: 12.0,
                          ridusR: 12.0,
                          ridusl: 12.0,
                          child: customText(
                              text: AppLocalizations.of(context)!.next,
                              textColor: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<BoolingVal>(
                builder: (BuildContext context, value, Widget? child) {
                  return value.isLodingAuth
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black.withOpacity(0.3),
                          child: const Center(
                              child: CircularProgressIndicator(
                            color: mainColor,
                          )),
                        )
                      : const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // this method for show my current location on map
  Future<void> _updatMayLocation() async {
    await GlobalMethods().getLocations(context);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_myLocation));
  }

  // this method for add marker onTap map
  void _addMarker() {
    var newMarker = Marker(
        markerId: const MarkerId('location'),
        position: LatLng(latitudeVal ?? 0.0, longitudeVal ?? 0.0),
        icon: BitmapDescriptor.defaultMarkerWithHue(.5));
    setState(() {
      marker.clear();
      marker.add(newMarker);
    });
  }

  // this method for call gecodin api after move location on map
  Future<void> _getAdreesInfo() async {
    context.read<BoolingVal>().loadingAuth(true);
    String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitudeVal,$longitudeVal&key=$mapKey';
    var res =
        await ClintHttpSrv().getDataFromApi(context: context, urlApi: url);
    if (res != 'failed') {
      Map<String, dynamic> map = Map<String, dynamic>.from(res as Map);
      if (map['status'] == 'OK') {
        final listRes = map['results'][0]['address_components'];
        streatNumberToDtBase = listRes[0]['long_name'];
        streatToDtbase = listRes[1]['long_name'];
        for (var i = 0; i < listRes.length; i++) {
          if (listRes[i]['types'][0] == 'administrative_area_level_2') {
            areaToDtbase = listRes[i]['long_name'];
          } else if (listRes[i]['types'][0] == 'administrative_area_level_1') {
            cityToDtbase = listRes[i]['long_name'];
          } else if (listRes[i]['types'][0] == 'country') {
            countryToDtbase = listRes[i]['long_name'];
          }
        }
        latitudeToDtbase = latitudeVal;
        longitudeToDtbase = longitudeVal;

        if (context.mounted) {
          context.read<BoolingVal>().loadingAuth(false);
          GlobalMethods()
              .pushToNewScreen(context: context, routeName: toAddPhoto);
        }
      }
    } else {
      if (context.mounted) {
        context.read<BoolingVal>().loadingAuth(false);
      }
    }
  }
}
