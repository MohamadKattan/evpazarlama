import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:evpazarlama/helper/custom_positioned.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/models/ads_model.dart';
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
  int adsId = Random().nextInt(10000);
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
                .then((valUrl) async {
              final map = UserInfoProfile().toJson(
                  id: userId,
                  name: name,
                  phone: phone,
                  email: email,
                  type: typeAcount,
                  url: valUrl,
                  plan: 1);
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
          url: 'null',
          plan: 1);
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
//===========================this methods for owner ads =====================

  // this method for set new ads to storage then to cloud ads colection then to user ad colloction
  Future<void> puplishNewAds(BuildContext context) async {
    final image = Provider.of<ImageVal>(context, listen: false).imageFileList;
    List urlList = [];
    if (image != null) {
      context.read<BoolingVal>().loadingAuth(true);
      for (var i = 0; i < image.length; i++) {
        int randomId = Random().nextInt(10000);
        final file = File(image[i].path);
        final uploadTask = storage
            .child('allAds/$userId/$adsId$userId/$randomId')
            .putFile(file, metadata);
        uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
          switch (taskSnapshot.state) {
            case TaskState.running:
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
                  .child("allAds/$userId/$adsId$userId/$randomId")
                  .getDownloadURL()
                  .then((valUrl) async {
                urlList.addAll([valUrl]);
                if (urlList.length == image.length) {
                  setDataToAllAds(context, urlList).whenComplete(() {
                    context.read<BoolingVal>().loadingAuth(false);
                  });
                }
              });
              break;
          }
        });
      }
    }
  }

// this method for set all data to cloud all ads after uplod to storage and got list of url
  Future<void> setDataToAllAds(BuildContext context, List urlList) async {
    int adNumber = Random().nextInt(10000);
    // int adsIdDoc = Random().nextInt(10000);
    Map<String, dynamic> map = AdsModel().toJson(
        context: context,
        adsNumber: adNumber,
        urlImages: urlList,
        adsId: adsId.toString());
    await adsCollection
        .doc('${adsId.toString()}$userId')
        .set(map)
        .catchError((e) {
      CustomDailog().customSnackBar(
          context: context, text: AppLocalizations.of(context)!.someWrong);
      throw (e.toString());
    }).whenComplete(() async {
      await myAdsCollection
          .doc('${adsId.toString()}$userId')
          .set(map)
          .catchError((e) {
        CustomDailog().customSnackBar(
            context: context, text: AppLocalizations.of(context)!.someWrong);
        throw (e.toString());
      });
      await calcePlan();
      if (context.mounted) {
        getOwnerAds(context);
        Navigator.pushNamedAndRemoveUntil(
            context, toHomeScreen, (route) => false);
      }
    });
  }

  Future<void> calcePlan() async {
    int? plan = userInfoProfile?.plan ?? 0;
    plan = plan - 1;
    await usersProfileCollection.doc(userId).update({"plan": plan});
  }

  // this method for got ads from owner ads  from his collection users => myAds
  Future<void> getOwnerAds(BuildContext context) async {
    listownerAdsOk.clear();
    listownerAdsPandding.clear();
    if (!userId.contains('null')) {
      await myAdsCollection.get().then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          for (var ele in querySnapshot.docs) {
            Map<String, dynamic> map = ele.data() as Map<String, dynamic>;
            AdsModel adsModel = AdsModel.fromJson(map);
            if (adsModel.status!.contains('ok')) {
              listownerAdsOk.add(adsModel);
            } else {
              listownerAdsPandding.add(adsModel);
            }
          }
        }
      }).catchError((er) {
        CustomDailog().customSnackBar(context: context, text: er);
      });
    } else {
      return;
    }
  }

  // change status based on expired time < from now
  Future<void> changeStatusAds(BuildContext context) async {
    final timeNow = DateTime.now().millisecondsSinceEpoch;
    if (listownerAdsOk.isNotEmpty) {
      for (var i in listownerAdsOk) {
        final id = i.adsId;
        int dateExpired = i.dateExpired!.millisecondsSinceEpoch;
        if (dateExpired <= timeNow) {
          await myAdsCollection.doc(id).update({
            "sitting": {
              "userId": userId,
              "adsId": id,
              "status": "pandding",
              "dateStart": DateTime.utc(year, monthe, day),
              "dateExpired": DateTime.utc(year, monthe, day),
            }
          });
          await adsCollection.doc(id).update({
            "sitting": {
              "userId": userId,
              "adsId": id,
              "status": "pandding",
              "dateStart": DateTime.utc(year, monthe, day),
              "dateExpired": DateTime.utc(year, monthe, day),
            }
          });
        }
      }
    } else {
      return;
    }
  }

  // this method for rePuplish ads if data expirt
  Future<void> rePuplisAd(BuildContext context, String? id) async {
    context.read<BoolingVal>().loadingAuth(true);
    await myAdsCollection.doc(id).update({
      "sitting": {
        "userId": userId,
        "adsId": id,
        "status": "ok",
        "dateStart": DateTime.utc(year, monthe, day),
        "dateExpired": DateTime.utc(exPirtyear, expirtMont, day),
      }
    });
    await adsCollection.doc(id).update({
      "sitting": {
        "userId": userId,
        "adsId": id,
        "status": "ok",
        "dateStart": DateTime.utc(year, monthe, day),
        "dateExpired": DateTime.utc(exPirtyear, expirtMont, day),
      }
    }).whenComplete(() async {
      context.read<BoolingVal>().loadingAuth(false);
      await calcePlan();
      if (context.mounted) {
        getOwnerAds(context);
        Navigator.pushNamedAndRemoveUntil(
            context, toHomeScreen, (route) => false);
      }
    });
  }

  // this method for delete ads from all collection and storage
  Future<void> deleteAds(BuildContext context, String? id) async {
    context.read<BoolingVal>().loadingAuth(true);
    await myAdsCollection.doc(id).delete();
    await adsCollection.doc(id).delete();
    final refStorage = storage.child('allAds/$userId/$id');
    await refStorage.listAll().then((value) {
      for (var element in value.items) {
        FirebaseStorage.instance.ref(element.fullPath).delete();
      }
    });
    if (context.mounted) {
      context.read<BoolingVal>().loadingAuth(false);
      getOwnerAds(context);
      Navigator.pushNamedAndRemoveUntil(
          context, toHomeScreen, (route) => false);
    }
  }

