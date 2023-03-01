import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_container.dart';
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
            body: logInByPhoneNumber()));
  }

  Widget logInByPhoneNumber() {
    return Stack(
      children: [
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: customContainer(
            colorBack: Colors.white,
              borderColor: Colors.white, ridusl: 100.0, height: 320.0),
        ),
      ],
    );
  }
}
