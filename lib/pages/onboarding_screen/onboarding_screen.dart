import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spare_ease/pages/loginNsignup/components/login_signup_buttons.dart';
import 'package:spare_ease/pages/loginNsignup/login.dart';
import 'package:spare_ease/pages/loginNsignup/signup1.dart';
import 'package:spare_ease/pages/onboarding_screen/intro1.dart';
import 'package:spare_ease/pages/onboarding_screen/intro2.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void navigateToLogIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFF7C910),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [
                  Intro1(),
                  Intro2(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 2,
                effect: const WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Color.fromRGBO(75, 62, 53, 1),
                  dotColor: Colors.grey,
                  spacing: 8,
                ),
              ),
            ),
            LoginSignupButtons(
              onSignUp: navigateToSignUp,
              onLogIn: navigateToLogIn,
            ),
          ],
        ),
      ),
    );
  }
}
