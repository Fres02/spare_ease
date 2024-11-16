import 'package:flutter/material.dart';
import 'package:spare_ease/pages/loginNsignup/components/custom_text_field.dart';
import 'package:spare_ease/pages/loginNsignup/components/login_signup_buttons.dart';
import 'package:spare_ease/pages/loginNsignup/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7C910),
      body: Container(
        child: SingleChildScrollView(
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
                        colors: [Colors.orange, Colors.pink],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: "Email Address",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
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
                    SizedBox(height: 16),
                    CustomTextField(
                      label: "Confirm Password",
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
                    SizedBox(height: 16),
                    CustomTextField(
                      label: "First Name",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: "Last Name",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: "Contact Number",
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: "Address",
                      keyboardType: TextInputType.streetAddress,
                    ),
                    const SizedBox(height: 16),
                    const SignupButton(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
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
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                              color: Color.fromRGBO(75, 62, 53, 1),
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
    );
  }
}
