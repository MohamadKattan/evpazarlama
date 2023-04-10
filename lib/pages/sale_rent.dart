// import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
// import 'package:evpazarlama/pages/result_all_real.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import '../global-methods/methods.dart';
// import '../helper/config.dart';
// import '../helper/custom_icon.dart';
// import '../helper/custom_text.dart';
// import '../models/ads_model.dart';
// import 'list_of_item.dart';

// class SaleReantChose extends StatelessWidget {
//   final int? index;
//   final List<AdsModel>? list;
//   final int? length; //ListMainCatogry
//   const SaleReantChose({super.key, this.index, this.list, this.length});

//   @override
//   Widget build(BuildContext context) {
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
//             const LinearProgressIndicator(
//               color: mainColor,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height,
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 shrinkWrap: true,
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       saleRentElseVal = 0;
//                       setItemandnav(context, index!, list, length);
//                     },
//                     minLeadingWidth: 10.0,
//                     trailing: customIcon(
//                         iconData: Icons.arrow_forward_ios, color: mainColor),
//                     title: customText(
//                         text: AppLocalizations.of(context)!.sale,
//                         textAlign: TextAlign.justify,
//                         textFontSize: 18.0,
//                         textColor: mainColor,
//                         textWeight: FontWeight.bold),
//                   ),
//                   ListTile(
//                     onTap: () {
//                       saleRentElseVal = 1;
//                       setItemandnav(context, index!, list, length);
//                     },
//                     minLeadingWidth: 10.0,
//                     trailing: customIcon(
//                         iconData: Icons.arrow_forward_ios, color: mainColor),
//                     title: customText(
//                         text: AppLocalizations.of(context)!.rent,
//                         textAlign: TextAlign.justify,
//                         textFontSize: 18.0,
//                         textColor: mainColor,
//                         textWeight: FontWeight.bold),
//                   ),
//                   ListTile(
//                     onTap: () {
//                       saleRentElseVal = 2;
//                       setItemandnav(context, index!, list, length);
//                     },
//                     minLeadingWidth: 10.0,
//                     trailing: customIcon(
//                         iconData: Icons.arrow_forward_ios, color: mainColor),
//                     title: customText(
//                         text: AppLocalizations.of(context)!.daylyRent,
//                         textAlign: TextAlign.justify,
//                         textFontSize: 18.0,
//                         textColor: mainColor,
//                         textWeight: FontWeight.bold),
//                   ),
//                   ListTile(
//                     onTap: () {
//                       saleRentElseVal = 3;
//                       setItemandnav(context, index!, list, length);
//                     },
//                     minLeadingWidth: 10.0,
//                     trailing: customIcon(
//                         iconData: Icons.arrow_forward_ios, color: mainColor),
//                     title: customText(
//                         text: AppLocalizations.of(context)!.transferSale,
//                         textAlign: TextAlign.justify,
//                         textFontSize: 18.0,
//                         textColor: mainColor,
//                         textWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // this method for check if will nav to specifc screen or show dailog rent sale list
//   Future<void> setItemandnav(BuildContext context, int index,
//       List<AdsModel>? list, int? length) async {
//     if (length == 5) {
//       //Estata
//       switch (index) {
//         case 0:
//           break;
//         case 1:
//           listOfItemVal = 0;
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) {
//                 return ListOfIteam(list: list!);
//               },
//             ),
//           );
//           break;
//         case 2:
//           listOfItemVal = 1;
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) {
//                 return ListOfIteam(list: list!);
//               },
//             ),
//           );
//           break;
//         case 3:
//           listOfItemVal = 20;
//           sub2CatToDtabase = 'land';
//           final resList = await GlobalMethods().lastFilterLand(list);
//           if (context.mounted) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) {
//                   return ResultAds(
//                     list: resList,
//                   );
//                 },
//               ),
//             );
//           }
//           break;
//         case 4:
//           listOfItemVal = 21;
//           sub2CatToDtabase = 'building';
//           final resList = await GlobalMethods().lastfilterBuilding(list!);
//           if (context.mounted) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) {
//                   return ResultAds(
//                     list: resList,
//                   );
//                 },
//               ),
//             );
//           }
//           break;
//         default:
//           null;
//           break;
//       }
//     } else if (length == 7) {
//       //vehicle
//       switch (index) {
//         case 0:
//           break;
//         case 1:
//           listOfItemVal = 2;
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) {
//                 return ListOfIteam(list: list!);
//               },
//             ),
//           );

//           break;
//         case 2:
//           listOfItemVal = 3;
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) {
//                 return ListOfIteam(list: list!);
//               },
//             ),
//           );

//           break;
//         case 3:
//           listOfItemVal = 4;
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) {
//                 return ListOfIteam(list: list!);
//               },
//             ),
//           );

//           break;
//         case 4:
//           listOfItemVal = 5;
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) {
//                 return ListOfIteam(list: list!);
//               },
//             ),
//           );

//           break;
//         case 5:
//           listOfItemVal = 6;
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) {
//                 return ListOfIteam(list: list!);
//               },
//             ),
//           );
//           break;
//         case 6:
//           listOfItemVal = 7;
//           final resList = await GlobalMethods().lastFilterDamgedCar(list!);
//           if (context.mounted) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) {
//                   return ResultAds(
//                     list: resList,
//                   );
//                 },
//               ),
//             );
//           }
//           break;
//         default:
//           null;
//           break;
//       }
//     } else if (length == 6) {
//       //hotels
//       switch (index) {
//         case 0:
//           break;
//         case 1:
//           listOfItemVal = 8;
//           final resList = await GlobalMethods().lastFilterHotels(list!);
//           if (context.mounted) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) {
//                   return ResultAds(
//                     list: resList,
//                   );
//                 },
//               ),
//             );
//           }

//           break;
//         case 2:
//           listOfItemVal = 9;
//           final resList = await GlobalMethods().lastFilterHotels(list!);
//           if (context.mounted) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) {
//                   return ResultAds(
//                     list: resList,
//                   );
//                 },
//               ),
//             );
//           }

//           break;
//         case 3:
//           listOfItemVal = 10;
//           final resList = await GlobalMethods().lastFilterHotels(list!);
//           if (context.mounted) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) {
//                   return ResultAds(
//                     list: resList,
//                   );
//                 },
//               ),
//             );
//           }

//           break;
//         case 4:
//           listOfItemVal = 11;
//           final resList = await GlobalMethods().lastFilterHotels(list!);
//           if (context.mounted) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) {
//                   return ResultAds(
//                     list: resList,
//                   );
//                 },
//               ),
//             );
//           }

//           break;
//         case 5:
//           listOfItemVal = 12;
//           final resList = await GlobalMethods().lastFilterHotels(list!);
//           if (context.mounted) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) {
//                   return ResultAds(
//                     list: resList,
//                   );
//                 },
//               ),
//             );
//           }

//           break;
//       }
//     } else {
//       return;
//     }
//   }
// }
