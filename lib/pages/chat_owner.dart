import 'package:evpazarlama/client-srv/database_srv.dart';
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_text_field.dart';
import 'package:evpazarlama/state-maneg/booling_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../helper/custom_dailog.dart';
import '../helper/custom_text.dart';
import 'one_ad_details.dart';

class ChatOwner extends StatelessWidget {
  final String reciverId;
  final String adsNumber;
  final String token;
  final bool isCanPop;
  const ChatOwner(
      {super.key,
      required this.reciverId,
      required this.adsNumber,
      required this.isCanPop,
      required this.token});
  static TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(242, 196, 233, 247),
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(text: AppLocalizations.of(context)!.chatOnAd),
          actions: [
            GestureDetector(
              onTap: () {
                searachOneAd(adsNumber, context);
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: secondColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: customText(
                    text: AppLocalizations.of(context)!.goToAD,
                    textWeight: FontWeight.bold,
                    textFontSize: 14.0,
                    textAlign: TextAlign.center),
              ),
            )
          ],
        ),
        drawer: customDrawer(context),
        body: Stack(
          children: [
            DataBaseSrv().streamChatList(reciverId, context),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                color: mainColor,
                child: customTextFailed(
                    labelColor: defColor,
                    lable: AppLocalizations.of(context)!.typeAmessage,
                    hintText: AppLocalizations.of(context)!.typeAmessage,
                    controller: chatController,
                    function: (String val) {
                      if (val.isNotEmpty) {
                        context.read<BoolingVal>().updateChatBtn(true);
                      } else {
                        context.read<BoolingVal>().updateChatBtn(false);
                      }
                    }),
              ),
            ),
            Consumer<BoolingVal>(
              builder: (context, value, child) {
                return Align(
                  alignment: AppLocalizations.of(context)!.lan.contains('ar')
                      ? Alignment.bottomLeft
                      : Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () async {
                      startChat();
                    },
                    child: AnimatedContainer(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: value.buttonChat ? secondColor : mainColor,
                          borderRadius: BorderRadius.circular(50.0)),
                      duration: const Duration(milliseconds: 800),
                      child: customIcon(
                          iconData: Icons.send,
                          color: value.buttonChat ? defColor : mainColor),
                    ),
                  ),
                );
              },
            ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     color: Colors.black.withOpacity(0.3),
            //     child: GestureDetector(
            //       onTap: () {
            //         searachOneAd(adsNumber, context);
            //       },
            //       child: Container(
            //         margin: const EdgeInsets.only(
            //             left: 60.0, right: 60.0, top: 12.0, bottom: 12.0),
            //         padding: const EdgeInsets.all(12.0),
            //         decoration: BoxDecoration(
            //           color: mainColor,
            //           borderRadius: BorderRadius.circular(8.0),
            //         ),
            //         child:
            //             customText(text: AppLocalizations.of(context)!.goToAD),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // this method for start chat
  Future<void> startChat() async {
    if (chatController.text.isNotEmpty) {
      await DataBaseSrv()
          .sendAnMesaage(reciverId, chatController.text, adsNumber, token);
      if (!token.contains('null')) {
        GlobalMethods()
            .postNotificationFcm(token: token, text: chatController.text);
      }
      chatController.clear();
    }
  }
  Future searachOneAd(String adsNumber, BuildContext context) async {
    if (!isCanPop) {
      for (var i = 0; i < listGenarlAds.length; i++) {
        if (listGenarlAds[i].adsNumber!.contains(adsNumber)) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return OneAdsDetails(adsModel: listGenarlAds[i]);
          }));
          break;
        } else {
          if (i + 1 == listGenarlAds.length) {
            CustomDailog().customSnackBar(
                context: context, text: AppLocalizations.of(context)!.noFound);
          }
        }
      }
    } else {
      Navigator.pop(context);
    }
  }
}
