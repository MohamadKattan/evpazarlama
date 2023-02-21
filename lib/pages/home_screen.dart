import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/custom-widgets/list_home_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
            drawer: customDrawer(context),
            appBar: AppBar(
              backgroundColor: mainColor,
              title: customText(text: "evpazarlama.com", textColor: defColor),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => null,
                    child: Row(
                      children: [
                        customText(
                          text: "New ads",
                          textFontSize: 14.0,
                        ),
                        customSpacer(width: 8.0),
                        cutomImageIcon(
                            imagePath: 'plus.png', width: 20.0, height: 20.0),
                      ],
                    ),
                  ),
                )
              ],
            ),
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                mainItemsHomeDrawer(context),
              ],
            )),
      ),
    );
  }
}
