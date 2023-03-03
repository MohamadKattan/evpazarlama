import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/pages/code_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../custom-widgets/custom_dailog.dart';
import '../helper/config.dart';
import '../state-maneg/booling_val.dart';

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
            pushToNewScreen(context: context, routeName: toProfileScreen);
          } else {
            customSnackBar(
                context: context,
                text: AppLocalizations.of(context)!.someWrong,
                color: Colors.red);
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
            context.read<BoolingVal>().loadingAuth(false);
        if (e.code == 'invalid-phone-number') {
          customSnackBar(
              context: context,
              text: AppLocalizations.of(context)!.phoneNotValeid,
              color: Colors.red);
        }
        if (e.code == 'invalid-verification-code') {
          customSnackBar(
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
          customSnackBar(
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
      await authInstance.signInWithCredential(credential).then((value) {
        if (value.user!.uid.isNotEmpty) {
          final id = value.user!.uid.toString();
          userId = id;
          pushToNewScreen(context: context, routeName: toProfileScreen);
        } else {
          customSnackBar(
              context: context,
              text: AppLocalizations.of(context)!.someWrong,
              color: Colors.red);
        }
      });
    } catch (ex) {
      customSnackBar(
          context: context, text: ex.toString(), color: Colors.red.shade700);
    }
  }
}
