import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/models/ads_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterDetails extends StatelessWidget {
  final List<AdsModel> list;
  const FilterDetails({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: false,
          title: customText(
              text: AppLocalizations.of(context)!.filter,
              textColor: Colors.white),
        ),
      ),
    );
  }
}
