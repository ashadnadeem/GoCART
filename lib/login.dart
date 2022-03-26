import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gocart/signup.dart';
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo
            logo(),
            const SizedBox(height: 100),
            // Login Banner
            Text(
              'Login',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 59, 59, 61),
                fontSize: 64,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
              child: Column(children: <Widget>[
                // Email TextField
                gocartTextField(
                    hint: "Email",
                    control: TextEditingController(),
                    textType: TextInputType.emailAddress),
                const SizedBox(height: 40),
                // Password TextField
                gocartTextField(
                  hint: "Password",
                  control: TextEditingController(),
                  pswd: true,
                ),
                const SizedBox(height: 10),
                // Forgot Password
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                          child: const Text("Forget Password?",
                              style: TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.underline)),
                          onTap: () {
                            Navigator.push(
                                context,
//                        MaterialPageRoute(builder: (context) => forgetPassword()));
                                MaterialPageRoute(
                                    builder: (context) => loginPage()));
                          })
                    ]),
              ]),
            ),
            // Login Button
            coolButton(
                text: "Login", width: 252, height: 70, functionToComply: () {}),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Forgot Password Button ----> forgotPassword.dart
// Signup Button ----> Signup.dart