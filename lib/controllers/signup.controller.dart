import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupController extends GetxController {
  final signupFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactNumberController = TextEditingController();
  final addressController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final contactNumberFocusNode = FocusNode();
  final addressFocusNode = FocusNode();

  var isLoading = false.obs;
  var obscurePassword = true.obs;

  final auth = FirebaseAuth.instance;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    contactNumberController.dispose();
    addressController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    contactNumberFocusNode.dispose();
    addressFocusNode.dispose();

    super.onClose();
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> signup(BuildContext context) async {
    final isValid = signupFormKey.currentState!.validate();

    if (isValid) {
      try {
        isLoading.value = true;

        await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        final User? user = auth.currentUser;

        if (user != null) {
          final String userId = user.uid;

          await FirebaseFirestore.instance.collection('user').doc(userId).set(
            {
              "userId": userId,
              "email": emailController.text.trim(),
              "firstName": firstNameController.text.trim(),
              "lastName": lastNameController.text.trim(),
              "address": addressController.text.trim(),
              "contactNumber": contactNumberController.text.trim(),
              "userCart": [],
              "createdAt": Timestamp.now(),
            },
          );

          Navigator.pushReplacementNamed(context, '/bottomNav');

          Fluttertoast.showToast(
            msg: "Account created successfully!",
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.white,
            backgroundColor: Colors.green,
          );
        }
      } catch (error) {
        Fluttertoast.showToast(
          msg: "Error: $error",
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
          backgroundColor: Colors.red,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }
}
