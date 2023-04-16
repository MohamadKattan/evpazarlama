import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:evpazarlama/client-srv/param_payment.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_dailog.dart';
import 'package:evpazarlama/state-maneg/booling_val.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardPaymentScreen extends StatefulWidget {
  final String amount;
  final int plan;

  const CardPaymentScreen({Key? key, required this.amount, required this.plan})
      : super(key: key);

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  String cardNumber = "";
  String expiryDateMouthe = "";
  String expiryDateYear = "";
  String cardHolderName = "";
  String cvv = "";
  bool showBack = false;
  FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          key: formKey,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    CreditCard(
                      cardNumber: cardNumber,
                      cardExpiry: "$expiryDateMouthe/$expiryDateYear",
                      cvv: cvv,
                      cardHolderName: cardHolderName,
                      showBackSide: showBack,
                      frontBackground: CardBackgrounds.black,
                      backBackground: CardBackgrounds.white,
                      showShadow: true,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.cardNumber),
                        maxLength: 16,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              cardNumber = value;
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: "Cvv"),
                        maxLength: 3,
                        focusNode: _focusNode,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              cvv = value;
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.montheNo),
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              expiryDateMouthe = value;
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.yearNo),
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              expiryDateYear = value;
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.cardHolder),
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              cardHolderName = value;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(120, 40),
                              backgroundColor: Colors.greenAccent[700]),
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'pay',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                          onPressed: () async {
                            await checkBefore();
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(120, 40),
                              backgroundColor: Colors.red[700]),
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Cancel',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Consumer<BoolingVal>(
                builder: (context, value, child) {
                  return value.isLodingAuth
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.height,
                          color: Colors.black.withOpacity(0.6),
                          child:
                              const Center(child: CircularProgressIndicator(color: mainColor)),
                        )
                      : const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkBefore() async {
    if (cardNumber == "") {
      CustomDailog().customSnackBar(
          context: context,
          text: '***${AppLocalizations.of(context)!.cardHolder}***');
    } else if (cvv == "") {
      CustomDailog().customSnackBar(context: context, text: '***Cvv***');
    } else if (expiryDateMouthe == "") {
      CustomDailog().customSnackBar(
          context: context,
          text: '***${AppLocalizations.of(context)!.montheNo}***');
    } else if (expiryDateYear == "") {
      CustomDailog().customSnackBar(
          context: context,
          text: '***${AppLocalizations.of(context)!.yearNo}***');
    } else {
      Provider.of<BoolingVal>(context, listen: false).loadingAuth(true);
      ParamPayment().paramToken(
        cardNumber,
        cvv,
        expiryDateMouthe,
        expiryDateYear,
        cardHolderName,
        widget.amount,
        widget.plan,
        context,
      ).whenComplete((){
         clearText();
      });
    }
  }

  void clearText() {
    setState(() {
      cardNumber = "";
      expiryDateMouthe = "";
      expiryDateYear = "";
      cardHolderName = "";
      cvv = "";
    });
  }
}
