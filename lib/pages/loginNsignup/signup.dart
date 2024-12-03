import 'package:flutter/material.dart';
import 'package:spare_ease/controllers/signup.controller.dart';
import 'package:spare_ease/pages/loginNsignup/components/custom_text_field.dart';
import 'package:spare_ease/pages/loginNsignup/components/login_signup_buttons.dart';
import 'package:spare_ease/pages/loginNsignup/components/validator.dart';
import 'package:spare_ease/pages/loginNsignup/login.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  static const routName = "/Signup";

  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Scaffold(
      backgroundColor: Color(0xFFF7C910),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      shadows: [
                        Shadow(
                          color: Colors.black54,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [Colors.orange, Colors.pink],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Text(
                    "Create Your Account",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 4,
                  width: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange, Color.fromRGBO(75, 62, 53, 1)],
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Form(
              key: controller.signupFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: controller.emailController,
                    focusnode: controller.emailFocusNode,
                    validator: (value) => Validator.validateEmail(value),
                    label: "Email Address",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: controller.passwordController,
                    focusnode: controller.passwordFocusNode,
                    validator: (value) => Validator.validatePassword(value),
                    label: "Password",
                    keyboardType: TextInputType.text,
                    obscureText: controller.obscurePassword.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: controller.confirmPasswordController,
                    focusnode: controller.confirmPasswordFocusNode,
                    validator: (value) => Validator.validateConfirmPassword(
                      controller.passwordController.text,
                      value,
                    ),
                    label: "Confirm Password",
                    keyboardType: TextInputType.text,
                    obscureText: controller.obscurePassword.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: controller.firstNameController,
                    focusnode: controller.firstNameFocusNode,
                    validator: (value) =>
                        Validator.validateEmptyText('First name', value),
                    label: "First Name",
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: controller.lastNameController,
                    focusnode: controller.lastNameFocusNode,
                    validator: (value) =>
                        Validator.validateEmptyText('Last name', value),
                    label: "Last Name",
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: controller.contactNumberController,
                    focusnode: controller.contactNumberFocusNode,
                    validator: (value) =>
                        Validator.validateEmptyText('Contact number', value),
                    label: "Contact Number",
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: controller.addressController,
                    focusnode: controller.addressFocusNode,
                    validator: (value) =>
                        Validator.validateEmptyText('Address', value),
                    label: "Address",
                    keyboardType: TextInputType.streetAddress,
                  ),
                  const SizedBox(height: 16),
                  SignupButton(formKey: controller.signupFormKey),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                            color: Color.fromRGBO(75, 62, 53, 1),
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
