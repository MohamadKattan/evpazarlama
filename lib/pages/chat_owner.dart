import 'package:evpazarlama/client-srv/database_srv.dart';
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_text_field.dart';
import 'package:evpazarlama/state-maneg/booling_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../helper/custom_text.dart';

class ChatOwner extends StatelessWidget {
  final String reciverId;
  final String adsNumber;
  const ChatOwner(
      {super.key, required this.reciverId, required this.adsNumber});
  static TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(242, 196, 233, 247),
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(text: AppLocalizations.of(context)!.myMessages),
        ),
        drawer: customDrawer(context),
        body: Stack(
          children: [
            DataBaseSrv().chatList(reciverId, context),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                color: mainColor,
                child: customTextFailed(
                    labelColor: defColor,
                    lable: 'type a massage',
                    hintText: 'type a massage',
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
                  alignment: Alignment.bottomRight,
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 800),
                    turns: value.buttonChat ? 0.90 : 0.0,
                    child: GestureDetector(
                      onTap: () async {
                        await DataBaseSrv()
                            .sendAnMesaage(reciverId, chatController.text,adsNumber);
                        chatController.clear();
                        FocusManager.instance.primaryFocus?.unfocus();
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
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
