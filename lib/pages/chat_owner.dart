import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class ChatOwner extends StatelessWidget {
  const ChatOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      drawer: customDrawer(context),
      body: const Center(child: Text('Chat screen')),
    ));
  }
}