//============================got all ads for all users====================

  Widget streamGetAllAds() {
    listGenarlAds.clear();
    return StreamBuilder<QuerySnapshot>(
      stream: adsCollection.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Container(
            color: Colors.blueGrey.shade100.withOpacity(0.6),
            height: 300.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(
                    text: AppLocalizations.of(context)!.someWrong,
                    textColor: Colors.red),
                const CircularProgressIndicator(
                  color: Colors.red,
                ),
              ],
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.blueGrey.shade100.withOpacity(0.6),
            height: 300.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(text: 'Wait...', textColor: Colors.amber),
                const CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ],
            ),
          );
        }

        if (snapshot.data!.docs.isEmpty) {
          return Container(
            color: Colors.blueGrey.shade100.withOpacity(0.6),
            height: 300.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(
                    text: AppLocalizations.of(context)!.noFound,
                    textColor: mainColor),
                const CircularProgressIndicator(
                  color: mainColor,
                ),
              ],
            ),
          );
        }
        return Container(
          color: Colors.blueGrey.shade100.withOpacity(0.6),
          height: 300.0,
          child: GridView.count(
            padding: const EdgeInsets.all(8.0),
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> map =
                  document.data()! as Map<String, dynamic>;
              AdsModel adsModel = AdsModel.fromJson(map);
              if (adsModel.status == 'ok') {
                listGenarlAds.add(adsModel);
                GlobalMethods().filtterGenerlListToAddIn48List();
                GlobalMethods().filterGenerlList();
              }
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.white),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      adsModel.images?[0] ?? urlHolder,
                      width: 200,
                      height: 145.0,
                      fit: BoxFit.cover,
                    ),
                    customPositioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        color: Colors.white.withOpacity(0.8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(
                                text: adsModel.details?[0] ?? '***',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                textFontSize: 14,
                                textWeight: FontWeight.bold,
                                textColor: mainColor),
                            customText(
                                text:
                                    '${adsModel.details?[2] ?? '***'}${adsModel.details?[3] ?? '***'}',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                textFontSize: 10,
                                textWeight: FontWeight.bold,
                                textColor: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

//   // this method for set new ads to storage then to cloud ads colection then to user ad colloction
//   Future<void> puplishNewAds(BuildContext context) async {
//     final image = Provider.of<ImageVal>(context, listen: false).imageFileList;
//     List urlList = [];
//     if (image != null) {
//       context.read<BoolingVal>().loadingAuth(true);
//       for (var i = 0; i < image.length; i++) {
//         final file = File(image[i].path);
//         int randomId = Random().nextInt(10000);
//         final uploadTask = storage
//             .child('allAds')
//             .child(userId)
//             .child(randomId.toString())
//             .putFile(file, metadata);
//         uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
//           switch (taskSnapshot.state) {
//             case TaskState.running:
//               break;
//             case TaskState.paused:
//               context.read<BoolingVal>().loadingAuth(false);
//               CustomDailog().customSnackBar(
//                   context: context,
//                   text: TaskState.canceled.name,
//                   color: Colors.amberAccent);
//               break;
//             case TaskState.canceled:
//               context.read<BoolingVal>().loadingAuth(false);
//               CustomDailog().customSnackBar(
//                   context: context, text: TaskState.canceled.name);
//               break;
//             case TaskState.error:
//               context.read<BoolingVal>().loadingAuth(false);
//               CustomDailog()
//                   .customSnackBar(context: context, text: TaskState.error.name);
//               break;
//             case TaskState.success:
//               await storage
//                   .child("allAds/$userId/${randomId.toString()}")
//                   .getDownloadURL()
//                   .then((valUrl) async {
//                 urlList.addAll([valUrl]);
//                 if (urlList.length == image.length) {
//                   setDataToAllAds(context, urlList).whenComplete(() {
//                     context.read<BoolingVal>().loadingAuth(false);
//                   });
//                 }
//                 // final map = UserInfoProfile().toJson(
//                 //     id: userId,
//                 //     name: name,
//                 //     phone: phone,
//                 //     email: email,
//                 //     type: typeAcount,
//                 //     url: valUrl,
//                 //     plan: 1);
//                 // await usersProfileCollection
//                 //     .doc(userId)
//                 //     .set(map)
//                 //     .whenComplete(() {
//                 //   context.read<BoolingVal>().loadingAuth(false);
//                 //   GlobalMethods().pushReplaceToNewScreen(
//                 //       context: context, routeName: toSplash);
//                 // }).catchError((e) {
//                 //   CustomDailog().customSnackBar(
//                 //       context: context,
//                 //       text: AppLocalizations.of(context)!.someWrong);
//                 // });
//               });
//               break;
//           }
//         });
//       }
//     }
//   }

// // this method for set all data to cloud all ads after uplod to storage and got list of url
//   Future<void> setDataToAllAds(BuildContext context, List urlList) async {
//     int randomId = Random().nextInt(10000);
//     int adsIdDoc = Random().nextInt(10000);
//     Map<String, dynamic> map = AdsModel().toJson(
//         context: context,
//         adsNumber: randomId,
//         urlImages: urlList,
//         adsId: adsIdDoc.toString());
//     await adsCollection
//         .doc('${adsIdDoc.toString()}$userId')
//         .set(map)
//         .catchError((e) {
//       CustomDailog().customSnackBar(
//           context: context, text: AppLocalizations.of(context)!.someWrong);
//       throw (e.toString());
//     }).whenComplete(() async {
//       await myAdsCollection
//           .doc('${adsIdDoc.toString()}$userId')
//           .set(map)
//           .catchError((e) {
//         CustomDailog().customSnackBar(
//             context: context, text: AppLocalizations.of(context)!.someWrong);
//         throw (e.toString());
//       });
//     }).whenComplete(() {
//       int? plan = userInfoProfile?.plan ?? 0;
//       plan = plan - 1;
//       usersProfileCollection.doc(userId).update({"plan": plan});
//     }).whenComplete(() {
//       getOwnerAds(context);
//       Navigator.pushNamedAndRemoveUntil(
//           context, toHomeScreen, (route) => false);
//     });
//   }

//   // this method for got ads from owner ads  from his collection users => myAds
//   Future<void> getOwnerAds(BuildContext context) async {
//     listownerAdsOk.clear();
//     listownerAdsPandding.clear();
//     if (!userId.contains('null')) {
//       await myAdsCollection.get().then((QuerySnapshot querySnapshot) {
//         if (querySnapshot.docs.isNotEmpty) {
//           for (var ele in querySnapshot.docs) {
//             Map<String, dynamic> map = ele.data() as Map<String, dynamic>;
//             AdsModel adsModel = AdsModel.fromJson(map);
//             if (adsModel.status!.contains('ok')) {
//               listownerAdsOk.add(adsModel);
//             } else {
//               listownerAdsPandding.add(adsModel);
//             }
//           }
//         }
//       }).catchError((er) {
//         CustomDailog().customSnackBar(context: context, text: er);
//       });
//     } else {
//       return;
//     }
//   }
