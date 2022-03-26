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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo
            logo(),
            const SizedBox(height: 40),
            // Login Banner
            Text(
              'Tell Us More',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 59, 59, 61),
                fontSize: 48,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: Column(children: <Widget>[
                // Name TextField
                gocartTextField(hint: "Name", control: TextEditingController()),
                const SizedBox(height: 40),
                // Address TextField
                gocartTextField(
                  hint: "Address",
                  control: TextEditingController(),
                  textType: TextInputType.streetAddress,
                ),
                const SizedBox(height: 40),
                // City TextField
                gocartTextField(
                  hint: "City",
                  control: TextEditingController(),
                ),
                const SizedBox(height: 40),
                // Phone Number TextField
                gocartTextField(
                  hint: "Phone Number",
                  control: TextEditingController(),
                  textType: TextInputType.number,
                ),
                const SizedBox(height: 10),
              ]),
            ),
            // Login Button
            coolButton(
                text: "Register",
                width: 252,
                height: 70,
                functionToComply: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homePage()));
                }),
            const SizedBox(height: 10),
            // Dont have an account?
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
