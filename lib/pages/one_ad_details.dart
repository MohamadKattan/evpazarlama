import 'dart:async';

import 'package:evpazarlama/client-srv/database_srv.dart';
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/custom_buttons.dart';
import 'package:evpazarlama/helper/custom_container.dart';
import 'package:evpazarlama/helper/custom_positioned.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:evpazarlama/pages/chat_owner.dart';
import 'package:evpazarlama/pages/perviwe_image.dart';
import 'package:evpazarlama/state-maneg/booling_val.dart';
import 'package:evpazarlama/state-maneg/int_val.dart';
import 'package:evpazarlama/state-maneg/list_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../helper/config.dart';
import '../helper/custom_dailog.dart';
import '../helper/custom_icon.dart';
import '../helper/custom_text.dart';

class OneAdsDetails extends StatefulWidget {
  // final int index;
  // final List<AdsModel> list;
  final AdsModel adsModel;
  const OneAdsDetails({super.key, required this.adsModel});

  @override
  State<OneAdsDetails> createState() => _OneAdsDetailsState();
}

class _OneAdsDetailsState extends State<OneAdsDetails> {
  final marker = <Marker>{};
  double? height;
  double? width;
  bool isFaverot = false;
  ScrollController? controller;
  PageController? controllerView;

  final Completer<GoogleMapController> mapControler =
      Completer<GoogleMapController>();

  @override
  void initState() {
    controller = ScrollController();
    controllerView =
        PageController(initialPage: context.read<IntVal>().pageViewIndex ?? 0);
    checkIffaveort(context);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    controllerView!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(
            textAlign: TextAlign.center,
            text: AppLocalizations.of(context)!.oneData,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                addOrDeletefavoriAd(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: customIcon(
                    iconData: isFaverot
                        ? Icons.star
                        : Icons.star_border_purple500_sharp,
                    size: 30.0,
                    color: secondColor),
              ),
            ),
            GestureDetector(
              onTap: () {
                sendMessageToOwnerAd(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: customIcon(iconData: Icons.message, size: 25.0),
              ),
            ),
            GestureDetector(
              onTap: () {
                GlobalMethods()
                    .startLaunchUrl(widget.adsModel.owner?[1] ?? '00000000000');
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: customIcon(iconData: Icons.call, size: 25.0),
              ),
            ),
          ],
        ),
        drawer: customDrawer(context),
        body: ListView(
          children: [
            // buttons perView Page
            buttons(height!, width!, context, controllerView!),
            // liner
            customContainer(colorBack: mainColor, height: 5.0, width: width),
            SizedBox(
              height: height,
              child: PageView(
                controller: controllerView,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  firstPage(context, height!, width!, controller!),
                  secondPage(),
                  theredPage(marker, height!, mapControler)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// this method for check it is faveort to me or not
  checkIffaveort(BuildContext context) {
    final list = context.read<ListVal>().listFavior;
    for (var i in list) {
      if (i.adsId == widget.adsModel.adsId) {
        setState(() => isFaverot = true);
        break;
      } else {
        setState(() => isFaverot = false);
      }
    }
  }

// mehthod in action appBar for add favori or delete
  void addOrDeletefavoriAd(BuildContext context) {
    if (!userId.contains('null')) {
      if (!isFaverot) {
        DataBaseSrv().setFavori(widget.adsModel);
        setState(() => isFaverot = true);
        DataBaseSrv().getMyFavori(context);
      } else {
        setState(() => isFaverot = false);
        DataBaseSrv().deleteOneFavero(widget.adsModel.adsId!);
        DataBaseSrv().getMyFavori(context);
      }
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return CustomDailog().globalDailog(
                context: context,
                title: AppLocalizations.of(context)!.notRigister,
                textBtn1: AppLocalizations.of(context)!.singup,
                function: () {
                  GlobalMethods().pushToNewScreen(
                      context: context, routeName: toLoginScreen);
                });
          });
    }
  }

// this method for send message to owner ad
  void sendMessageToOwnerAd(BuildContext context) {
    if (!userId.contains('null')) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return ChatOwner(
              reciverId: widget.adsModel.ownerId ?? '1234546',
              adsNumber: widget.adsModel.adsNumber ?? '00',
              isCanPop: true,
              token: widget.adsModel.token ?? 'null',
            );
          },
        ),
      );
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return CustomDailog().globalDailog(
                context: context,
                title: AppLocalizations.of(context)!.notRigister,
                textBtn1: AppLocalizations.of(context)!.singup,
                function: () {
                  GlobalMethods().pushToNewScreen(
                      context: context, routeName: toLoginScreen);
                });
          });
    }
  }

