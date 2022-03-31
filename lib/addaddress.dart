import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gocart/homepage.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Login.dart';

class addAddress extends StatefulWidget {
  addAddress({Key? key}) : super(key: key);

  @override
  State<addAddress> createState() => _addAddressState();
}

class _addAddressState extends State<addAddress> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const topBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Login Banner
            const headerBar(title: "Add Address"),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: Column(children: <Widget>[
                // Name TextField
                Row(children: const <Widget>[Text("  Title")]),
                gocartTextField(
                    hint: "Title", control: TextEditingController()),
                SizedBox(height: screenHeight * 0.03),
                // Address TextField
                Row(children: const <Widget>[Text("  Address")]),
                gocartTextField(
                  hint: "Address",
                  control: TextEditingController(),
                  textType: TextInputType.streetAddress,
                ),
                SizedBox(height: screenHeight * 0.03),
                // City TextField
                Row(children: const <Widget>[Text("  City")]),
                gocartTextField(
                  hint: "City",
                  control: TextEditingController(),
                ),
                SizedBox(height: screenHeight * 0.03),
                // Zip Code TextField
                Row(children: const <Widget>[Text("  Zip Code")]),
                gocartTextField(
                  hint: "Zip Code",
                  textType: TextInputType.number,
                  control: TextEditingController(),
                ),
                SizedBox(height: screenHeight * 0.03),
                // Phone Number TextField
                Row(children: const <Widget>[Text("  Phone Number")]),
                gocartTextField(
                  hint: "Phone Number",
                  control: TextEditingController(),
                  textType: TextInputType.number,
                ),
                SizedBox(height: screenHeight * 0.02),
              ]),
            ),
            // Login Button
            coolButton(
                text: "Save",
                width: screenWidth * 0.5,
                height: screenHeight * 0.07,
                textSize: screenWidth * 0.05,
                functionToComply: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      bottomNavigationBar: const bottomBar(),
    );
  }
}
