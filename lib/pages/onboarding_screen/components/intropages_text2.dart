import 'package:flutter/material.dart';

class IntroText2 extends StatelessWidget {
  final String displayText;
  const IntroText2({required this.displayText, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      displayText,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xFF6B7280),
        fontSize: 20,
        fontFamily: 'Plus Jakarta Sans',
        fontWeight: FontWeight.w400,
        height: 0.07,
      ),
    );
  }
}
