/* this screen will display list of items after choces catpgry
 housing,workPlace,land,bulding,cars, else.... and sale,rent or else*/
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:evpazarlama/pages/result_all_real.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../global-methods/methods.dart';
import '../../helper/config.dart';
import '../../helper/custom_icon.dart';
import '../../helper/custom_text.dart';
import '../state-maneg/string_val.dart';

class ListOfIteam extends StatelessWidget {
  final List<AdsModel> list;
  const ListOfIteam({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final typeOfListItem = GlobalMethods().typeOfListItem(context);
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
          body: typeOfListItem.isNotEmpty
              ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: typeOfListItem.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    onTap: () {
                      context
                          .read<StringVal>()
                          .updateSubCatogryVal(typeOfListItem[index]);
                      setItemandnav(context, index);
                    },
                    minLeadingWidth: 10.0,
                    leading: listOfItemVal > 2
                        ? cutomImageIcon(
                            imagePath:
                                '${GlobalMethods().typeOfListItem(context)[index]}.png')
                        : const SizedBox(),
                    trailing: customIcon(
                        iconData: Icons.arrow_forward_ios,
                        color: mainColor),
                    title: customText(
                        text: GlobalMethods()
                            .typeOfListItem(context)[index],
                        textAlign: TextAlign.justify,
                        textFontSize: 18.0,
                        textColor: mainColor,
                        textWeight: FontWeight.bold),
                  );
                },
              )
              : const CircularProgressIndicator(color: mainColor)),
    );
  }

  Future<void> setItemandnav(BuildContext context, int index) async {
    final typeOfListItem = GlobalMethods().typeOfListItem(context);
    if (typeOfListItem.length == 9) {
      // houseing item
      switch (index) {
        case 0:
          sub2CatToDtabase = 'apart';
          final resList = await GlobalMethods().lastFilterHousing(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 1:
          sub2CatToDtabase = 'residence';
          final resList = await GlobalMethods().lastFilterHousing(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 2:
          sub2CatToDtabase = 'detachedHouse';
          final resList = await GlobalMethods().lastFilterHousing(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 3:
          sub2CatToDtabase = 'villa';
          final resList = await GlobalMethods().lastFilterHousing(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 4:
          sub2CatToDtabase = 'farmHouse';
          final resList = await GlobalMethods().lastFilterHousing(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 5:
          sub2CatToDtabase = 'mansion';
          final resList = await GlobalMethods().lastFilterHousing(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 6:
          sub2CatToDtabase = 'summerhouse';
          final resList = await GlobalMethods().lastFilterHousing(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 7:
          sub2CatToDtabase = 'prefabricatedHouse';
          final resList = await GlobalMethods().lastFilterHousing(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 8:
          sub2CatToDtabase = 'cooperative';
          final resList = await GlobalMethods().lastFilterHousing(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        default:
          sub2CatToDtabase = 'apart';
          final resList = await GlobalMethods().lastFilterHousing(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
      }
    } else if (typeOfListItem.length == 14) {
      //workPlace item
      switch (index) {
        case 0:
          sub2CatToDtabase = 'gasStation';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 1:
          sub2CatToDtabase = 'apart';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 2:
          sub2CatToDtabase = 'villa';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 3:
          sub2CatToDtabase = 'workshop';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 4:
          sub2CatToDtabase = 'mall';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 5:
          sub2CatToDtabase = 'buffet';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 6:
          sub2CatToDtabase = 'office';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 7:
          sub2CatToDtabase = 'cafe';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 8:
          sub2CatToDtabase = 'warehouse';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 9:
          sub2CatToDtabase = 'weddingHall';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 10:
          sub2CatToDtabase = 'store';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 11:
          sub2CatToDtabase = 'factory';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 12:
          sub2CatToDtabase = 'fullbuilding';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 13:
          sub2CatToDtabase = 'parking';
          final resList = await GlobalMethods().lastFilterWorkPlace(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
      }
    } else if (typeOfListItem.length == 38) {
      // moterCicle
      sub2CatToDtabase = context.read<StringVal>().subCategoryValue ?? 'null';
      final resList = await GlobalMethods().lastFilterMotor(list);
      if (context.mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return ResultAds(
            list: resList,
          );
        }));
      }
    } else if (typeOfListItem.length == 57) {
      // cars
      sub2CatToDtabase = context.read<StringVal>().subCategoryValue ?? 'null';
      final resList = await GlobalMethods().lastFilterCars(list);
      if (context.mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return ResultAds(
            list: resList,
          );
        }));
      }
    }
  }
}
