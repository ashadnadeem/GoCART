import 'package:flutter/material.dart';
import 'package:gocart/OnBoarding/changepsw_page.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class forgotpsw extends StatefulWidget {
  forgotpsw({Key? key}) : super(key: key);

  @override
  State<forgotpsw> createState() => _forgotpswState();
}

class _forgotpswState extends State<forgotpsw> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenHeight * 0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.2),
                // Logo
                logo(),
                SizedBox(height: screenHeight * 0.1),
                Text(
                  'Forgot your password? No worries. Just fill in your email and we\'ll send you a link to reset your password.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 59, 59, 61),
                    fontSize: screenHeight * 0.03,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                // Email TextField
                gocartTextField(
                    hint: "Email",
                    control: TextEditingController(),
                    textType: TextInputType.emailAddress),

                // Send Button
                coolButton(text: "Send", functionToComply: _sendEmail),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendEmail() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => changepsw()));
    // Navigator.pop(context);
  }
}
