import 'package:flutter/material.dart';

class IntroImage extends StatelessWidget {
  final String imagePath;

  const IntroImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        imagePath,
      ),
    );
  }
}
