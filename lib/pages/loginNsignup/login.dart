import 'package:flutter/material.dart';
import 'package:spare_ease/pages/loginNsignup/components/login_signup_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Image.asset(
                  'assets/intro.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 200,
                left: 24.8,
                bottom: 24.8,
                right: 24.8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            filled: true,
                            fillColor: Color(0xFFF7C910),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: "Password",
                            filled: true,
                            fillColor: Color(0xFFF7C910),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (value) {},
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
                            )
                          ],
                        ),
                        SizedBox(height: 16),
                        LoginButton(),
                        SizedBox(height: 16),
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
                              onPressed: () {},
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
