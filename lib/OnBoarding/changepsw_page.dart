import 'package:flutter/material.dart';
import 'package:gocart/OnBoarding/login_page.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class changepsw extends StatefulWidget {
  changepsw({Key? key}) : super(key: key);

  @override
  State<changepsw> createState() => _changepsw();
}

class _changepsw extends State<changepsw> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: screenHeight * 0.8,
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: Column(children: <Widget>[
                SizedBox(height: screenHeight * 0.05),
                // Logo
                logo(),
                SizedBox(height: screenHeight * 0.03),
                // Reset pwd Banner
                Text(
                  'Reset Password',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 59, 59, 61),
                    fontSize: screenHeight * 0.05,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                // Pswd TextField
                gocartTextField(
                  hint: "New Password",
                  control: TextEditingController(),
                  pswd: true,
                ),
                // Password TextField
                gocartTextField(
                  hint: "Confirm Password",
                  control: TextEditingController(),
                  pswd: true,
                ),
                // Reset Button
                coolButton(
                    text: "Reset",
                    functionToComply: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => loginPage()));
                      // Navigator.pop(context);
                    }),
                const SizedBox(height: 10),
              ]),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
