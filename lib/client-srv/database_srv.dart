import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../global-methods/methods.dart';
import '../models/user_info.dart';
import '../state-maneg/booling_val.dart';
import '../state-maneg/image_val.dart';

class DataBaseSrv {
  final metadata = SettableMetadata(contentType: "image/jpeg");
  // this method for set user info profile to data base
  Future<void> setUserInfoProfileToDataBase(String name, String email,
      String typeAcount, String phone, BuildContext context) async {
    final image = Provider.of<ImageVal>(context, listen: false).imageFileList;
    if (image != null) {
      final file = File(image[0].path);
      final uploadTask =
          storage.child('users').child(userId).putFile(file, metadata);
      uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
        switch (taskSnapshot.state) {
          case TaskState.running:
            // final progress = 100.0 *
            //     (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            break;
          case TaskState.paused:
            context.read<BoolingVal>().loadingAuth(false);
            CustomDailog().customSnackBar(
                context: context,
                text: TaskState.canceled.name,
                color: Colors.amberAccent);
            break;
          case TaskState.canceled:
            context.read<BoolingVal>().loadingAuth(false);
            CustomDailog().customSnackBar(
                context: context, text: TaskState.canceled.name);
            break;
          case TaskState.error:
            context.read<BoolingVal>().loadingAuth(false);
            CustomDailog()
                .customSnackBar(context: context, text: TaskState.error.name);
            break;
          case TaskState.success:
            await storage
                .child("users/$userId")
                .getDownloadURL()
                .then((val) async {
              final map = UserInfoProfile().toJson(
                  id: userId,
                  name: name,
                  phone: phone,
                  email: email,
                  type: typeAcount,
                  url: val);
              await usersProfileCollection
                  .doc(userId)
                  .set(map)
                  .whenComplete(() {
                context.read<BoolingVal>().loadingAuth(false);
                GlobalMethods().pushReplaceToNewScreen(
                    context: context, routeName: toSplash);
              }).catchError((e) {
                CustomDailog().customSnackBar(
                    context: context,
                    text: AppLocalizations.of(context)!.someWrong);
              });
            });
            break;
        }
      });
    } else {
      final map = UserInfoProfile().toJson(
          id: userId,
          name: name,
          phone: phone,
          email: email,
          type: typeAcount,
          url: 'null');
      await usersProfileCollection.doc(userId).set(map).whenComplete(() {
        context.read<BoolingVal>().loadingAuth(false);
        GlobalMethods()
            .pushReplaceToNewScreen(context: context, routeName: toSplash);
      }).catchError((e) {
        CustomDailog().customSnackBar(
            context: context, text: AppLocalizations.of(context)!.someWrong);
      });
    }
  }

  // this meth for got user profile info from user/useid/profile colection

  Future<void> getUserProfileInfo(BuildContext context) async {
    if (userId != 'null') {
      await usersProfileCollection
          .doc(userId)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> map =
              documentSnapshot.data() as Map<String, dynamic>;
          userInfoProfile = UserInfoProfile.fromJson(map);
        } else {
          return;
        }
      }).catchError((e) {
        CustomDailog().customSnackBar(
            context: context, text: AppLocalizations.of(context)!.someWrong);
      });
    } else {
      return;
    }
  }
}
