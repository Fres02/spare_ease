import 'package:flutter/material.dart';
import 'package:spare_ease/pages/homepage.dart';
import 'package:spare_ease/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: SplashScreen(),
      home: HomePage(),
    );
  }
}
