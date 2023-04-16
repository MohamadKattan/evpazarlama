import 'dart:math';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:evpazarlama/state-maneg/booling_val.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:xml/xml.dart' as xml;

class ParamPayment {
  static String paramUrl =
      "https://posws.param.com.tr/turkpos.ws/service_turkpos_prod.asmx?wsdl";
  static String serverUrl = "https://param-pay.herokuapp.com/pay";
  static Map<String, String> paramHeader = {'content-type': 'text/xml'};
  static Map<String, String> serverHeader = {
    'content-type': 'application/json'
  };

  // this method for create token hash from param ipa
  Future<void> paramToken(
      String cardNumber,
      String cvv,
      String expiryDateMouthe,
      String expiryDateYear,
      String cardHolderName,
      String amount,
      int plan,
      BuildContext context) async {
    Set<int> setOfInts = {};
    setOfInts.add(Random().nextInt(max(0, 1000000)));
    String idOrder = setOfInts.toString();
    var builder = xml.XmlBuilder();
    builder.processing('xml', 'version="1.0" encoding="utf-8"');
    builder.element(
      'soap:Envelope',
      nest: () {
        builder.attribute(
            'xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance');
        builder.attribute('xmlns:xsd', 'http://www.w3.org/2001/XMLSchema');
        builder.attribute(
            'xmlns:soap', 'http://schemas.xmlsoap.org/soap/envelope/');
        builder.element(
          'soap:Body',
          nest: () {
            builder.element(
              'SHA2B64',
              nest: () {
                builder.attribute('xmlns', 'https://turkpos.com.tr/');
                builder.element(
                  'Data',
                  nest: () {
                    builder.text(
                        '33485211B6527-D2E1-4247-9590-00B3985504DE1$amount$amount${idOrder}https://errorparam-10.web.app/https://payment-ok.firebaseapp.com/');
                  },
                );
              },
            );
          },
        );
      },
    );
    var bookshelfXml = builder.buildDocument();
    String bodyHash = bookshelfXml.toString();
    final res = await http.post(Uri.parse(paramUrl),
        headers: paramHeader, body: convert.utf8.encode(bodyHash));
    if (res.statusCode == 200) {
      final document = xml.XmlDocument.parse(res.body);
      final hashCode = document.findAllElements('SHA2B64Result').single.text;
      if (context.mounted) {
        startPayment(
            hashCode,
            idOrder,
            amount,
            userInfoProfile?.userName ?? 'null',
            userInfoProfile?.userPhone ?? 'null',
            cardNumber,
            cvv,
            expiryDateMouthe,
            expiryDateYear,
            cardHolderName,
            context,
            plan);
      }
    } else {
      if (context.mounted) {
        Provider.of<BoolingVal>(context, listen: false).loadingAuth(false);
        CustomDailog().customSnackBar(
            context: context, text: 'SomeThing went wrong 402 hash');
      }
    }
  }

// this method for start 3D payment or NS connect to our server N.js
  Future<void> startPayment(
      String hashCode,
      String idOrder,
      String amount,
      String name,
      String phone,
      String cardNumber,
      String cvv,
      String expiryDateMouthe,
      String expiryDateYear,
      String cardHolderName,
      BuildContext context,
      int plan) async {
    //map parameter that will post to our server
    Map<String, dynamic> toServer = {
      "hash": hashCode,
      "id": idOrder,
      "amount": amount,
      "holder": cardHolderName,
      "number": cardNumber,
      "cvv": cvv,
      "month": expiryDateMouthe,
      "year": expiryDateYear,
      "phone": phone
    };
    // post to our server
    final resServer = await http.post(Uri.parse(serverUrl),
        headers: serverHeader, body: convert.jsonEncode(toServer));
    if (resServer.statusCode == 200) {
      final document = xml.XmlDocument.parse(resServer.body);
      final paramResult = document.findAllElements('Sonuc').single.text;
      final url3d = document.findAllElements('UCD_URL').single.text;
      if (paramResult == "1") {
        var url = Uri.parse(url3d);
        await canLaunchUrl(url)
            ? launchUrl(url, mode: LaunchMode.externalApplication).whenComplete(
                () async {
                  usersProfileCollection.doc(userId).update(
                    {"plan": plan},
                  );
                  Provider.of<BoolingVal>(context, listen: false)
                      .loadingAuth(false);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            : throw (e);
      } else {
        if (context.mounted) {
          Provider.of<BoolingVal>(context, listen: false).loadingAuth(false);
          final errorMessage =
              document.findAllElements('Sonuc_Str').single.text;
          CustomDailog()
              .customSnackBar(context: context, text: '**$errorMessage**');
        }
      }
    } else {
      if (context.mounted) {
        Provider.of<BoolingVal>(context, listen: false).loadingAuth(false);
        AppLocalizations.of(context)!.someWrong;
      }
    }
  }
}