// page view buttons
  Widget buttons(double height, double width, BuildContext context,
      PageController controllerView) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.read<BoolingVal>().updateAdInfoBtn(true);
            context.read<IntVal>().updateIndexPageView(0);
            controllerView.animateToPage(
                context.read<IntVal>().pageViewIndex ?? 0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
          child: AnimatedContainer(
            width: width / 3,
            height: height * 7 / 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.0),
              color: context.watch<BoolingVal>().adInfo
                  ? secondColor
                  : Colors.white,
            ),
            duration: const Duration(milliseconds: 500),
            child: customText(
                text: AppLocalizations.of(context)!.adInfo,
                textColor: mainColor,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<BoolingVal>().updateExplantionoBtn(true);
            context.read<IntVal>().updateIndexPageView(1);
            controllerView.animateToPage(
                context.read<IntVal>().pageViewIndex ?? 0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
          child: AnimatedContainer(
            width: width / 3,
            height: height * 7 / 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.0),
              color: context.watch<BoolingVal>().explantion
                  ? secondColor
                  : Colors.white,
            ),
            duration: const Duration(milliseconds: 500),
            child: customText(
                text: AppLocalizations.of(context)!.exPlainiNFO,
                textColor: mainColor,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<BoolingVal>().updateLocationBtn(true);
            context.read<IntVal>().updateIndexPageView(2);
            controllerView.animateToPage(
                context.read<IntVal>().pageViewIndex ?? 0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
            _addMarker(marker);
          },
          child: AnimatedContainer(
            width: width / 3,
            height: height * 7 / 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.0),
              color: context.read<BoolingVal>().location
                  ? secondColor
                  : Colors.white,
            ),
            duration: const Duration(milliseconds: 500),
            child: customText(
                text: AppLocalizations.of(context)!.location,
                textColor: mainColor,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }

// firstPage
  Widget firstPage(BuildContext context, double height, double width,
      ScrollController controller) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        imagePerView(height, controller, context, width),
        //owner info
        customContainer(
          spaceAroundTop: 2.0,
          spaceAroundBottom: 2.0,
          alignment: Alignment.center,
          child: Column(
            children: [
              customText(
                  text: AppLocalizations.of(context)!.ownerInfo,
                  textColor: secondColor,
                  textFontSize: 14.0,
                  textWeight: FontWeight.bold),
              customText(
                  text: '${widget.adsModel.owner?[0] ?? 'null'} / '
                      '${widget.adsModel.owner?[2] ?? 'null'}',
                  textColor: mainColor),
            ],
          ),
        ),
        // adress
        customContainer(
            spaceAroundTopMargin: 2,
            colorBack: greyColor,
            height: 2.0,
            width: width),
        customContainer(
          alignment: Alignment.center,
          spaceAroundBottom: 2.0,
          spaceAroundTop: 2.0,
          child: Column(
            children: [
              customText(
                  text: AppLocalizations.of(context)!.adress,
                  textColor: secondColor,
                  textFontSize: 14.0,
                  textWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: customText(
                    text: '${widget.adsModel.country ?? 'null'} - '
                        '${widget.adsModel.city ?? 'null'} - ${widget.adsModel.area ?? 'null'}  ',
                    textColor: mainColor,
                    textFontSize: 14.0,
                    overflow: TextOverflow.ellipsis),
              ),
              customText(
                  text: '${widget.adsModel.mainStreat ?? 'null'} - '
                      '${widget.adsModel.streat ?? 'null'} - ${widget.adsModel.streatNo ?? 'null'} ',
                  textColor: mainColor,
                  textFontSize: 12,
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
        customContainer(
            spaceAroundTopMargin: 2,
            colorBack: greyColor,
            height: 2.0,
            width: width),
        // details
        customContainer(
          alignment: Alignment.center,
          spaceAroundTop: 4.0,
          spaceAroundBottom: 4.0,
          child: customText(
              text: AppLocalizations.of(context)!.details,
              textColor: secondColor,
              textFontSize: 14.0,
              textWeight: FontWeight.bold),
        ),
        customContainer(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 0,
                child: customText(
                    text: '${AppLocalizations.of(context)!.adTime} : ',
                    textColor: Colors.black,
                    overflow: TextOverflow.ellipsis),
              ),
              Expanded(
                flex: 0,
                child: customText(
                    text: formatStartDare(),
                    textColor: mainColor,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
        customContainer(colorBack: greyColor, height: 1.0, width: width),
        customContainer(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 0,
                child: customText(
                    text: '${AppLocalizations.of(context)!.adNumber} : ',
                    textColor: Colors.black,
                    overflow: TextOverflow.ellipsis),
              ),
              Expanded(
                flex: 0,
                child: customText(
                    text: widget.adsModel.adsNumber,
                    textColor: Colors.redAccent,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
        customContainer(colorBack: greyColor, height: 1.0, width: width),
        Container(
          padding: const EdgeInsets.only(bottom: 175.0),
          height: height * 80 / 100,
          child: ListView.builder(
              padding: EdgeInsets.zero,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.adsModel.details?.length,
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: customText(
                                text:
                                    '${widget.adsModel.title?[i] ?? 'null'} : ',
                                textColor: Colors.black,
                                textFontSize: 14.0,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: customText(
                                text:
                                    '${widget.adsModel.details?[i] ?? 'null'}',
                                textColor: mainColor,
                                textFontSize: 14.0,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify),
                          ),
                        ),
                      ],
                    ),
                    customContainer(
                        colorBack: greyColor, height: 1.0, width: width),
                  ],
                );
              }),
        ),
      ],
    );
  }

