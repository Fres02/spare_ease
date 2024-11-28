import 'package:flutter/material.dart';
import 'package:spare_ease/pages/home.dart';
import 'package:spare_ease/pages/my_bottom_navigation_bar.dart';
import 'package:spare_ease/pages/product_details.dart';
import 'package:spare_ease/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBottomNavigationBar(),
      //home: SplashScreen(),
      routes: {
        ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
      },
    );
  }
}
