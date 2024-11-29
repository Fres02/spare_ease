import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final contactNumberController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  final contactNumberFocusNode = FocusNode();

  // final auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    contactNumberController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    addressFocusNode.dispose();
    contactNumberFocusNode.dispose();

    super.onClose();
  }

  Future<void> signup(BuildContext context) async {}

  /* Future<void> signup() async {
    if (!signupFormKey.currentState!.validate()) {
      Fluttertoast.showToast(
        msg: "Please fill all fields correctly",
        textColor: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final User? user = userCredential.user;
      if (user == null) {
        throw Exception("User registration failed");
      }

      final String uid = user.uid;

      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        'userId': uid,
        'firstName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'address': addressController.text.trim(),
        'contactNumber': contactNumberController.text.trim(),
        'email': emailController.text.trim().toLowerCase(),
        'createdAt': Timestamp.now(),
        'userWish': [],
        'userCart': [],
      });

      Fluttertoast.showToast(
        msg: "Account successfully created",
        textColor: Colors.white,
      );

      Get.offNamed('/HomePage');
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
        msg: error.message ?? "An error occurred",
        textColor: Colors.red,
      );
    } catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        textColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  } */
}
