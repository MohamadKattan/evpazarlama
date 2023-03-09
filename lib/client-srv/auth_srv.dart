import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/pages/code_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../helper/custom_dailog.dart';
import '../helper/config.dart';
import '../state-maneg/booling_val.dart';
import 'database_srv.dart';

class AuthSrv {
  // this method for start singUp by phone Nummber
  Future<void> authByPhoneNumber(
      BuildContext context, String? userPhone) async {
    await authInstance.verifyPhoneNumber(
      phoneNumber: userPhone,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await authInstance.signInWithCredential(credential).then((value) {
          if (value.user!.uid.isNotEmpty) {
            final id = value.user!.uid.toString();
            userId = id;
            GlobalMethods()
                .pushToNewScreen(context: context, routeName: toProfileInfo);
          } else {
            CustomDailog().customSnackBar(
                context: context,
                text: AppLocalizations.of(context)!.someWrong,
                color: Colors.red);
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        context.read<BoolingVal>().loadingAuth(false);
        if (e.code == 'invalid-phone-number') {
          CustomDailog().customSnackBar(
              context: context,
              text: AppLocalizations.of(context)!.phoneNotValeid,
              color: Colors.red);
        }
        if (e.code == 'invalid-verification-code') {
          CustomDailog().customSnackBar(
              context: context,
              text: AppLocalizations.of(context)!.codeWrong,
              color: Colors.red);
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        context.read<BoolingVal>().loadingAuth(false);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CodePhone(
            verId: verificationId,
          );
        }));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        context.read<BoolingVal>().loadingAuth(false);
        if (userId == 'null') {
          CustomDailog().customSnackBar(
              context: context,
              text: AppLocalizations.of(context)!.timeOut,
              color: Colors.red);
        } else {
          return;
        }
      },
    );
  }

// this method it will work IN CODE screen for display code and end singup
  Future<void> codeSent(String verId, TextEditingController codeController,
      BuildContext context) async {
    try {
      String smsCode = codeController.text.trim();
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
      await authInstance.signInWithCredential(credential).then((value) async {
        if (value.user!.uid.isNotEmpty) {
          context.read<BoolingVal>().loadingAuth(false);
          final id = value.user!.uid.toString();
          userId = id;
          await DataBaseSrv().getUserProfileInfo(context).whenComplete(() {
            if (userInfoProfile?.userName != null) {
              GlobalMethods().pushReplaceToNewScreen(
                  context: context, routeName: toHomeScreen);
            } else {
              GlobalMethods().pushReplaceToNewScreen(
                  context: context, routeName: toProfileInfo);
            }
          });
        } else {
          CustomDailog().customSnackBar(
              context: context,
              text: AppLocalizations.of(context)!.someWrong,
              color: Colors.red);
        }
      });
    } catch (ex) {
      CustomDailog().customSnackBar(
          context: context, text: ex.toString(), color: Colors.red.shade700);
    }
  }
}
