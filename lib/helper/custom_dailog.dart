// this custom dailog for diplay list of chosses

import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_container.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

import '../global-methods/methods.dart';
import 'custom_icon.dart';

class CustomDailog {
  //  snack bar to display an message
  void customSnackBar(
      {required BuildContext context, required String text, Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: color ?? Colors.red,
    ));
  }

  Widget dailogSaleRent(BuildContext context) {
    return Dialog(
      elevation: 0.9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          customContainer(
            colorBack: mainColor,
            ridusl: 16.0,
            ridusR: 16.0,
            child: Row(
              children: [
                IconButton(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    onPressed: () {
                      GlobalMethods().popFromScreen(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.red),
                customText(
                    text: AppLocalizations.of(context)!.categorySelection),
              ],
            ),
          ),
          customContainer(
            height: 250,
            width: double.infinity,
            colorBack: Colors.white,
            ridusBL: 16.0,
            ridusBR: 16.0,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                ListTile(
                  onTap: () {
                    saleRentElseVal = 0;
                    Navigator.pop(context, true);
                  },
                  minLeadingWidth: 10.0,
                  trailing: customIcon(
                      iconData: Icons.arrow_forward_ios, color: mainColor),
                  title: customText(
                      text: AppLocalizations.of(context)!.sale,
                      textAlign: TextAlign.justify,
                      textFontSize: 18.0,
                      textColor: mainColor,
                      textWeight: FontWeight.bold),
                ),
                ListTile(
                  onTap: () {
                    saleRentElseVal = 1;
                    Navigator.pop(context, true);
                  },
                  minLeadingWidth: 10.0,
                  trailing: customIcon(
                      iconData: Icons.arrow_forward_ios, color: mainColor),
                  title: customText(
                      text: AppLocalizations.of(context)!.rent,
                      textAlign: TextAlign.justify,
                      textFontSize: 18.0,
                      textColor: mainColor,
                      textWeight: FontWeight.bold),
                ),
                ListTile(
                  onTap: () {
                    saleRentElseVal = 2;
                    Navigator.pop(context, true);
                  },
                  minLeadingWidth: 10.0,
                  trailing: customIcon(
                      iconData: Icons.arrow_forward_ios, color: mainColor),
                  title: customText(
                      text: AppLocalizations.of(context)!.daylyRent,
                      textAlign: TextAlign.justify,
                      textFontSize: 18.0,
                      textColor: mainColor,
                      textWeight: FontWeight.bold),
                ),
                ListTile(
                  onTap: () {
                    saleRentElseVal = 3;
                    Navigator.pop(context, true);
                  },
                  minLeadingWidth: 10.0,
                  trailing: customIcon(
                      iconData: Icons.arrow_forward_ios, color: mainColor),
                  title: customText(
                      text: AppLocalizations.of(context)!.transferSale,
                      textAlign: TextAlign.justify,
                      textFontSize: 18.0,
                      textColor: mainColor,
                      textWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget saleRentElseAdsNewAdd(BuildContext context, List item) {
  //   return Dialog(
  //     elevation: 0.9,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  //     backgroundColor: Colors.transparent,
  //     child: Column(mainAxisSize: MainAxisSize.min, children: [
  //       customContainer(
  //         colorBack: mainColor,
  //         ridusl: 16.0,
  //         ridusR: 16.0,
  //         child: Row(
  //           children: [
  //             IconButton(
  //                 padding: const EdgeInsets.only(left: 20.0, right: 20.0),
  //                 onPressed: () {
  //                   GlobalMethods().popFromScreen(context);
  //                 },
  //                 icon: const Icon(Icons.arrow_back_ios),
  //                 color: Colors.red),
  //             customText(text: AppLocalizations.of(context)!.categorySelection),
  //           ],
  //         ),
  //       ),
  //       customContainer(
  //         height: item.length > 2 ? 250 : 175,
  //         width: double.infinity,
  //         colorBack: Colors.white,
  //         ridusBL: 16.0,
  //         ridusBR: 16.0,
  //         child: ListView.builder(
  //             padding: EdgeInsets.zero,
  //             shrinkWrap: true,
  //             itemCount: item.length,
  //             itemBuilder: (_, index) {
  //               if (item.isNotEmpty) {
  //                 return ListTile(
  //                   onTap: () {
  //                     GlobalMethods()
  //                         .switchToAnyTypeListItemAdsNewadd(context, index);
  //                   },
  //                   minLeadingWidth: 10.0,
  //                   trailing: customIcon(
  //                       iconData: Icons.arrow_forward_ios, color: mainColor),
  //                   title: customText(
  //                       text: item[index],
  //                       textAlign: TextAlign.justify,
  //                       textFontSize: 18.0,
  //                       textColor: mainColor,
  //                       textWeight: FontWeight.bold),
  //                 );
  //               } else {
  //                 const CircularProgressIndicator(color: mainColor);
  //               }
  //               return const CircularProgressIndicator(color: mainColor);
  //             }),
  //       ),
  //     ]),
  //   );
  // }

  // dailog for chose camera or gallary befor pick an image
  Widget camerOrGallery(BuildContext context) {
    return Dialog(
      elevation: 0.9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          customSpacer(height: 15.0),
          customText(
            text: AppLocalizations.of(context)!.pickImage,
            textColor: mainColor,
          ),
          ListTile(
            onTap: () async {
              await GlobalMethods()
                  .pickImagesMethod(
                ImageSource.camera,
                context,
              )
                  .whenComplete(() {
                GlobalMethods().popFromScreen(context);
              });
            },
            leading: customIcon(iconData: Icons.camera, color: mainColor),
            trailing: customIcon(
                iconData: Icons.arrow_forward_ios_rounded, color: mainColor),
            title: customText(
                textAlign: TextAlign.justify,
                text: AppLocalizations.of(context)!.byCamera,
                textColor: mainColor),
          ),
          ListTile(
            onTap: () async {
              await GlobalMethods()
                  .pickImagesMethod(
                ImageSource.gallery,
                context,
              )
                  .whenComplete(() {
                GlobalMethods().popFromScreen(context);
              });
            },
            leading: customIcon(
                iconData: Icons.photo_library_outlined, color: mainColor),
            trailing: customIcon(
                iconData: Icons.arrow_forward_ios_rounded, color: mainColor),
            title: customText(
                textAlign: TextAlign.justify,
                text: AppLocalizations.of(context)!.fromGallary,
                textColor: mainColor),
          ),
          ListTile(
            onTap: () {
              GlobalMethods().popFromScreen(context);
            },
            leading: customIcon(iconData: Icons.close, color: Colors.red),
            trailing: customIcon(
                iconData: Icons.arrow_forward_ios_rounded, color: Colors.red),
            title: customText(
                textAlign: TextAlign.justify,
                text: AppLocalizations.of(context)!.cancle,
                textColor: Colors.red),
          ),
          customSpacer(height: 15.0)
        ],
      ),
    );
  }

  // globle dailog with dynamic text and functions
  Widget globalDailog(
      {required BuildContext context,
      required String title,
      required String textBtn1,
      required Function function}) {
    return Dialog(
      elevation: 0.9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      backgroundColor: Colors.white,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        customSpacer(height: 15.0),
        customText(
            text: title, textColor: mainColor, textAlign: TextAlign.center),
        customSpacer(height: 15.0),
        ListTile(
          onTap: () {
            function();
          },
          minVerticalPadding: 15.0,
          trailing: customIcon(
              iconData: Icons.arrow_forward_ios_rounded, color: mainColor),
          title: customText(
              textAlign: TextAlign.justify,
              text: textBtn1,
              textColor: mainColor),
        ),
        ListTile(
          onTap: () {
            GlobalMethods().popFromScreen(context);
          },
          minVerticalPadding: 15.0,
          trailing: customIcon(
              iconData: Icons.arrow_forward_ios_rounded, color: Colors.red),
          title: customText(
              textAlign: TextAlign.justify,
              text: AppLocalizations.of(context)!.cancle,
              textColor: Colors.red),
        ),
      ]),
    );
  }
}
