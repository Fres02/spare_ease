import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spare_ease/components/my_app_functions.dart';
import 'package:spare_ease/pages/home.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final loginFormKey = GlobalKey<FormState>();

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;

  var isLoading = false.obs;
  var obscurePassword = false.obs;

  final auth = FirebaseAuth.instance;

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
    final isValid = loginFormKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      try {
        isLoading.value = true;

        await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Fluttertoast.showToast(
          msg: "Login Succeful",
          textColor: Colors.white,
        );
        Navigator.pushReplacementNamed(context, '/bottomnev');
      } on FirebaseException catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
          context: context,
          subtitle: error.message.toString(),
          fct: () {},
        );
      } catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
          context: context,
          subtitle: error.toString(),
          fct: () {},
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

/*  Future<void> login(BuildContext context) async {
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
  } */
}
