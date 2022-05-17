import 'package:flutter/material.dart';
import 'package:gocart/Screens/OnBoarding%20Pages/signup_page.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Entities/user_auth_entity.dart';
import '../../Services/auth.dart';
import '../Main Screen Pages/main_page.dart';
import '../success_screen.dart';
import 'forgotpsw.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final _auth = AuthService();

    void signin() async {
      // Signin with Email and Password
      dynamic result = await _auth.signInWithEmailAndPassword(
          _emailController.text.trim(), _passwordController.text.trim());
      // Check if result is of type UserProfile
      if (result is UserAuth) {
        // Navigate to Home Page
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SuccessScreen(
            nextPage: MainPage(),
          ),
        ));
      } else {
        // Show error message
        dialogs.errorToast(
            error: TextFormatter.firebaseError(result.toString()));
      }
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
              // Login Banner
              Text(
                'Login',
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 59, 59, 61),
                  fontSize: screenHeight * 0.05,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              SizedBox(
                width: screenHeight * 0.8,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                  child: Column(children: <Widget>[
                    // Email TextField
                    gocartTextField(
                        hint: "Email",
                        control: _emailController,
                        textType: TextInputType.emailAddress),
                    // Password TextField
                    gocartTextField(
                      hint: "Password",
                      control: _passwordController,
                      pswd: true,
                    ),
                    // Forgot Password
                    forgetPassword(),
                  ]),
                ),
              ),
              // Login Button
              coolButton(
                text: "Login",
                functionToComply: signin,
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupPage()));
                        })
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget forgetPassword() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      InkWell(
          child: const Text(
            "Forget Password?",
            style: TextStyle(
                color: Colors.red, decoration: TextDecoration.underline),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ForgetPSW()));
          })
    ]);
  }
}
