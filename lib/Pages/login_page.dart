import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:floral_fiesta/components/authentication_button.dart';
import 'package:floral_fiesta/components/custom_text_field.dart';
import 'package:floral_fiesta/components/curve.dart';
import 'package:floral_fiesta/constants.dart';
import 'package:floral_fiesta/Pages/main_page.dart';
import 'package:floral_fiesta/Pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.bottomRight,
        fit: StackFit.expand,
        children: [
          // First Child in the stack

          ClipPath(
            clipper: ImageClipper(),
            child: Image.asset(
              'assets/images/leaves.jpg',
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),

          // Second Child in the stack
          Positioned(
            height: MediaQuery.of(context).size.height * 0.67,
            width: MediaQuery.of(context).size.width,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.67,
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // First Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome To',
                            style: GoogleFonts.poppins(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w600,
                              color: kDarkGreenColor,
                            ),
                          ),
                          Text(
                            'Floral Fiesta',
                            style: GoogleFonts.poppins(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w600,
                              color: kDarkGreenColor,
                            ),
                          ),
                          Text(
                            'Login to your account',
                            style: GoogleFonts.poppins(
                              color: kGreyColor,
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      ),

                      // Second Column
                      Column(
                        children: [
                          CustomTextField(
                            hintText: 'Username',
                            icon: Icons.person,
                            keyboardType: TextInputType.name,
                            onChanged: (value) {
                              username = value != '' ? value : '';
                            },
                          ),
                          CustomTextField(
                            hintText: 'Password',
                            icon: Icons.lock,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (value) {
                              password = value != '' ? value : '';
                            },
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor: MaterialStateProperty.all(
                                          kDarkGreenColor),
                                      value: rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          rememberMe = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Remember Me',
                                      style: TextStyle(
                                        color: kGreyColor,
                                        fontSize: 14.0,
                                      ),
                                    )
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        kDarkGreenColor),
                                  ),
                                  child: const Text(
                                    'Forgot Password ?',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      // Third Column
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AuthenticationButton(
                              label: 'Log In',
                              onPressed: () {
                                if (username.toLowerCase() == 'admin' &&
                                    password == 'admin') {
                                  Navigator.pushNamed(context, MainPage.id);
                                }
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account ?',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                      MaterialStateProperty.all(
                                          kDarkGreenColor),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, SignupPage.id);
                                    },
                                    child: const Text(
                                      'Sign up',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}