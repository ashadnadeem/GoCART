import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Controllers/user_provider.dart';
import '../../utils.dart';
import '../Main Screen Pages/main_page.dart';
import '../success_screen.dart';

class TellUsMorePage extends StatefulWidget {
  const TellUsMorePage({Key? key}) : super(key: key);

  @override
  State<TellUsMorePage> createState() => _TellUsMorePageState();
}

class _TellUsMorePageState extends State<TellUsMorePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    void _register() {
      if (_nameController.text.isEmpty ||
          _addressController.text.isEmpty ||
          _cityController.text.isEmpty ||
          _phoneController.text.isEmpty) {
        // Blank Details
        dialogs.errorDialog(context, "Error", "Please fill all the fields");
      } else {
        // Update in UserProfile
        context.read<UserProvider>().updateUserInfo(
            name: _nameController.text,
            address: _addressController.text,
            city: _cityController.text,
            phone: _phoneController.text);
        context.read<UserProvider>().saveChanges();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const SuccessScreen(nextPage: MainPage())));
      }
    }

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
              SizedBox(
                width: screenHeight * 0.8,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                  child: Column(children: <Widget>[
                    // Name TextField
                    gocartTextField(hint: "Name", control: _nameController),
                    // Address TextField
                    gocartTextField(
                      hint: "Address",
                      control: _addressController,
                      textType: TextInputType.streetAddress,
                    ),
                    // City TextField
                    gocartTextField(
                      hint: "City",
                      control: _cityController,
                    ),
                    // Phone Number TextField
                    gocartTextField(
                      hint: "Phone Number",
                      control: _phoneController,
                      textType: TextInputType.number,
                    ),
                  ]),
                ),
              ),
              // Register Button
              coolButton(text: "Register", functionToComply: _register),
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
                                  builder: (context) => const MainPage()));
                        })
                  ]),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
