import 'package:flutter/material.dart';
import './components/intropages_image.dart';
import './components/intropages_text1.dart';
import './components/intropages_text2.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF7C910),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 1),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: IntroImage(
                      imagePath: 'assets/image2.jpg',
                    ),
                  ),
                  SizedBox(height: 40),
                  IntroText1(displayText: 'Fast and Reliable '),
                  SizedBox(height: 40),
                  IntroText1(displayText: 'Delivery'),
                  SizedBox(height: 40),
                  IntroText2(
                      displayText: 'Your bike parts will arrive right at your'),
                  SizedBox(height: 25),
                  IntroText2(displayText: 'doorstep, just when you need them.'),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
