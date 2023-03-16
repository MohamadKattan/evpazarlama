import 'package:flutter/material.dart';

class AddPhotos extends StatelessWidget {
  const AddPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Add photo'),
        ),
      ),
    );
  }
}
