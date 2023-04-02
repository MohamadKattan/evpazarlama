import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/custom_buttons.dart';
import 'package:evpazarlama/helper/custom_container.dart';
import 'package:evpazarlama/helper/custom_positioned.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:evpazarlama/state-maneg/booling_val.dart';
import 'package:evpazarlama/state-maneg/int_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../helper/config.dart';
import '../helper/custom_icon.dart';
import '../helper/custom_text.dart';

class OneAdsDetails extends StatelessWidget {
  final int index;
  final List<AdsModel> list;
  const OneAdsDetails({super.key, required this.index, required this.list});

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {},
                child: customIcon(iconData: Icons.message, size: 25.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {},
                child: customIcon(
                    iconData: Icons.star_border_purple500_sharp, size: 25.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {},
                child: customIcon(iconData: Icons.call, size: 25.0),
              ),
            ),
          ],
        ),
        drawer: customDrawer(context),
        body: Stack(
          children: [
            // buttons perView Page
            buttons(height, width, context),
            // liner
            customContainer(
                spaceAroundTopMargin: height * 7 / 100,
                colorBack: mainColor,
                height: 5.0,
                width: width),
            // list VIEW
            Container(
              margin: EdgeInsets.only(top: height * 8 / 100),
              height: height,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  imagePerView(height, controller, context, width),
                  //
                  customContainer(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        // owner info
                        customText(
                            text: AppLocalizations.of(context)!.ownerInfo,
                            textColor: secondColor,
                            textFontSize: 16.0,
                            textWeight: FontWeight.bold),
                        customText(
                            text: '${list[index].owner?[0] ?? 'null'} / '
                                '${list[index].owner?[2] ?? 'null'}',
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
                    child: Column(
                      children: [
                        customText(
                            text: AppLocalizations.of(context)!.adress,
                            textColor: secondColor,
                            textFontSize: 16.0,
                            textWeight: FontWeight.bold),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: customText(
                              text: '${list[index].country ?? 'null'} - '
                                  '${list[index].city ?? 'null'} - ${list[index].area ?? 'null'}  ',
                              textColor: mainColor,
                              overflow: TextOverflow.ellipsis),
                        ),
                        customText(
                            text: '${list[index].mainStreat ?? 'null'} - '
                                '${list[index].streat ?? 'null'} - ${list[index].streatNo ?? 'null'} ',
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
                    spaceAroundBottomMargin: 10,
                    child: customText(
                        text: AppLocalizations.of(context)!.details,
                        textColor: secondColor,
                        textFontSize: 16.0,
                        textWeight: FontWeight.bold),
                  ),
                  Stack(
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 241, 234, 234),
                        height: list[index].details?.length == 20
                            ? height
                            : height * 70 / 100,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: list[index].details?.length,
                            itemBuilder: (_, i) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: customText(
                                            text:
                                                '${list[index].title?[i] ?? 'null'} : ',
                                            textColor: Colors.black,
                                            textFontSize: 14.0,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: customText(
                                            text:
                                                '${list[index].details?[i] ?? 'null'}',
                                            textColor: mainColor,
                                            textFontSize: 14.0,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify),
                                      ),
                                    ],
                                  ),
                                  customContainer(
                                      spaceAroundTopMargin: 2,
                                      colorBack: greyColor,
                                      height: 2.0,
                                      width: width),
                                ],
                              );
                            }),
                      ),
                      customPositioned(
                        left: 0.0,
                        child: Container(
                          color: Colors.transparent,
                          height: list[index].details?.length == 20
                              ? height
                              : height * 70 / 100,
                          width: 50.0,
                        ),
                      ),
                      customPositioned(
                        right: 0.0,
                        child: Container(
                          color: Colors.transparent,
                          height: list[index].details?.length == 20
                              ? height
                              : height * 70 / 100,
                          width: 50.0,
                        ),
                      ),
                      list[index].details?.length == 20
                          ? const SizedBox()
                          : Container(
                              color: Colors.transparent,
                              height: height * 70 / 100,
                            )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// page view buttons
  Widget buttons(double height, double width, BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.read<BoolingVal>().updateAdInfoBtn(true);
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

  Widget imagePerView(double height, ScrollController controller,
      BuildContext context, double width) {
    int length = list[index].images!.length;
    Color color = const Color.fromARGB(255, 56, 51, 51).withOpacity(0.6);
    return Container(
      height: height * 40 / 100,
      color: const Color.fromARGB(255, 240, 235, 230),
      child: Stack(
        children: [
          //images
          ListView.builder(
            controller: controller,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: length,
            itemBuilder: (_, i) {
              return SizedBox(
                width: width,
                child: Image.network(
                  list[index].images?[i] ?? urlHolder,
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
          // stop scrolls
          Container(
            color: Colors.white10.withOpacity(0.1),
            height: height * 40 / 100,
            width: MediaQuery.of(context).size.width,
          ),
          // space for view big image
          customPositioned(
            left: 70.0,
            right: 70.0,
            top: 25.0,
            child: GestureDetector(
              onTap: () => print('hello'),
              child: Container(
                height: 180,
                width: 60,
                color: Colors.transparent,
              ),
            ),
          ),
          // btn left right jumb index
          customPositioned(
            left: 0.0,
            top: height * 19 / 100,
            child: CustomIconButton().customIconButton(
                function: () {
                  _animateMinesToIndex(controller, width, length, context);
                },
                icon: Icons.arrow_back_ios,
                size: 35.0,
                color: mainColor),
          ),
          customPositioned(
            right: 0.0,
            top: height * 19 / 100,
            child: CustomIconButton().customIconButton(
                function: () {
                  _animatePlusToIndex(controller, width, length, context);
                },
                icon: Icons.arrow_forward_ios,
                size: 35.0,
                color: mainColor),
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
                      '${context.watch<IntVal>().indexImageCounter ?? 1}/${list[index].images!.length.toString()}',
                  textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }

// this method for anmit an image in list view
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

  // this method for anmit an image in list view
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
}
