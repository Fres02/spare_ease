import 'package:flutter/material.dart';
import 'package:spare_ease/components/assets_manager.dart';
import 'package:spare_ease/components/my_app_functions.dart';
import 'package:spare_ease/components/subtitle_text.dart';
import 'package:spare_ease/components/title_text.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:spare_ease/pages/placed_orders.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoggedIn = true; // Simulating login status for demo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            AssetsManager.shoppingCart,
          ),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: !isLoggedIn,
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: TitlesTextWidget(
                label: "Please login to have unlimited access",
              ),
            ),
          ),
          Visibility(
            visible: isLoggedIn,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 10),
                      TitlesTextWidget(label: "Hadi Kachmar"),
                      SizedBox(height: 6),
                      SubtitleTextWidget(label: "Coding.with.hadi@gmail.com"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(thickness: 1),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                CustomListTile(
                  text: "All Orders",
                  imagePath: AssetsManager.orderSvg,
                  function: () => Navigator.pushNamed(
                    context,
                    PlacedOrdersScreen
                        .routeName, // Replace with actual route name
                  ),
                ),
                CustomListTile(
                  text: "Wishlist",
                  imagePath: AssetsManager.wishlistSvg,
                  function: () {
                    // Implement functionality
                  },
                ),
                CustomListTile(
                  text: "Viewed Recently",
                  imagePath: AssetsManager.recent,
                  function: () {
                    // Implement functionality
                  },
                ),
                CustomListTile(
                  text: "Address",
                  imagePath: AssetsManager.address,
                  function: () {
                    // Implement functionality
                  },
                ),
                const SizedBox(height: 6),
                const Divider(thickness: 1),
                const SizedBox(height: 6),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                onPressed: () async {
                  await MyAppFunctions.showErrorOrWarningDialog(
                    context: context,
                    subtitle: "Are you sure you want to logout?",
                    fct: () {
                      setState(() {
                        isLoggedIn = false; // Simulating logout
                      });
                    },
                    isError: false,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,
  });

  final String imagePath, text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: function,
      title: SubtitleTextWidget(label: text),
      leading: Image.asset(
        imagePath,
        height: 34,
      ),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
