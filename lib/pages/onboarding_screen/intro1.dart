import 'package:flutter/material.dart';
import './components/intropages_image.dart';
import './components/intropages_text1.dart';
import './components/intropages_text2.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

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
                      imagePath: 'assets/image1.jpg',
                    ),
                  ),
                  SizedBox(height: 40),
                  IntroText1(displayText: 'Find the Perfect'),
                  SizedBox(height: 40),
                  IntroText1(displayText: 'Parts for Your Ride'),
                  SizedBox(height: 40),
                  IntroText2(
                      displayText: 'Explore a vast selection of bike parts'),
                  SizedBox(height: 25),
                  IntroText2(displayText: 'tailored to your specific needs.'),
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
