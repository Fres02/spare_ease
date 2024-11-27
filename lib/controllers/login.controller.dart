import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spare_ease/pages/home.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.onClose();
  }

  Future<void> login(BuildContext context) async {
    if (loginFormKey.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      try {
        // Firebase login
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        // Navigate to HomeScreen on success
        Get.off(() => const Home());
      } on FirebaseAuthException catch (e) {
        String errorMessage = '';
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for this email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Incorrect password.';
        } else {
          errorMessage = 'Login failed. Please try again.';
        }
        Get.snackbar('Error', errorMessage,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } catch (e) {
        Get.snackbar('Error', 'Something went wrong. Please try again.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
  }
}
