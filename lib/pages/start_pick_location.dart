import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_container.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../helper/custom_positioned.dart';

class StartPickLocation extends StatelessWidget {
  const StartPickLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(text: AppLocalizations.of(context)!.pickLocation),
        ),
        drawer: customDrawer(context),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              cutomImage(
                  imagePath: 'map1.jpeg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.3),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                    text: AppLocalizations.of(context)!.choesePickLocaton,
                    textColor: Colors.white,
                    textFontSize: 20.0,
                    textWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  customSpacer(height: 15.0),
                  customContainer(
                    colorBack: mainColor,
                    spaceAroundLeftMargin: 15.0,
                    spaceAroundRightMargin: 15.0,
                    spaceAroundTop: 20.0,
                    spaceAroundBottom: 20.0,
                    ridusBL: 12.0,
                    ridusBR: 12.0,
                    ridusR: 12.0,
                    ridusl: 12.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        customIcon(
                            iconData: Icons.my_location_rounded, size: 25.0),
                        customSpacer(width: 12.0),
                        customText(
                          text:
                              AppLocalizations.of(context)!.pickCurrentLocation,
                          textFontSize: 13,
                          textWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  customSpacer(height: 15.0),
                  customContainer(
                    colorBack: mainColor,
                    spaceAroundLeftMargin: 15.0,
                    spaceAroundRightMargin: 15.0,
                    spaceAroundTop: 20.0,
                    spaceAroundBottom: 20.0,
                    ridusBL: 12.0,
                    ridusBR: 12.0,
                    ridusR: 12.0,
                    ridusl: 12.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        customIcon(iconData: Icons.map, size: 25.0),
                        customSpacer(width: 12.0),
                        customText(
                          text: AppLocalizations.of(context)!.pickLocationOnMap,
                          textFontSize: 16,
                          textWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  customSpacer(height: 15.0),
                  customContainer(
                    colorBack: mainColor,
                    spaceAroundLeftMargin: 15.0,
                    spaceAroundRightMargin: 15.0,
                    spaceAroundTop: 20.0,
                    spaceAroundBottom: 20.0,
                    ridusBL: 12.0,
                    ridusBR: 12.0,
                    ridusR: 12.0,
                    ridusl: 12.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        customIcon(iconData: Icons.edit_note_sharp, size: 25.0),
                        customSpacer(width: 12.0),
                        customText(
                          text: AppLocalizations.of(context)!.locationManaul,
                          textFontSize: 16,
                          textWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              customPositioned(
                right: 0.0,
                left: 0.0,
                bottom: 0.0,
                child: customContainer(
                  height: 60,
                  colorBack: Colors.black.withOpacity(0.4),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      customContainer(
                          colorBack: Colors.blueGrey.shade100,
                          ridusBL: 12.0,
                          ridusBR: 12.0,
                          ridusR: 12.0,
                          ridusl: 12.0,
                          width: MediaQuery.of(context).size.width * 60 / 100,
                          height: 20.0),
                      customContainer(
                        colorBack: mainColor,
                        width: MediaQuery.of(context).size.width * 30 / 100,
                        height: 20,
                        ridusBL: 12.0,
                        ridusBR: 12.0,
                        ridusR: 12.0,
                        ridusl: 12.0,
                      ),
                      customPositioned(
                          left: 0.0,
                          right: 0.0,
                          child: customText(text: '(2/5)'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
