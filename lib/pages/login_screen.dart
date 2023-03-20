import 'package:country_list_pick/country_list_pick.dart';
import 'package:evpazarlama/helper/custom_container.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../client-srv/auth_srv.dart';
import '../helper/custom_dailog.dart';
import '../custom-widgets/custom_drawer.dart';
import '../helper/config.dart';
import '../helper/custom_positioned.dart';
import '../helper/custom_text_field.dart';
import '../state-maneg/booling_val.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static TextEditingController phoneControla = TextEditingController();
  static String? contryCode = '+90';
  static String? resultPhoneNimber;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    iconData: Icons.phone_android,
                    color: Colors.white54,
                    size: 30.0),
              ),
            ),
            customPositioned(
              top: 100.0,
              right: 0.0,
              left: 0.0,
              child: customText(
                  text: AppLocalizations.of(context)!.singup,
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
                    text: AppLocalizations.of(context)!.sighUPExplain,
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
                        text: AppLocalizations.of(context)!.codeContryPhone,
                        textColor: mainColor,
                      ),
                    ),
                    contryListWidget(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextFailed(
                        controller: phoneControla,
                        lable: AppLocalizations.of(context)!.phoneNumbe,
                        hintText: AppLocalizations.of(context)!.typephoneNumbe,
                        inputType: TextInputType.phone, 
                        function: (String onchngeVal) { 
                       
                         },
                      ),
                    ),
                    GestureDetector(
                      onTap: () => startSinup(context),
                      child: customContainer(
                        spaceAroundTopMargin: 15.0,
                        colorBack: mainColor,
                        ridusBL: 12.0,
                        ridusBR: 12.0,
                        ridusR: 12.0,
                        ridusl: 12.0,
                        width: 220.0,
                        height: 60.0,
                        child: textOrIndector(context),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

// this widget for contry code list
  Widget contryListWidget() {
    return CountryListPick(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      theme: CountryTheme(
        labelColor: mainColor,
        isShowFlag: true,
        isShowTitle: true,
        isShowCode: true,
        isDownIcon: true,
        showEnglishName: true,
      ),
      initialSelection: '+90',
      useUiOverlay: true,
      useSafeArea: false,
      onChanged: (CountryCode? code) {
        if (code != null) {
          contryCode = code.dialCode ?? '+90';
        }
      },
    );
  }
  // this widget for display text sinUp or circleIndector if loading start

  Widget textOrIndector(BuildContext context) {
    bool val = context.watch<BoolingVal>().isLodingAuth;
    return val
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.white,
          ))
        : customText(
            text: AppLocalizations.of(context)!.singup,
            textWeight: FontWeight.bold);
  }

  // this method for start singUp after user typed his phone number
  Future<void> startSinup(BuildContext context) async {
    bool valLoading =
        Provider.of<BoolingVal>(context, listen: false).isLodingAuth;

    if (phoneControla.text.isNotEmpty) {
      resultPhoneNimber = '$contryCode${phoneControla.text.trim()}';
      if (!valLoading) {
        context.read<BoolingVal>().loadingAuth(true);
        await authInstance
            .setLanguageCode(AppLocalizations.of(context)!.lan)
            .whenComplete(() {
          AuthSrv().authByPhoneNumber(context, resultPhoneNimber);
        });
      }
    } else {
      CustomDailog().customSnackBar(
          context: context,
          text: AppLocalizations.of(context)!.phoneIsReq,
          color: Colors.red.shade700);
    }
  }
}
