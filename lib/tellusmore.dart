import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gocart/homepage.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Login.dart';

class tellusmorePage extends StatefulWidget {
  tellusmorePage({Key? key}) : super(key: key);

  @override
  State<tellusmorePage> createState() => _tellusmorePageState();
}

class _tellusmorePageState extends State<tellusmorePage> {
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
                'Tell Us More',
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 59, 59, 61),
                  fontSize: screenHeight * 0.05,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Container(
                width: screenHeight * 0.8,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                  child: Column(children: <Widget>[
                    // Name TextField
                    gocartTextField(
                        hint: "Name", control: TextEditingController()),
                    // Address TextField
                    gocartTextField(
                      hint: "Address",
                      control: TextEditingController(),
                      textType: TextInputType.streetAddress,
                    ),
                    // City TextField
                    gocartTextField(
                      hint: "City",
                      control: TextEditingController(),
                    ),
                    // Phone Number TextField
                    gocartTextField(
                      hint: "Phone Number",
                      control: TextEditingController(),
                      textType: TextInputType.number,
                    ),
                  ]),
                ),
              ),
              // Login Button
              coolButton(
                  text: "Register",
                  functionToComply: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => homePage()));
                  }),
              SizedBox(height: screenHeight * 0.02),
              // Fill Details Later?
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text("Want to setup later? "),
                    InkWell(
                        child: const Text("Skip",
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
