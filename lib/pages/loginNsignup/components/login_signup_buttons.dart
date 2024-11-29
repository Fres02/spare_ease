import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_ease/controllers/login.controller.dart';
import 'package:spare_ease/controllers/signup.controller.dart';

class LoginSignupButtons extends StatelessWidget {
  final VoidCallback onSignUp;
  final VoidCallback onLogIn;

  const LoginSignupButtons(
      {required this.onSignUp, required this.onLogIn, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            width: 343,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(75, 62, 53, 1),
                elevation: 0,
                side: const BorderSide(
                  width: 1,
                  color: Color.fromRGBO(75, 62, 53, 1),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(8),
                textStyle: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              onPressed: onSignUp,
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 343,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(8),
                textStyle: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color.fromRGBO(75, 62, 53, 1),
                ),
              ),
              onPressed: onLogIn,
              child: const Text(
                'Log In',
                style: TextStyle(
                  color: Color(0xFFF7C910),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginButton({required this.formKey, super.key});
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          side: const BorderSide(
            width: 1,
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(8),
          textStyle: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color(0xFFF7C910),
          ),
        ),
        onPressed: () => controller.login(formKey),
        child: const Text(
          'Log In',
          style: TextStyle(
            color: Color(0xFFF7C910),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class SignupButton extends StatelessWidget {
  final SignupController controller = Get.find<SignupController>();
  final GlobalKey<FormState> formKey;

  SignupButton({required this.formKey, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(75, 62, 53, 1),
          elevation: 0,
          side: const BorderSide(
            width: 1,
            color: Color.fromRGBO(75, 62, 53, 1),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(8),
          textStyle: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        onPressed: () => controller.signup(context),
        child: controller.isLoading.value
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                'Register',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
