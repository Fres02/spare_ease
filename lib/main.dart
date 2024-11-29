import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_ease/pages/home.dart';
import 'package:spare_ease/pages/loginNsignup/login.dart';
import 'package:spare_ease/pages/loginNsignup/signup.dart';
import 'package:spare_ease/pages/my_bottom_navigation_bar.dart';
import 'package:spare_ease/pages/placed_orders.dart';
import 'package:spare_ease/pages/product_details.dart';
import 'package:spare_ease/providers/products_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ProductsProvider();
        })
      ],
      child: MaterialApp(
        home: const MyBottomNavigationBar(),
        //home: const SplashScreen(),
        routes: {
          LoginPage.routeName: (context) => const LoginPage(),
          SignupPage.routName: (context) => const SignupPage(),
          ProductDetailsScreen.routeName: (context) =>
              const ProductDetailsScreen(),
          PlacedOrdersScreen.routeName: (context) => const PlacedOrdersScreen(),
        },
      ),
    );
  }
}
