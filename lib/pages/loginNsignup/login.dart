import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spare_ease/pages/loginNsignup/signup.dart';
import 'package:spare_ease/pages/loginNsignup/components/validator.dart';
import 'package:spare_ease/pages/loginNsignup/components/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = "/Login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _obscureText = true;
  bool isLoading = false;
  bool checkBoxValue = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleCheckBoxValue() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> login(BuildContext context) async {
    if (loginFormKey.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      FocusScope.of(context).unfocus();
      setState(() {
        isLoading = true;
      });

      try {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        Fluttertoast.showToast(
          msg: "Login Successful",
          textColor: Colors.white,
        );

        // Navigate to the next page
        Navigator.pushReplacementNamed(context, '/bottomNav');
      } on FirebaseAuthException catch (e) {
        String errorMessage = e.message ?? "An error occurred during login.";
        Fluttertoast.showToast(
          msg: errorMessage,
          textColor: Colors.red,
        );
      } catch (e) {
        Fluttertoast.showToast(
          msg: "An unexpected error occurred.",
          textColor: Colors.red,
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Image.asset(
              'assets/intro.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 200,
                left: 24.8,
                bottom: 24.8,
                right: 24.8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Form(
                    key: loginFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: emailController,
                          focusnode: emailFocusNode,
                          validator: (value) {
                            return Validator.validateEmail(value);
                          },
                          label: "Email Address",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: passwordController,
                          focusnode: passwordFocusNode,
                          validator: (value) {
                            return Validator.validatePassword(value);
                          },
                          label: "Password",
                          keyboardType: TextInputType.text,
                          obscureText: _obscureText,
                          suffixIcon: InkWell(
                            onTap: _togglePasswordVisibility,
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: checkBoxValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      checkBoxValue = newValue!;
                                    });
                                  },
                                ),
                                const Text(
                                  "Remember Me",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Color(0xFFF7C910),
                                  fontSize: 19,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        isLoading
                            ? const CircularProgressIndicator()
                            : SizedBox(
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
                                  onPressed: () => login(context),
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
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Color(0xFFF7C910),
                                fontSize: 19,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontFamily: 'Plus Jakarta Sans',
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
          ),
        ],
      ),
    );
  }
}
