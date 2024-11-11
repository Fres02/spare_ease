import 'package:flutter/material.dart';

class IntroText1 extends StatelessWidget {
  final String displayText;
  const IntroText1({required this.displayText, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      displayText,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontFamily: 'Plus Jakarta Sans',
        fontWeight: FontWeight.w700,
        height: 0.03,
        letterSpacing: -0.72,
      ),
    );
  }
}