// list of images in first page
  Widget imagePerView(double height, ScrollController controller,
      BuildContext context, double width) {
    int length = widget.adsModel.images!.length;
    Color color = const Color.fromARGB(255, 56, 51, 51).withOpacity(0.6);
    return Container(
      height: height * 30 / 100,
      color: const Color.fromARGB(255, 240, 235, 230),
      child: Stack(
        children: [
          //images
          ListView.builder(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: length,
            itemBuilder: (_, i) {
              return SizedBox(
                width: width,
                child: Image.network(
                  widget.adsModel.images?[i] ?? urlHolder,
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
          // stop scrolls
          // Container(
          //   color: Colors.white10.withOpacity(0.1),
          //   height: height * 30 / 100,
          //   width: MediaQuery.of(context).size.width,
          // ),
          // space for view big image
          customPositioned(
            left: 65.0,
            right: 65.0,
            top: 0.0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return PreViewImage(list: widget.adsModel.images!);
                }));
              },
              child: Container(
                height: height * 30 / 100,
                width: 60,
                color: Colors.transparent,
              ),
            ),
          ),
          // btn left right jumb index
          customPositioned(
            left: 0.0,
            top: height * 10 / 100,
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: CustomIconButton().customIconButton(
                      function: () {
                        _animateMinesToIndex(
                            controller, width, length, context);
                      },
                      icon: Icons.arrow_back_ios,
                      size: 30.0,
                      color: mainColor),
                ),
              ],
            ),
          ),
          customPositioned(
            right: 0.0,
            top: height * 10 / 100,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.black.withOpacity(0.5),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: CustomIconButton().customIconButton(
                      function: () {
                        _animatePlusToIndex(controller, width, length, context);
                      },
                      icon: Icons.arrow_forward_ios,
                      size: 30.0,
                      color: mainColor),
                ),
              ],
            ),
          ),
          // counter
          customPositioned(
            bottom: 0.0,
            right: MediaQuery.of(context).size.width * 40 / 100,
            left: MediaQuery.of(context).size.width * 40 / 100,
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              height: 40.0,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: customText(
                  text:
                      '${context.watch<IntVal>().indexImageCounter ?? 1}/${widget.adsModel.images!.length.toString()}',
                  textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }

  // this method for anmit++ an image based on image index
  void _animatePlusToIndex(
      ScrollController c, double width, int length, BuildContext context) {
    int i = context.read<IntVal>().indexImage ?? 0;
    if (i < length - 1) {
      i++;
      Provider.of<IntVal>(context, listen: false).updateImageListIndex(i);
      c.animateTo(
        i * width,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      return;
    }
  }

  // this method for anmit -- an image based on image index
  void _animateMinesToIndex(
      ScrollController c, double width, int length, BuildContext context) {
    int i = context.read<IntVal>().indexImage ?? 0;
    if (i <= length - 1 && i != 0) {
      i--;
      Provider.of<IntVal>(context, listen: false).updateImageListIndex(i);
      c.animateTo(
        i * width,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  // this methos for format Start date
  String formatStartDare() {
    String date;
    final val = widget.adsModel.dateStart!.millisecondsSinceEpoch;
    final newDate = DateTime.fromMillisecondsSinceEpoch(val);
    date = newDate.toString().substring(0, 10);
    return date.toString();
  }

  // second page
  Widget secondPage() {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
        Container(
          color: secondColor,
          child: customText(
              text: '${widget.adsModel.owner?[0] ?? 'null'} - \n'
                  ' ${widget.adsModel.owner?[2] ?? 'null'}',
              textAlign: TextAlign.center,
              textColor: Colors.black,
              textFontSize: 25,
              textWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
        ),
        customSpacer(height: 30.0),
        Container(
          padding: const EdgeInsets.all(4.0),
          color: const Color.fromARGB(255, 247, 216, 216),
          child: customText(
              text: '${widget.adsModel.details?[0] ?? 'null'} - '
                  '${widget.adsModel.details?[2] ?? 'null'} '
                  '(${widget.adsModel.details?[3] ?? '\$'})',
              textColor: Colors.black,
              textFontSize: 16,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start),
        ),
        customSpacer(height: 30.0),
        Container(
          padding: const EdgeInsets.all(4.0),
          color: const Color.fromARGB(255, 250, 235, 235),
          child: customText(
              text: widget.adsModel.details?[1] ?? 'null',
              textColor: Colors.black,
              textFontSize: 16,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start),
        ),
      ],
    );
  }

// thered page
  Widget theredPage(Set<Marker> marker, double height,
      Completer<GoogleMapController> mapControler) {
    return ListView(
      children: [
        SizedBox(
          height: height * 80 / 100,
          child: GoogleMap(
            myLocationEnabled: true,
            markers: marker,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(widget.adsModel.latitude ?? 0.0,
                    widget.adsModel.longitude ?? 0.0),
                zoom: 14.4746),
            // onMapCreated: (GoogleMapController controller) {
            //   mapControler.complete(controller);
            // },
          ),
        ),
      ],
    );
  }

  // this method for add marker onTap map
  void _addMarker(Set<Marker> marker) {
    var newMarker = Marker(
        markerId: const MarkerId('location'),
        infoWindow: InfoWindow(
            title: '${widget.adsModel.country} - '
                '${widget.adsModel.city} - ${widget.adsModel.area}',
            snippet: '${widget.adsModel.mainStreat} - '
                '${widget.adsModel.streat} - '),
        position: LatLng(
            widget.adsModel.latitude ?? 0.0, widget.adsModel.longitude ?? 0.0),
        icon: BitmapDescriptor.defaultMarkerWithHue(.5));

    marker.clear();
    marker.add(newMarker);
  }
}
