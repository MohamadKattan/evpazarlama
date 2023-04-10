// this screen for display realSatae category

import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:evpazarlama/pages/list_of_item.dart';
import 'package:evpazarlama/pages/result_all_real.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../global-methods/methods.dart';
import '../helper/custom_container.dart';
import '../helper/custom_dailog.dart';
import '../helper/custom_grid.dart';
import '../helper/custom_icon.dart';
import '../helper/custom_spacer.dart';

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
        body: ListView(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 50 / 100,
                child: mainCatogry == 0
                    ? realEstateList(context, list!)
                    : mainCatogry == 1
                        ? vehiclesList(context, list!)
                        : mainCatogry == 2
                            ? hotelList(context, list!)
                            : const SizedBox()),
            customSpacer(height: 20.0),
            // titel all ads
            list!.isEmpty
                ? const SizedBox()
                : customContainer(
                    spaceAroundTopMargin: 20.0,
                    borderColor: const Color.fromARGB(255, 161, 204, 226),
                    borderWidth: 1.0,
                    colorBack: const Color.fromARGB(255, 247, 214, 203),
                    child: customText(
                        text: AppLocalizations.of(context)!.allAdsVitrin,
                        textAlign: TextAlign.justify,
                        textWeight: FontWeight.bold,
                        textColor: mainColor),
                  ),
            list!.isEmpty
                ? const SizedBox()
                : CustomGrid().customGrid(context, list!),
          ],
        ),
      ),
    );
  }

  Widget realEstateList(BuildContext context, List<AdsModel> list) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return ResultAds(
                    list: list,
                  );
                },
              ),
            );
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.allReal,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 0;
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ListOfIteam(list: list);
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.allHome,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 1;
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ListOfIteam(list: list);
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.workPlace,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 20;
            sub2CatToDtabase = 'land';
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              final resList = await GlobalMethods().lastFilterLand(list);
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ResultAds(
                        list: resList,
                      );
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.land,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 21;
            sub2CatToDtabase = 'building';
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              final resList = await GlobalMethods().lastfilterBuilding(list);
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ResultAds(
                        list: resList,
                      );
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.building,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget vehiclesList(BuildContext context, List<AdsModel> list) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return ResultAds(
                    list: list,
                  );
                },
              ),
            );
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.allVehicle,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 2;
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ListOfIteam(list: list);
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.motorCycle,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 3;
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ListOfIteam(list: list);
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.cars,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 4;
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ListOfIteam(list: list);
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.minBus,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 5;
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ListOfIteam(list: list);
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.electricCars,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 6;
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ListOfIteam(list: list);
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.commercialCar,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 7;
            final resList = await GlobalMethods().lastFilterDamgedCar(list);
            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return ResultAds(
                      list: resList,
                    );
                  },
                ),
              );
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.damagedVehicles,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget hotelList(BuildContext context, List<AdsModel> list) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return ResultAds(
                    list: list,
                  );
                },
              ),
            );
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.allHotels,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 8;
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              final resList = await GlobalMethods().lastFilterHotels(list);
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ResultAds(
                        list: resList,
                      );
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.hotel,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 9;
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              final resList = await GlobalMethods().lastFilterHotels(list);
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ResultAds(
                        list: resList,
                      );
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.resorts,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 10;
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              final resList = await GlobalMethods().lastFilterHotels(list);
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ResultAds(
                        list: resList,
                      );
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.touristCottages,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 11;
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              final resList = await GlobalMethods().lastFilterHotels(list);
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ResultAds(
                        list: resList,
                      );
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.hotelAppartments,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        ),
        ListTile(
          onTap: () async {
            listOfItemVal = 12;
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              final resList = await GlobalMethods().lastFilterHotels(list);
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ResultAds(
                        list: resList,
                      );
                    },
                  ),
                );
              }
            }
          },
          minLeadingWidth: 10.0,
          trailing:
              customIcon(iconData: Icons.arrow_forward_ios, color: mainColor),
          title: customText(
              text: AppLocalizations.of(context)!.touristVillas,
              textAlign: TextAlign.justify,
              textColor: mainColor,
              textFontSize: 18.0,
              textWeight: FontWeight.bold),
        )
      ],
    );
  }
}

//=====================old code===================
// class MainCategory extends StatelessWidget {
//   final List<AdsModel>? list;
//   const MainCategory({super.key, required this.list});

//   @override
//   Widget build(BuildContext context) {
//     final listMainCatogry = GlobalMethods().typeOfListMainCatogry(context);
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: mainColor,
//           centerTitle: false,
//           title: customText(
//             textAlign: TextAlign.start,
//             text: AppLocalizations.of(context)!.categorySelection,
//           ),
//         ),
//         drawer: customDrawer(context),
//         body: Stack(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height,
//               child: ListView(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 50 / 100,
//                     child: ListView.builder(
//                       padding: EdgeInsets.zero,
//                       itemCount: listMainCatogry.length,
//                       itemBuilder: (context, index) {
//                         if (listMainCatogry.isNotEmpty) {
//                           return ListTile(
//                             onTap: () async {
//                               if (index == 0) {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (_) {
//                                       return ResultAds(
//                                         list: list!,
//                                       );
//                                     },
//                                   ),
//                                 );
//                               } else {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (_) {
//                                       return SaleReantChose(
//                                           index: index,
//                                           list: list,
//                                           length: listMainCatogry.length);
//                                     },
//                                   ),
//                                 );
//                               }

//                               // final res = await showDialog(
//                               //     context: context,
//                               //     barrierDismissible: false,
//                               //     builder: (_) {
//                               //       return CustomDailog()
//                               //           .dailogSaleRent(context);
//                               //     });
//                               // if (res == true) {
//                               //   if (context.mounted) {
//                               //     setItemandnav(context, index, list);
//                               //   }
//                               // }
//                             },
//                             minLeadingWidth: 10.0,
//                             trailing: customIcon(
//                                 iconData: Icons.arrow_forward_ios,
//                                 color: mainColor),
//                             title: customText(
//                                 text: GlobalMethods()
//                                     .typeOfListMainCatogry(context)[index],
//                                 textAlign: TextAlign.justify,
//                                 textColor: mainColor,
//                                 textFontSize: 18.0,
//                                 textWeight: FontWeight.bold),
//                           );
//                         } else {
//                           return const CircularProgressIndicator(
//                               color: mainColor);
//                         }
//                       },
//                     ),
//                   ),
//                   customSpacer(height: 20.0),
//                   // titel all ads
//                   list!.isEmpty
//                       ? const SizedBox()
//                       : customContainer(
//                           spaceAroundTopMargin: 20.0,
//                           borderColor: const Color.fromARGB(255, 161, 204, 226),
//                           borderWidth: 1.0,
//                           colorBack: const Color.fromARGB(255, 247, 214, 203),
//                           child: customText(
//                               text: AppLocalizations.of(context)!.allAdsVitrin,
//                               textAlign: TextAlign.justify,
//                               textWeight: FontWeight.bold,
//                               textColor: mainColor),
//                         ),
//                   list!.isEmpty
//                       ? const SizedBox()
//                       : CustomGrid().customGrid(context, list!),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

