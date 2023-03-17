import 'dart:io';

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../helper/config.dart';
import '../helper/custom_container.dart';
import '../helper/custom_icon.dart';
import '../helper/custom_positioned.dart';
import '../helper/custom_text.dart';
import '../state-maneg/image_val.dart';

class AddPhotos extends StatelessWidget {
  const AddPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(text: appBarText(context)),
        ),
        drawer: customDrawer(context),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              cutomImage(
                  imagePath: 'gallery.webp',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fill),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.5),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: customText(
                    text: AppLocalizations.of(context)!.pickImagesAdsDsc,
                    textColor: Colors.white,
                    textWeight: FontWeight.bold),
              ),
              prviewOfImage(context),
              customPositioned(
                right: 0.0,
                left: 0.0,
                bottom: 150.0,
                child: GestureDetector(
                  onTap: () {
                    GlobalMethods().pickImagesMethod(
                        ImageSource.gallery, context,
                        isMultiImage: true);
                  },
                  child: customContainer(
                      spaceAroundLeftMargin: 50.0,
                      spaceAroundRightMargin: 50.0,
                      ridusBL: 12.0,
                      ridusBR: 12.0,
                      ridusR: 12.0,
                      ridusl: 12.0,
                      colorBack: secondColor,
                      height: 60.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customIcon(iconData: Icons.camera, size: 35.0),
                          customText(
                            text: AppLocalizations.of(context)!.pickImage,
                            textFontSize: 16,
                            textWeight: FontWeight.bold,
                          )
                        ],
                      )),
                ),
              ),
              customPositioned(
                right: 0.0,
                left: 0.0,
                bottom: 0.0,
                child: customContainer(
                  height: 60,
                  colorBack: Colors.black.withOpacity(0.9),
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
                            width: MediaQuery.of(context).size.width * 30 / 100,
                            height: 20,
                            ridusBL: 12.0,
                            ridusBR: 12.0,
                            ridusR: 12.0,
                            ridusl: 12.0,
                          ),
                          customPositioned(
                              left: 0.0,
                              right: 0.0,
                              child: customText(text: '(3/5)'))
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          checkImages(context);
                        },
                        child: customContainer(
                            colorBack: mainColor,
                            width: MediaQuery.of(context).size.width * 45 / 100,
                            ridusBL: 12.0,
                            ridusBR: 12.0,
                            ridusR: 12.0,
                            ridusl: 12.0,
                            child: customText(
                                text: AppLocalizations.of(context)!.next,
                                textColor: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// this method for text in app bar with update
  String appBarText(BuildContext context) {
    String text =
        '${AppLocalizations.of(context)!.pickImagesAds}  (${context.watch<ImageVal>().imageFileList?.length ?? 0}/10)';
    return text;
  }

  Widget prviewOfImage(BuildContext context) {
    final list = context.watch<ImageVal>().imageFileList;
    return list!= null?
     customPositioned(
      right: 0.0,
      left: 0.0,
      top: 100,
      child: Container(
        color: Colors.brown.shade100.withOpacity(0.3),
        height: 200.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(20.0),
            itemCount: 10,
            itemBuilder: (_, index) {
              if (list.isNotEmpty) {
                return Container(
                    height: 120.0,
                    margin: const EdgeInsets.all(12.0),
                    color: Colors.brown.shade200,
                    child: Image.file(File(list[index].path),
                    fit: BoxFit.cover,
                    height: 150,
                    width: 150,
                       ));
              } else {
                return const SizedBox();
              }
            }),
      ),
    ): const SizedBox();
  }

  // this method for check if image list Not empty
  void checkImages(BuildContext context) {
    final list = Provider.of<ImageVal>(context, listen: false).imageFileList;
    if (list == null) {
      CustomDailog().customSnackBar(
          context: context,
          text: '*** ${AppLocalizations.of(context)!.pickImage} ***');
    } else if (list.length > 10) {
      list.removeRange(10, list.length);
      Provider.of<ImageVal>(context, listen: false).updatImagePickerState(list);
      print('after delete == ${list.length}');
    } else {
      print(list.length);
    }
  }
}
