import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gocart/tellusmore.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Login.dart';

class signupPage extends StatefulWidget {
  signupPage({Key? key}) : super(key: key);

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.1),
              // Logo
              logo(),
              SizedBox(height: screenHeight * 0.05),
              // Login Banner
              Text(
                'Sign Up',
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 59, 59, 61),
                  fontSize: screenWidth * 0.1,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: Column(children: <Widget>[
                  // Email TextField
                  gocartTextField(
                    hint: "Email",
                    control: TextEditingController(),
                    textType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // Password TextField
                  gocartTextField(
                    hint: "Password",
                    control: TextEditingController(),
                    pswd: true,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  // ---------- or -----------
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: screenWidth * 0.3,
                          height: 2,
                          color: Colors.black54,
                        ),
                        Text("  or  ",
                            style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.w500)),
                        Container(
                          width: screenWidth * 0.3,
                          height: 2,
                          color: Colors.black54,
                        ),
                      ]),
                ]),
              ),
              // Signup with Google Button
              InkWell(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        borderRadius: BorderRadius.circular(5)),
                    width: screenWidth * 0.7,
                    height: screenWidth * 0.14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://img.icons8.com/color/48/000000/google-logo.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          'Sign up with Google',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.06,
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Login Button
              coolButton(
                  text: "Register",
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.07,
                  textSize: screenWidth * 0.05,
                  functionToComply: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tellusmorePage()));
                  }),
              SizedBox(height: screenHeight * 0.02),
              // Dont have an account?
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account? "),
                    InkWell(
                        child: const Text("Login",
                            style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginPage()));
                        })
                  ]),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
