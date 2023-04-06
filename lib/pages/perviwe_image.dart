import 'package:evpazarlama/global-methods/methods.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_flout.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PreViewImage extends StatelessWidget {
  final List list;
  const PreViewImage({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: customFloutButton(
            function: () {
              GlobalMethods().popFromScreen(context);
            },
            child: customIcon(iconData: Icons.close)),
        body: list.isNotEmpty
            ? ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      list[index],
                      fit: BoxFit.fill,
                    ),
                  );
                })
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child: CircularProgressIndicator(color: mainColor)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: customText(
                      textAlign: TextAlign.center,
                      textColor: mainColor,
                      text: AppLocalizations.of(context)!.noFound,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
