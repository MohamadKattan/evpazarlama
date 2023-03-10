import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_container.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: mainColor,
            appBar: AppBar(
                title: customText(
                    text: AppLocalizations.of(context)!.myProfile,
                    textWeight: FontWeight.bold),
                backgroundColor: mainColor,
                centerTitle: false,
                elevation: 0.0),
            drawer: customDrawer(context),
            body: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(children: [
                // user info
                customContainer(
                  alignment: Alignment.topLeft,
                  colorBack: Colors.white,
                  spaceAroundTopMargin: 10.0,
                  spaceAroundLeftMargin: 10.0,
                  spaceAroundRightMargin: 10.0,
                  ridusBL: 12.0,
                  ridusBR: 12.0,
                  ridusR: 12.0,
                  ridusl: 12.0,
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 0.0,
                        minVerticalPadding: 0.0,
                        leading: userInfoProfile?.userImage != 'null'
                            ? CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(
                                    userInfoProfile?.userImage ?? 'null'),
                              )
                            : CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.grey,
                                child: customIcon(iconData: Icons.person),
                              ),
                        title: customText(
                            text: userInfoProfile?.userName ?? 'null',
                            textColor: mainColor,
                            textAlign: TextAlign.justify),
                        subtitle: customText(
                            text:
                                '(${userInfoProfile?.userAccountType ?? 'null'})',
                            textColor: Colors.grey,
                            textFontSize: 12.0,
                            textAlign: TextAlign.justify),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 0.0,
                        minVerticalPadding: 0.0,
                        leading: customIcon(
                            iconData: Icons.mail,
                            color: Colors.deepOrange.shade100,
                            size: 30),
                        title: customText(
                            text: userInfoProfile?.userMail ?? 'null',
                            textColor: mainColor,
                            textAlign: TextAlign.justify),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 0.0,
                        minVerticalPadding: 0.0,
                        leading: customIcon(
                            iconData: Icons.phone_android,
                            color: Colors.blueGrey.shade200,
                            size: 30.0),
                        title: customText(
                            text: userInfoProfile?.userPhone ?? 'null',
                            textColor: mainColor,
                            textAlign: TextAlign.justify),
                      )
                    ],
                  ),
                ),
                // ads manger
                customSpacer(height: 15.0),
                customContainer(
                  alignment: Alignment.center,
                  colorBack: Colors.white,
                  spaceAroundTopMargin: 10.0,
                  spaceAroundLeftMargin: 10.0,
                  spaceAroundRightMargin: 10.0,
                  ridusBL: 12.0,
                  ridusBR: 12.0,
                  ridusR: 12.0,
                  ridusl: 12.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customText(
                          text: AppLocalizations.of(context)!.adsManger,
                          textColor: mainColor),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 0.0,
                        minVerticalPadding: 0.0,
                        leading: customIcon(
                            iconData: Icons.done_all,
                            color: Colors.greenAccent.shade200,
                            size: 30),
                        trailing: customIcon(
                            iconData: Icons.arrow_forward_ios,
                            color: mainColor),
                        title: customText(
                            text: AppLocalizations.of(context)!.compliteAds,
                            textColor: mainColor,
                            textAlign: TextAlign.justify),
                        subtitle: customText(
                            text:
                                '(${AppLocalizations.of(context)!.subCompliteAds})',
                            textColor: Colors.grey,
                            textAlign: TextAlign.justify,
                            textFontSize: 14.0),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 0.0,
                        minVerticalPadding: 0.0,
                        leading: customIcon(
                            iconData: Icons.do_not_disturb_alt_outlined,
                            color: Colors.red.shade200,
                            size: 30),
                        trailing: customIcon(
                            iconData: Icons.arrow_forward_ios,
                            color: mainColor),
                        title: customText(
                            text: AppLocalizations.of(context)!.notCompliteAds,
                            textColor: mainColor,
                            textAlign: TextAlign.justify),
                        subtitle: customText(
                            text:
                                '(${AppLocalizations.of(context)!.subNotCompliteAds})',
                            textColor: Colors.grey,
                            textAlign: TextAlign.justify,
                            textFontSize: 14.0),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 0.0,
                        minVerticalPadding: 0.0,
                        leading: customIcon(
                            iconData: Icons.star,
                            color: Colors.amber.shade200,
                            size: 30),
                        trailing: customIcon(
                            iconData: Icons.arrow_forward_ios,
                            color: mainColor),
                        title: customText(
                            text: AppLocalizations.of(context)!.fievort,
                            textColor: mainColor,
                            textAlign: TextAlign.justify),
                        subtitle: customText(
                            text:
                                '(${AppLocalizations.of(context)!.subfievort})',
                            textColor: Colors.grey,
                            textAlign: TextAlign.justify,
                            textFontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                // messgaes
                customSpacer(height: 15.0),
                customContainer(
                  alignment: Alignment.center,
                  colorBack: Colors.white,
                  spaceAroundTopMargin: 10.0,
                  spaceAroundLeftMargin: 10.0,
                  spaceAroundRightMargin: 10.0,
                  ridusBL: 12.0,
                  ridusBR: 12.0,
                  ridusR: 12.0,
                  ridusl: 12.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customText(
                          text: AppLocalizations.of(context)!.messagesNotif,
                          textColor: mainColor),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 0.0,
                        minVerticalPadding: 0.0,
                        leading: customIcon(
                            iconData: Icons.chat,
                            color: Colors.brown.shade100,
                            size: 30),
                        trailing: customIcon(
                            iconData: Icons.arrow_forward_ios,
                            color: mainColor),
                        title: customText(
                            text: AppLocalizations.of(context)!.myMessages,
                            textColor: mainColor,
                            textAlign: TextAlign.justify),
                        subtitle: customText(
                            text:
                                '(${AppLocalizations.of(context)!.submyMessages})',
                            textColor: Colors.grey,
                            textAlign: TextAlign.justify,
                            textFontSize: 14.0),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 0.0,
                        minVerticalPadding: 0.0,
                        leading: customIcon(
                            iconData: Icons.notifications,
                            color: Colors.grey,
                            size: 30),
                        trailing: customIcon(
                            iconData: Icons.arrow_forward_ios,
                            color: mainColor),
                        title: customText(
                            text: AppLocalizations.of(context)!.myNotifictions,
                            textColor: mainColor,
                            textAlign: TextAlign.justify),
                        subtitle: customText(
                            text:
                                '(${AppLocalizations.of(context)!.subMyNotifictions})',
                            textColor: Colors.grey,
                            textAlign: TextAlign.justify,
                            textFontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                // SingOut
                customSpacer(height: 25.0),
                GestureDetector(
                  onTap: () async {
                    await authInstance.signOut().whenComplete(() {
                      GlobalMethods().pushReplaceToNewScreen(
                          context: context, routeName: toSplash);
                    });
                  },
                  child: customContainer(
                      spaceAroundRightMargin: 10.0,
                      spaceAroundLeftMargin: 10.0,
                      ridusBL: 12.0,
                      ridusBR: 12.0,
                      ridusR: 12.0,
                      ridusl: 12.0,
                      colorBack: Colors.red.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: customText(
                            text: AppLocalizations.of(context)!.signOut,
                            textColor: Colors.white,
                            textFontSize: 20.0,
                            textWeight: FontWeight.bold,
                            textAlign: TextAlign.center),
                      )),
                ),
                customSpacer(height: 25.0),
              ]),
            )));
  }
}
