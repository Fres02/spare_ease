import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_ease/components/assets_manager.dart';
import 'package:spare_ease/components/my_app_functions.dart';
import 'package:spare_ease/components/subtitle_text.dart';
import 'package:spare_ease/components/title_text.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:spare_ease/models/user_model.dart';
import 'package:spare_ease/pages/my_uploads.dart';
import 'package:spare_ease/pages/onboarding_screen/onboarding_screen.dart';
import 'package:spare_ease/pages/placed_orders.dart';
import 'package:spare_ease/providers/user_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static const routeName = '/ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoggedIn = true;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel? userModel;
  bool _isLoading = true;
  Future<void> fetchUserInfo() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      setState(() {
        _isLoading = true;
      });
      userModel = await userProvider.fetchUserInfo();
    } catch (error) {
      await MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: error.toString(),
        fct: () {},
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            AssetsManager.logo,
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
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: TitlesTextWidget(
                label: "Please login to have unlimited access",
              ),
            ),
          ),
          Visibility(
            visible: isLoggedIn,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      TitlesTextWidget(label: userModel!.firstName),
                      SizedBox(height: 6),
                      SubtitleTextWidget(label: userModel!.email),
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
                    PlacedOrdersScreen.routeName,
                  ),
                ),
                CustomListTile(
                  text: "Products Uploaded",
                  imagePath: AssetsManager.wishlistSvg,
                  function: () => Navigator.pushNamed(
                    context,
                    UploadedProductsScreen.routeName,
                  ),
                ),
                CustomListTile(
                  text: "Address",
                  imagePath: AssetsManager.address,
                  function: () {
                    _showEditableAddressDialog(context);
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
                icon: Icon(user == null ? Icons.login : Icons.logout),
                label: Text(user == null ? "Login" : "Logout"),
                onPressed: () async {
                  if (user == null) {
                    Navigator.pushNamed(context, OnBoardingScreen.routeName);
                  } else {
                    await MyAppFunctions.showErrorOrWarningDialog(
                      context: context,
                      subtitle: "Are you sure you want to sign out?",
                      fct: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          OnBoardingScreen.routeName,
                          (route) => false,
                        );
                      },
                      isError: false,
                    );
                  }
                },
              ),
            ),
          )
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

void _showEditableAddressDialog(BuildContext context) {
  TextEditingController addressController = TextEditingController();
  addressController.text = "ABC, ABC Lane, ABC, 80000";

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Edit Address"),
        content: TextField(
          controller: addressController,
          maxLines: 3,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your address",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              // Save the updated address logic
              String updatedAddress = addressController.text;
              // Example: Update the address in the state or database

              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      );
    },
  );
}
