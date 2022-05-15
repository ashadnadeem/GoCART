import 'package:flutter/material.dart';
import 'package:gocart/Services/auth.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class forgotpsw extends StatefulWidget {
  forgotpsw({Key? key}) : super(key: key);

  @override
  State<forgotpsw> createState() => _forgotpswState();
}

class _forgotpswState extends State<forgotpsw> {
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    void _sendEmail() async {
      var response = await _auth.resetPassword(_emailController.text.trim());
      if (response is String) {
        print(response);
        // Show error message
        dialogs.errorToast(
            error: TextFormatter.firebaseError(response.toString()));
      } else {
        // Navigate to Home Page
        Navigator.pop(context);
      }
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => changepsw()));
    }

    Widget mainBody() {
      final double screenHeight = MediaQuery.of(context).size.height;
      return Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
        child: Column(
          children: <Widget>[
            Text(
              'Forgot your password? No worries. Just fill in your email and we\'ll send you a link to reset your password.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 59, 59, 61),
                fontSize: screenHeight * 0.025,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            // Email TextField
            gocartTextField(
                hint: "Email",
                control: _emailController,
                textType: TextInputType.emailAddress),
          ],
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.05),
              // Logo
              logo(),
              SizedBox(height: screenHeight * 0.03),
              // Main Body
              mainBody(),
              // Send Button
              coolButton(text: "Send", functionToComply: _sendEmail),
            ],
          ),
        ),
      ),
    );
  }
}
