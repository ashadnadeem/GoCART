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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo
            logo(),
            const SizedBox(height: 70),
            // Login Banner
            Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 59, 59, 61),
                fontSize: 64,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: Column(children: <Widget>[
                // Email TextField
                gocartTextField(
                  hint: "Email",
                  control: TextEditingController(),
                  textType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 40),
                // Password TextField
                gocartTextField(
                  hint: "Password",
                  control: TextEditingController(),
                  pswd: true,
                ),
                const SizedBox(height: 10),
                // ---------- or -----------
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 2,
                        color: Colors.black,
                      ),
                      Text("  or  ",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                      Container(
                        width: 150,
                        height: 2,
                        color: Colors.black,
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
                  width: 350,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 65,
                        height: 65,
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
                      const SizedBox(width: 10),
                      const Text(
                        'Sign up with Google',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(height: 10),
            // Login Button
            coolButton(
                text: "Register",
                width: 252,
                height: 70,
                functionToComply: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => tellusmorePage()));
                }),
            const SizedBox(height: 10),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
