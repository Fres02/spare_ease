import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFFF7C910),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/Logo.png'),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text('SpareEase',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(75, 62, 53, 0),
                    fontSize: 32,
                    fontFamily: 'Racing Sans One',
                    fontWeight: FontWeight.w400,
                  )),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text('We\'ve got the spares',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(75, 62, 53, 0),
                    fontSize: 16,
                    fontFamily: 'Rasa',
                    fontWeight: FontWeight.w400,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
