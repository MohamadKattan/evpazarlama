import 'dart:io';

import 'package:evpazarlama/client-srv/database_srv.dart';
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/helper/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../helper/custom_container.dart';
import '../helper/custom_drop.dart';
import '../state-maneg/booling_val.dart';
import '../state-maneg/image_val.dart';
import '../state-maneg/string_val.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});
  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: mainColor,
        ),
        drawer: customDrawer(context),
        body: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customSpacer(height: 20.0),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) {
                            return CustomDailog().camerOrGallery(context);
                          });
                    },
                    child: buttonPickImageOrImage(context)),
                customSpacer(height: 20.0),
                customText(
                    text: AppLocalizations.of(context)!.addPhotot,
                    textFontSize: 12),
                customSpacer(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customTextFailed(
                      controller: nameController,
                      lable: AppLocalizations.of(context)!.name,
                      hintText: AppLocalizations.of(context)!.hintName,
                      inputType: TextInputType.name,
                      fillColor: Colors.white),
                ),
                customSpacer(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customTextFailed(
                      controller: emailController,
                      lable: AppLocalizations.of(context)!.mail,
                      hintText: AppLocalizations.of(context)!.hintMail,
                      inputType: TextInputType.emailAddress,
                      fillColor: Colors.white),
                ),
                customSpacer(height: 20.0),
                customDropButton(list: [
                  AppLocalizations.of(context)!.personalAccount,
                  AppLocalizations.of(context)!.commercialAccount
                ], context: context),
                customSpacer(height: 20.0),
                GestureDetector(
                  onTap: () {
                    checkBeforSetToDataBase(context);
                  },
                  child: customContainer(
                      spaceAroundTopMargin: 15.0,
                      colorBack: Colors.white,
                      ridusBL: 12.0,
                      ridusBR: 12.0,
                      ridusR: 12.0,
                      ridusl: 12.0,
                      width: 220.0,
                      height: 60.0,
                      child: textOrIndector(context)),
                ),
              ],
            )),
      )),
    );
  }

  // this widget for display text okay or circleIndector if loading start
  Widget textOrIndector(BuildContext context) {
    bool val = context.watch<BoolingVal>().isLodingAuth;
    return val
        ? const Center(child: CircularProgressIndicator(color: mainColor))
        : customText(
            text: AppLocalizations.of(context)!.uploadUserInfo,
            textColor: mainColor,
            textWeight: FontWeight.bold);
  }

  // this widget for diplay IconButton or an image after user picked
  Widget buttonPickImageOrImage(BuildContext context) {
    final val = context.watch<ImageVal>().imageFileList;
    return val != null
        ? Image.file(File(val[0].path), width: 50, height: 50)
        : cutomImageIcon(imagePath: 'addphotot.png', width: 50.0, height: 50.0);
  }

  void checkBeforSetToDataBase(BuildContext context) {
    final valDropBotton =
        Provider.of<StringVal>(context, listen: false).dropdownValue;
    bool valLoading =
        Provider.of<BoolingVal>(context, listen: false).isLodingAuth;

    if (nameController.text.isEmpty) {
      CustomDailog().customSnackBar(
          context: context, text: AppLocalizations.of(context)!.nameReq);
    } else if (emailController.text.isEmpty) {
      CustomDailog().customSnackBar(
          context: context, text: AppLocalizations.of(context)!.emailReq);
    } else {
      if (!valLoading) {
        context.read<BoolingVal>().loadingAuth(true);
        String name = nameController.text;
        String email = emailController.text.trim();
        String typeAcount =
            valDropBotton ?? AppLocalizations.of(context)!.personalAccount;
        String phone = authInstance.currentUser?.phoneNumber ?? 'null';
        DataBaseSrv().setUserInfoProfileToDataBase(
            name, email, typeAcount, phone, context);
      }
    }
  }
}
