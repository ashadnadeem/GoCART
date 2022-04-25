import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/home_page.dart';
import 'package:gocart/Models/user_model.dart';
import 'package:gocart/Models/user_provider.dart';
import 'package:gocart/OnBoarding%20Pages/tellusmore_page.dart';
import 'package:gocart/Services/auth.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Main Screen Pages/main_page.dart';
import '../success_screen.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProfile?>(context);
    print(user);
    final double screenHeight = MediaQuery.of(context).size.height;

    Widget SignUpWithGoogle() {
      return // Signup with Google Button
          InkWell(
        onTap: () async {
          // Google Signup
          // Anonymous Signin
          // dynamic res = await _auth.signInAnon();
          // Google Signin
          dynamic res = await _auth.signInWithGoogle();
          // Check if result is of type UserProfile
          if (res is UserProfile) {
            // Navigate to Home Page
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SuccessScreen(nextPage: MainPage()),
            ));
          } else {
            // Show error message
            dialogs.errorDialog(
                context, "Try again", res.toString().split("]").last.trim());
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.09),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(5)),
              // width: screenHeight * 0.1,
              height: screenHeight * 0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenHeight * 0.05,
                    height: screenHeight * 0.05,
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Sign up with Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.02,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      );
    }

    Widget AlreadyHaveAccount() {
      return Row(
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
                          builder: (context) => const LoginPage()));
                })
          ]);
    }

    Widget orSeparator() {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 2,
                color: Colors.black54,
              ),
            ),
            Text("  or  ",
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontSize: screenHeight * 0.04,
                    fontWeight: FontWeight.w500)),
            Expanded(
              child: Container(
                height: 2,
                color: Colors.black54,
              ),
            ),
          ]);
    }

    void Register() async {
      // Signup Using Email and Password
      dynamic result = await _auth.registerWithEmailAndPassword(
          _emailController.text, _passwordController.text);
      // Check if result is of type UserProfile
      if (result is UserProfile) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TellUsMorePage()));
      } else {
        // Show error
        dialogs.errorDialog(
            context, "Try again", result.toString().split("]").last.trim());
      }
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: screenHeight * 0.8,
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
                    fontSize: screenHeight * 0.05,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                  child: Column(children: <Widget>[
                    // Email TextField
                    gocartTextField(
                      hint: "Email",
                      control: _emailController,
                      textType: TextInputType.emailAddress,
                    ),
                    // Password TextField
                    gocartTextField(
                      hint: "Password",
                      control: _passwordController,
                      pswd: true,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    coolButton(
                      text: "Register",
                      functionToComply: Register,
                    ),
                    // ---------- or -----------
                    orSeparator(),
                  ]),
                ),
                SignUpWithGoogle(),
                SizedBox(height: screenHeight * 0.04),
                // Dont have an account?
                AlreadyHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
