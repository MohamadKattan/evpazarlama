// for display list of item while start push ads
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../custom-widgets/custom_drawer.dart';
import '../global-methods/methods.dart';
import '../helper/config.dart';
import '../helper/custom_icon.dart';
import '../helper/custom_text.dart';
import '../state-maneg/string_val.dart';

class AdsListOfItem extends StatelessWidget {
  const AdsListOfItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            centerTitle: false,
            title: customText(
              textAlign: TextAlign.start,
              text: AppLocalizations.of(context)!.categorySelection,
            ),
          ),
          drawer: customDrawer(context),
          body: listOfItemVal == 0
              ? listOfHouseing(context)
              : listOfItemVal == 1
                  ? listOFWorkPlace(context)
                  : listOfItemVal == 2
                      ? listOfMotors(context)
                      : listOfCars(context)),
    );
  }

  Future updataStatusSubCatogry(BuildContext context, String val) async {
    context.read<StringVal>().updateSubCatogryVal(val);
  }

  Widget listOfHouseing(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.apart1);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsHoseing);
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.apart1,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.residence);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsHoseing);
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.residence,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.detachedHouse);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsHoseing);
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.detachedHouse,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.villa);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsHoseing);
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.villa,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.farmHouse);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsHoseing);
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.farmHouse,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.mansion);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsHoseing);
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.mansion,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.residence);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsHoseing);
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.mansion,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.prefabricatedHouse);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsHoseing);
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.prefabricatedHouse,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.cooperative);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsHoseing);
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.cooperative,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget listOFWorkPlace(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.gasStation);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.gasStation,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.apart1);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.apart1,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.villa);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.villa,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.workshop);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.workshop,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.mall);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.mall,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.buffet);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.buffet,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.office);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.office,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.cafe);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.cafe,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.warehouse);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.warehouse,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.weddingHall);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.weddingHall,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.store);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.store,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.factory);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.factory,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.fullbuilding);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.fullbuilding,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            await updataStatusSubCatogry(
                context, AppLocalizations.of(context)!.parking);
            if (context.mounted) {
              GlobalMethods().pushToNewScreen(
                  context: context, routeName: toAdsDetailsWorkPlace);
            }
          },
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.parking,
              textAlign: TextAlign.justify,
              textFontSize: 18.0,
              textColor: mainColor,
              textWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget listOfMotors(BuildContext context) {
    List<String> listOfMotor = [
      'Abush',
      'Altai',
      'Apachi',
      'Aprillia',
      'Arora',
      'Asya',
      'Bajaj',
      'Baotain',
      'Belderia',
      'Beta',
      'Bianchi',
      'Bimota',
      'Bisan',
      'BMW',
      'BRP',
      'Borelli',
      'Brixton',
      'BuMoto',
      'CFMoto',
      'Cheeta',
      'Darlim',
      'Dorado',
      'Ducati',
      'Falcon',
      'Gas Gas',
      'Haojue',
      'Harley',
      'Hero',
      'Honda',
      'Kanuni',
      'Kawasaki',
      'KTM',
      'kIA',
      'Kuba',
      'Kymco',
      'Mondial',
      'Motolux',
      'Yamaha',
    ];
    return ListView.builder(
        itemBuilder: (_, index) {
          return ListTile(
            onTap: () async {
              await updataStatusSubCatogry(context, listOfMotor[index]);
              if (context.mounted) {
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsDetailsVehicles);
              }
            },
            trailing:
                customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
            title: customText(
                text: listOfMotor[index],
                textAlign: TextAlign.justify,
                textFontSize: 18.0,
                textColor: mainColor,
                textWeight: FontWeight.bold),
          );
        },
        itemCount: listOfMotor.length);
  }

  Widget listOfCars(BuildContext context) {
    List<String> listOfCars = [
      'Aion',
      'AlfaRomeo',
      'AstonMartin',
      'Audi',
      'Bentley',
      'BMW',
      'Bugatti',
      'Buick',
      'Cadilac',
      'Chery',
      'Chevrolet',
      'Chrysler',
      'Citroen',
      'Dacia',
      'Daewoo',
      'Daihatsu',
      'Dodge',
      'Ferrari',
      'Fiat',
      'Fisker',
      'Ford',
      'GMC',
      'Honda',
      'Hyundai',
      'Infiniti',
      'Jaguar',
      'Jeep',
      'Kia',
      'Lamborghini',
      'Land-Rover',
      'Leapmotor',
      'Lexus',
      'Lincoin',
      'Lotus',
      'Maserati',
      'Mazda',
      'Mclaren',
      'Mercedes-Benz',
      'Mercury',
      'Mini-cooper',
      'Mitsubishi',
      'Nissan',
      'Opel',
      'Peugeot',
      'Porsche',
      'Proton',
      'Renault',
      'Rolls-Royce',
      'Seat',
      'Skoda',
      'Smart',
      'Subaru',
      'Suzuki',
      'Tesla',
      'Toyota',
      'Volkswagen',
      'Volvo',
    ];
    return ListView.builder(
        itemCount: listOfCars.length,
        itemBuilder: (_, index) {
          return ListTile(
            onTap: () async {
              await updataStatusSubCatogry(context, listOfCars[index]);
              if (context.mounted) {
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsDetailsVehicles);
              }
            },
            minLeadingWidth: 10.0,
            leading: cutomImageIcon(imagePath: '${listOfCars[index]}.png'),
            trailing:
                customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
            title: customText(
                text: listOfCars[index],
                textAlign: TextAlign.justify,
                textFontSize: 18.0,
                textColor: mainColor,
                textWeight: FontWeight.bold),
          );
        });
  }
}
