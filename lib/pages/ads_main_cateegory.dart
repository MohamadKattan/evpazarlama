import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../helper/custom_dailog.dart';
import '../helper/custom_icon.dart';

class AdsMainCategory extends StatelessWidget {
  const AdsMainCategory({super.key});

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
        body: mainCatogry == 0
            ? realEstateList(context)
            : mainCatogry == 1
                ? vehiclesList(context)
                : mainCatogry == 2
                    ? hotelList(context)
                    : const SizedBox(),
      ),
    );
  }

  Widget realEstateList(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
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
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsListOfItems);
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
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsListOfItems);
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
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              if (context.mounted) {
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsDetailsLand);
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
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              if (context.mounted) {
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsDetailsBulding);
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

  Widget vehiclesList(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
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
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsListOfItems);
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
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsListOfItems);
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
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsListOfItems);
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
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsListOfItems);
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
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsListOfItems);
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
            bool? val = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDailog().dailogSaleRent(context);
                });
            if (val ?? false) {
              if (context.mounted) {
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsListOfItems);
              }
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

  Widget hotelList(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
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
              if (context.mounted) {
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsDetailsHotels);
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
              if (context.mounted) {
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsDetailsHotels);
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
              if (context.mounted) {
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsDetailsHotels);
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
              if (context.mounted) {
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsDetailsHotels);
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
              if (context.mounted) {
                GlobalMethods().pushToNewScreen(
                    context: context, routeName: toAdsDetailsHotels);
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



//================old code =================================
// class AdsMainCategory extends StatelessWidget {
//   const AdsMainCategory({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List list = GlobalMethods().listCatogryAddNewAds(context);
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
//         body: ListView.builder(
//           padding: EdgeInsets.zero,
//           itemCount: list.length,
//           itemBuilder: (context, index) {
//             if (list.isNotEmpty) {
//               return ListTile(
//                 onTap: () {
//                   openDailog(context, index);
//                 },
//                 minVerticalPadding: 20.0,
//                 trailing: customIcon(
//                     iconData: Icons.arrow_forward_ios, color: mainColor),
//                 title: customText(
//                     text: list[index],
//                     textAlign: TextAlign.justify,
//                     textColor: mainColor,
//                     textFontSize: 18.0,
//                     textWeight: FontWeight.bold),
//               );
//             } else {
//               return const Center(
//                   child: CircularProgressIndicator(
//                 color: mainColor,
//               ));
//             }
//           },
//         ),
//       ),
//     );
//   }

//   // this method for check if will nav to specifc screen or show dailog rent sale list
//   void openDailog(BuildContext context, int index) async {
//     int length = GlobalMethods().listCatogryAddNewAds(context).length;
//     final list4Item = [
//       AppLocalizations.of(context)!.sale,
//       AppLocalizations.of(context)!.rent,
//       AppLocalizations.of(context)!.daylyRent,
//       AppLocalizations.of(context)!.transferSale,
//     ];
//     final list2Item = [
//       AppLocalizations.of(context)!.sale,
//       AppLocalizations.of(context)!.rent
//     ];
//     if (length == 4) {
//       //main Estata
//       switch (index) {
//         case 0:
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list4Item);
//               });
//           listOfItemVal = 0; //houseing
//           break;
//         case 1:
//           listOfItemVal = 1; //workplace
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });
//           break;
//         case 2:
//           listOfItemVal = 20; //lands
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });
//           break;
//         case 3:
//           listOfItemVal = 21; //building
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });
//           break;
//         default:
//           null;
//           break;
//       }
//     } else if (length == 6) {
//       // main vehicle
//       switch (index) {
//         case 0:
//           listOfItemVal = 2; //motor
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });
//           break;
//         case 1:
//           listOfItemVal = 3; //car
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });
//           break;
//         case 2:
//           listOfItemVal = 4; // minBuse
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });
//           break;
//         case 3:
//           listOfItemVal = 5; //electric car
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });
//           break;
//         case 4:
//           listOfItemVal = 6; // comricle car
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });
//           break;
//         case 5:
//           //damged car
//           listOfItemVal = 7;
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });
//           break;
//         default:
//           null;
//           break;
//       }
//     } else if (length == 5) {
//       //main hotels
//       switch (index) {
//         case 0:
//           listOfItemVal = 8; // hotels
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });

//           break;
//         case 1:
//           listOfItemVal = 9; // resorts
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });
//           break;
//         case 2:
//           listOfItemVal = 10; // touristCottages
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });
//           break;
//         case 3:
//           listOfItemVal = 11; //hotelAppartments
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });
//           break;
//         case 4:
//           listOfItemVal = 12; //touristVillas
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) {
//                 return CustomDailog().saleRentElseAdsNewAdd(context, list2Item);
//               });
//           break;
//         default:
//           null;
//           break;
//       }
//     } else {
//       return;
//     }
//   }
// }
