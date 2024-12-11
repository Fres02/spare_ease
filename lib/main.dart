import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_ease/pages/home.dart';
import 'package:spare_ease/pages/loginNsignup/login.dart';
import 'package:spare_ease/pages/loginNsignup/signup.dart';
import 'package:spare_ease/pages/my_bottom_navigation_bar.dart';
import 'package:spare_ease/pages/my_uploads.dart';
import 'package:spare_ease/pages/onboarding_screen/onboarding_screen.dart';
import 'package:spare_ease/pages/placed_orders.dart';
import 'package:spare_ease/pages/product_details.dart';
import 'package:spare_ease/providers/cart_provider.dart';
import 'package:spare_ease/providers/products_provider.dart';
import 'package:spare_ease/providers/user_provider.dart';
import 'package:spare_ease/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spare_ease/pages/profile.dart';
import 'package:spare_ease/pages/search.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint = (String? message, {int? wrapWidth}) {};

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: SelectableText(snapshot.error.toString()),
                ),
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) {
                  return ProductsProvider();
                },
              ),
              ChangeNotifierProvider(
                create: (_) {
                  return CartProvider();
                },
              ),
              ChangeNotifierProvider(
                create: (_) {
                  return UserProvider();
                },
              ),
            ],
            child: MaterialApp(
              //home: const MyBottomNavigationBar(),
              home: const SplashScreen(),
              routes: {
                LoginPage.routeName: (context) => const LoginPage(),
                SignupPage.routName: (context) => const SignupPage(),
                ProductDetailsScreen.routeName: (context) =>
                    const ProductDetailsScreen(),
                PlacedOrdersScreen.routeName: (context) =>
                    const PlacedOrdersScreen(),
                ProfilePage.routeName: (context) => const ProfilePage(),
                SearchPage.routeName: (context) => const SearchPage(),
                '/bottomNav': (context) => MyBottomNavigationBar(),
                Home.routeName: (context) => Home(),
                OnBoardingScreen.routeName: (context) =>
                    const OnBoardingScreen(),
                UploadedProductsScreen.routeName: (context) =>
                    const UploadedProductsScreen(),
              },
            ),
          );
        });
  }
}
