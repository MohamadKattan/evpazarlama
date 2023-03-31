// this screen for display realSatae category

import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:evpazarlama/pages/result_all_real.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../global-methods/methods.dart';
import '../../helper/custom_icon.dart';
import '../helper/custom_container.dart';
import '../helper/custom_grid.dart';
import '../helper/custom_spacer.dart';
import 'list_of_item.dart';

class MainCategory extends StatelessWidget {
  final List<AdsModel>? list;
  const MainCategory({super.key, required this.list});

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
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 50 / 100,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount:
                          GlobalMethods().typeOfListMainCatogry(context).length,
                      itemBuilder: (context, index) {
                        if (GlobalMethods()
                            .typeOfListMainCatogry(context)
                            .isNotEmpty) {
                          return ListTile(
                            onTap: () async {
                              final res = await showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (_) {
                                    return CustomDailog()
                                        .dailogSaleRent(context);
                                  });
                              if (res == true) {
                                if (context.mounted) {
                                  setItemandnav(context, index, list);
                                }
                              }
                            },
                            minLeadingWidth: 10.0,
                            trailing: customIcon(
                                iconData: Icons.arrow_forward_ios,
                                color: mainColor),
                            title: customText(
                                text: GlobalMethods()
                                    .typeOfListMainCatogry(context)[index],
                                textAlign: TextAlign.justify,
                                textColor: mainColor,
                                textFontSize: 18.0,
                                textWeight: FontWeight.bold),
                          );
                        } else {
                          return const CircularProgressIndicator(
                              color: mainColor);
                        }
                      },
                    ),
                  ),
                  customSpacer(height: 20.0),
                  // titel all ads
                  customContainer(
                    spaceAroundTopMargin: 20.0,
                    borderColor: const Color.fromARGB(255, 161, 204, 226),
                    borderWidth: 1.0,
                    colorBack: const Color.fromARGB(255, 230, 177, 160),
                    child: customText(
                        text: AppLocalizations.of(context)!.allAdsVitrin,
                        textAlign: TextAlign.justify,
                        textWeight: FontWeight.bold,
                        textColor: mainColor),
                  ),
                  list!.isEmpty
                      ? Container(
                          color: Colors.blueGrey.shade100,
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: customText(
                                    text: AppLocalizations.of(context)!.noFound,
                                    textColor: mainColor),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                  color: mainColor,
                                ),
                              )
                            ],
                          ),
                        )
                      : CustomGrid().customGrid(context, list!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // this method for check if will nav to specifc screen or show dailog rent sale list
  Future<void> setItemandnav(
      BuildContext context, int index, List<AdsModel>? list) async {
    int length = GlobalMethods().typeOfListMainCatogry(context).length;
    if (length == 5) {
      //Estata
      switch (index) {
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultAds(
              list: list!,
            );
          }));
          break;
        case 1:
          listOfItemVal = 0;
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ListOfIteam(list: list!);
          }));
          break;
        case 2:
          listOfItemVal = 1;
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ListOfIteam(list: list!);
          }));
          break;
        case 3:
          listOfItemVal = 20;
          sub2CatToDtabase = 'land';
          final resList = await GlobalMethods().lastFilterLand(list);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        case 4:
          listOfItemVal = 21;
          sub2CatToDtabase = 'building';
          final resList = await GlobalMethods().lastfilterBuilding(list!);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        default:
          null;
          break;
      }
    } else if (length == 7) {
      //vehicle
      switch (index) {
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultAds(
              list: list!,
            );
          }));
          break;
        case 1:
          listOfItemVal = 2;
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ListOfIteam(list: list!);
          }));

          break;
        case 2:
          listOfItemVal = 3;
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ListOfIteam(list: list!);
          }));

          break;
        case 3:
          listOfItemVal = 4;
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ListOfIteam(list: list!);
          }));

          break;
        case 4:
          listOfItemVal = 5;
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ListOfIteam(list: list!);
          }));

          break;
        case 5:
          listOfItemVal = 6;
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ListOfIteam(list: list!);
          }));
          break;
        case 6:
          listOfItemVal = 7;
          final resList = await GlobalMethods().lastFilterDamgedCar(list!);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }
          break;
        default:
          null;
          break;
      }
    } else if (length == 6) {
      //hotels
      switch (index) {
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultAds(
              list: list!,
            );
          }));
          break;
        case 1:
          listOfItemVal = 8;
          final resList = await GlobalMethods().lastFilterHotels(list!);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }

          break;
        case 2:
          listOfItemVal = 9;
          final resList = await GlobalMethods().lastFilterHotels(list!);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }

          break;
        case 3:
          listOfItemVal = 10;
          final resList = await GlobalMethods().lastFilterHotels(list!);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }

          break;
        case 4:
          listOfItemVal = 11;
          final resList = await GlobalMethods().lastFilterHotels(list!);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }

          break;
        case 5:
          listOfItemVal = 12;
          final resList = await GlobalMethods().lastFilterHotels(list!);
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ResultAds(
                list: resList,
              );
            }));
          }

          break;
      }
    } else {
      return;
    }
  }
}
