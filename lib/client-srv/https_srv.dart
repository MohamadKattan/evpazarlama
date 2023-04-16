import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClintHttpSrv {
  Future getDataFromApi(
      {required BuildContext context, required String urlApi}) async {
    try {
      var url = Uri.parse(urlApi);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body) as Map<String, dynamic>;
        return data;
      } else {
        Future.delayed(const Duration(microseconds: 100)).whenComplete(() {
          CustomDailog().customSnackBar(
              context: context,
              text:
                  '${AppLocalizations.of(context)!.pickLocation}  ${response.statusCode}');
        });

        return 'failed';
      }
    } catch (ex) {
      CustomDailog().customSnackBar(
          context: context,
          text:
              '${AppLocalizations.of(context)!.pickLocation}  ${ex.toString()}');
      return 'failed';
    }
  }

  Future<void> postRequest(
      {required String url,
      required Map<String, String> header,
      required Map<String, dynamic> body}) async {
    var uriUrl = Uri.parse(url);
    await http.post(uriUrl, headers: header, body: convert.jsonEncode(body));
  }
}
