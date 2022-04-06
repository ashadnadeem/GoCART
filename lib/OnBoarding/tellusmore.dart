import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gocart/MainScreen_Pages/mainPage.dart';
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
          child: Container(
            width: screenHeight * 0.8,
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //SizedBox(height: screenHeight * 0.1),
                  // Logo
                  Hero(
                    tag: 'logo',
                    child: logo(
                      fontSize: screenHeight * 0.06,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // Login Banner
                  Hero(
                    tag: 'main text',
                    child: Text(
                      'Tell Us More',
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 59, 59, 61),
                        fontSize: screenHeight * 0.07,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.06),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, bottom: 10),
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
                  SizedBox(height: screenHeight * 0.02),
                  // Login Button
                  Hero(
                    tag: 'onBoarding Button',
                    child: coolButton(
                        text: "Finish",
                        functionToComply: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homePage()));
                        }),
                  ),
                  const SizedBox(height: 10),
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
                                      builder: (context) => homePage()));
                            })
                      ]),
                ],
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
