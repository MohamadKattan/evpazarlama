import 'package:evpazarlama/client-srv/database_srv.dart';
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_spacer.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:evpazarlama/pages/one_ad_details.dart';
import 'package:evpazarlama/state-maneg/list_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class FavoriScreen extends StatelessWidget {
  const FavoriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0.0,
          centerTitle: false,
          title: customText(
              text: AppLocalizations.of(context)!.fievort,
              textColor: Colors.white),
        ),
        drawer: customDrawer(context),
        body: Consumer<ListVal>(
          builder: (context, value, child) {
            return value.listFavior.isNotEmpty
                ? ListView.builder(
                    itemCount: value.listFavior.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        // padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return OneAdsDetails(
                                  adsModel: value.listFavior[index]);
                            }));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: customText(
                                        text:
                                            '${AppLocalizations.of(context)!.adNumber} : '
                                            '${value.listFavior[index].adsNumber}',
                                        textColor: mainColor,
                                        textAlign: TextAlign.center),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        deleteAd(
                                            context, index, value.listFavior);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                              Container(
                                color: const Color.fromARGB(193, 154, 116, 62),
                                height: 100.0,
                                margin: const EdgeInsets.all(4.0),
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(4.0),
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      value.listFavior[index].images!.length,
                                  itemBuilder: (_, i) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        value.listFavior[index].images![i],
                                        height: 80.0,
                                        width: 80.0,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                color: const Color.fromARGB(31, 135, 126, 126),
                                margin: const EdgeInsets.all(4.0),
                                height: 150.0,
                                child: ListView.builder(
                                  itemCount:
                                      value.listFavior[index].details?.length,
                                  itemBuilder: (_, d) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: customText(
                                                text:
                                                    '${value.listFavior[index].title![d]}',
                                                textColor: mainColor,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start),
                                          ),
                                        ),
                                        customSpacer(width: 60.0),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: customText(
                                                text:
                                                    '${value.listFavior[index].details![d]}',
                                                textColor: mainColor,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customText(
                              text: AppLocalizations.of(context)!.noFound),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }

  Future<void> deleteAd(
      BuildContext context, int index, List<AdsModel>? listFavior) async {
    await DataBaseSrv().deleteOneFavero(listFavior![index].adsId);
    if (context.mounted) {
      context.read<ListVal>().deleteAnIndexFaviorList(index);
      // DataBaseSrv().getMyFavori(context);
      // GlobalMethods().popFromScreen(context);
    }
  }
}
