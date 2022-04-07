import 'package:flutter/material.dart';
import 'package:gocart/MainScreen_Pages/mainPage.dart';
import 'package:gocart/OnBoarding/forgotpsw.dart';
import 'package:gocart/OnBoarding/signup.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: screenHeight * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo
                Hero(
                  tag: 'logo',
                  child: logo(),
                ),
                SizedBox(height: screenHeight * 0.04),
                // Login Banner
                Hero(
                  tag: 'main text',
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 59, 59, 61),
                      fontSize: screenHeight * 0.05,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 10),
                  child: Column(
                    children: <Widget>[
                      // Email TextField
                      gocartTextField(
                          hint: "Email",
                          control: TextEditingController(),
                          textType: TextInputType.emailAddress),
                      // Password TextField
                      gocartTextField(
                        hint: "Password",
                        control: TextEditingController(),
                        pswd: true,
                      ),
                      // Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            child: const Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: Text("Forget Password?",
                                  style: TextStyle(
                                      color: Colors.red,
                                      decoration: TextDecoration.underline)),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  //                        MaterialPageRoute(builder: (context) => forgetPassword()));
                                  MaterialPageRoute(
                                      builder: (context) => forgotpsw()));
                            },
                          )
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.04),
                    ],
                  ),
                ),
                // Login Button
                Hero(
                  tag: 'onBoarding Button',
                  child: coolButton(
                      text: "Login",
                      functionToComply: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => homePage(),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 10),
                // Dont have an account?
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text("Don't have an account? "),
                      InkWell(
                          child: const Text(
                            "Signup",
                            style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signupPage()));
                          })
                    ]),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Forgot Password Button ----> forgotPassword.dart
// Signup Button ----> Signup.dart