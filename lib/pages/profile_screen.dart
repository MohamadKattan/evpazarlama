import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: mainColor,
    
            appBar: AppBar(backgroundColor: mainColor, centerTitle: false,elevation: 0.0),
            drawer: customDrawer(context),
            body:const Text('Profile')));
  }
}