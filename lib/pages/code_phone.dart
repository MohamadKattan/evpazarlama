import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../client-srv/auth_srv.dart';
import '../helper/custom_dailog.dart';
import '../custom-widgets/custom_drawer.dart';
import '../helper/config.dart';
import '../helper/custom_container.dart';
import '../helper/custom_icon.dart';
import '../helper/custom_positioned.dart';
import '../helper/custom_text.dart';
import '../state-maneg/booling_val.dart';

class CodePhone extends StatelessWidget {
  final String verId;
  const CodePhone({super.key, required this.verId});
  static TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: mainColor,
          appBar: AppBar(
              backgroundColor: mainColor, centerTitle: false, elevation: 0.0),
          drawer: customDrawer(context),
          body: Stack(
            children: [
              customPositioned(
                right: 0.0,
                left: 0.0,
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  child: customIcon(
                      iconData: Icons.dialpad,
                      color: Colors.white54,
                      size: 30.0),
                ),
              ),
              customPositioned(
                top: 100.0,
                right: 0.0,
                left: 0.0,
                child: customText(
                    text: AppLocalizations.of(context)!.vervectioPhone,
                    textWeight: FontWeight.bold,
                    textFontSize: 18.0),
              ),
              customPositioned(
                top: 130.0,
                right: 0.0,
                left: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customText(
                      text: AppLocalizations.of(context)!.verificationExplain,
                      textFontSize: 14.0),
                ),
              ),
              customPositioned(
                bottom: 0.0,
                right: 0.0,
                left: 0.0,
                child: customContainer(
                  ridusl: 90.0,
                  colorBack: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: customText(
                          text: AppLocalizations.of(context)!.typeCodeBelow,
                          textColor: mainColor,
                        ),
                      ),
                      pinOutput(),
                      GestureDetector(
                        onTap: () async {
                          bool valLoading =
                              Provider.of<BoolingVal>(context, listen: false)
                                  .isLodingAuth;
                          if (codeController.text.isNotEmpty) {
                            if (!valLoading) {
                              context.read<BoolingVal>().loadingAuth(true);
                              await AuthSrv()
                                  .codeSent(verId, codeController, context);
                            }
                          } else {
                            CustomDailog().customSnackBar(
                                context: context,
                                text: AppLocalizations.of(context)!.codeIsReq,
                                color: Colors.red.shade700);
                          }
                        },
                        child: customContainer(
                            // spaceAroundBottomMargin: 15.0,
                            spaceAroundTopMargin: 15.0,
                            colorBack: mainColor,
                            ridusBL: 12.0,
                            ridusBR: 12.0,
                            ridusR: 12.0,
                            ridusl: 12.0,
                            width: 220.0,
                            height: 60.0,
                            child: textOrIndector(context)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget pinOutput() {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    final defaultPinTheme = PinTheme(
      width: 45,
      height: 45,
      textStyle: const TextStyle(
        fontSize: 16,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: mainColor),
      ),
    );
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Pinput(
        length: 6,
        controller: codeController,
        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
        listenForMultipleSmsOnAndroid: true,
        defaultPinTheme: defaultPinTheme,
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: 18,
              height: 1,
              color: focusedBorderColor,
            ),
          ],
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: focusedBorderColor),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: fillColor,
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: focusedBorderColor),
          ),
        ),
      ),
    );
  }

  Widget textOrIndector(BuildContext context) {
    bool val = context.watch<BoolingVal>().isLodingAuth;
    return val
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.white,
          ))
        : customText(
            text: AppLocalizations.of(context)!.vervectioPhone,
            textWeight: FontWeight.bold);
  }
}
