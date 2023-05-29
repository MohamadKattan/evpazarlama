/* this screen will display list of items after choces catpgry
 housing,workPlace,land,bulding,cars, else.... and sale,rent or else*/
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:evpazarlama/pages/result_all_real.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../global-methods/methods.dart';
import '../../helper/config.dart';
import '../../helper/custom_icon.dart';
import '../../helper/custom_text.dart';

class ListOfIteam extends StatelessWidget {
  final List<AdsModel> list;
  const ListOfIteam({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    // final typeOfListItem = GlobalMethods().typeOfListItem(context);
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

  Widget listOfHouseing(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          onTap: () async {
            sub2CatToDtabase = 'apart';
            final resList = await GlobalMethods().lastFilterHousing(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'residence';
            final resList = await GlobalMethods().lastFilterHousing(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'detachedHouse';
            final resList = await GlobalMethods().lastFilterHousing(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'villa';
            final resList = await GlobalMethods().lastFilterHousing(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'farmHouse';
            final resList = await GlobalMethods().lastFilterHousing(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'mansion';
            final resList = await GlobalMethods().lastFilterHousing(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'summerhouse';
            final resList = await GlobalMethods().lastFilterHousing(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'prefabricatedHouse';
            final resList = await GlobalMethods().lastFilterHousing(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'cooperative';
            final resList = await GlobalMethods().lastFilterHousing(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'gasStation';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'apart';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'villa';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'workshop';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'mall';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'buffet';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'office';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'cafe';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'warehouse';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'weddingHall';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'store';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'factory';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'fullbuilding';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
            sub2CatToDtabase = 'parking';
            final resList = await GlobalMethods().lastFilterWorkPlace(list);
            if (context.mounted) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultAds(
                  list: resList,
                );
              }));
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
              sub2CatToDtabase = listOfMotor[index];
              final resList = await GlobalMethods().lastFilterMotor(list);
              if (context.mounted) {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ResultAds(
                    list: resList,
                  );
                }));
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
      // 'Anadol',
      // 'Arora',
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
      // 'Geely',
      'Honda',
      'Hyundai',
      // 'Ikco',
      'Infiniti',
      'Jaguar',
      'Jeep',
      'Kia',
      // 'Kral',
      // 'Lada',
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
              sub2CatToDtabase = listOfCars[index];
              final resList = await GlobalMethods().lastFilterCars(list);
              if (context.mounted) {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ResultAds(
                    list: resList,
                  );
                }));
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
