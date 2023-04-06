import 'dart:async';
import 'dart:math';

import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:evpazarlama/pages/one_ad_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../global-methods/methods.dart';

class MapResultads extends StatefulWidget {
  final List<AdsModel> list;
  const MapResultads({super.key, required this.list});

  @override
  State<MapResultads> createState() => _MapResultadsState();
}

class _MapResultadsState extends State<MapResultads> {
  final marker = <Marker>{};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static final CameraPosition _initialLocation = CameraPosition(
    target: LatLng(
        latitudeVal ?? 37.42796133580664, longitudeVal ?? -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _myLocation = CameraPosition(
      bearing: 0.0,
      target: LatLng(latitudeVal ?? 0.0, longitudeVal ?? 0.0),
      tilt: 0.0,
      zoom: 19.151926040649414);

  @override
  void initState() {
    marker.clear();
    _updatMayLocation();
    // _addMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(text: AppLocalizations.of(context)!.location),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            myLocationEnabled: true,
            markers: marker,
            mapType: MapType.normal,
            initialCameraPosition: _initialLocation,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
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
    _addMarker();
  }

  // this method for loop on lat/lon and add marker on map
  void _addMarker() {
    if (widget.list.isNotEmpty) {
      for (var i in widget.list) {
        // double lat = widget.list[i].latitude ?? 0.0;
        // double lon = widget.list[i].longitude ?? 0.0;
        String title = i.details?[2] + i.details?[3];
        String subTitle = '${i.city} - ${i.area}\n${i.streat}';
        int id = Random().nextInt(100000);
        final myMarker = Marker(
          markerId: MarkerId('homes$id'),
          position: LatLng(i.latitude ?? 0.0, i.longitude ?? 0.0),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: title,
            snippet: subTitle,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return OneAdsDetails(
                  adsModel: i,
                );
              }));
            },
          ),
        );
        setState(() {
          marker.add(myMarker);
        });
      }
    } else {
      return;
    }
  }
}
