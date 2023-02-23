import 'package:flutter/material.dart';

// this method for Navigtor with out replace page
void pushToNewScreen(
    {required BuildContext context, required String routeName}) {
  Navigator.pushNamed(context, routeName);
}

// this method for pop from screen
void popFromScreen(BuildContext context) {
  Navigator.pop(context);
}

// this method for Navigtor with replace screen
void pushReplaceToNewScreen(
    {required BuildContext context, required String routeName}) {
  Navigator.pushReplacementNamed(context, routeName);
}


