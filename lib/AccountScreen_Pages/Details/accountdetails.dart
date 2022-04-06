import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';

class accountDetails extends StatefulWidget {
  accountDetails({Key? key}) : super(key: key);

  @override
  State<accountDetails> createState() => _accountDetailsState();
}

class _accountDetailsState extends State<accountDetails> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const topBar(implyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: screenHeight * 0.02),
            // Login Banner
            headerBar(title: "Account Details"),
            SizedBox(height: screenHeight * 0.08),
            Container(
              width: screenHeight * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: Column(children: <Widget>[
                  // Name TextField
                  Row(children: const <Widget>[Text("  Name")]),
                  gocartTextField(
                      hint: "Name",
                      editable: false,
                      control: TextEditingController()..text = "Shaheer Ahmed"),
                  // Address TextField
                  Row(children: const <Widget>[Text("  Address")]),
                  gocartTextField(
                    hint: "Address",
                    control: TextEditingController()
                      ..text = "E-1103, Creek Vista Apartments",
                    textType: TextInputType.streetAddress,
                  ),
                  // City TextField
                  Row(children: const <Widget>[Text("  City")]),
                  gocartTextField(
                    hint: "City",
                    control: TextEditingController()..text = "Karachi",
                  ),
                  // Phone Number TextField
                  Row(children: const <Widget>[Text("  Phone Number")]),
                  gocartTextField(
                    hint: "Phone Number",
                    control: TextEditingController()..text = "0300 1234567",
                    textType: TextInputType.number,
                  ),
                ]),
              ),
            ),
            // Login Button
            coolButton(
                text: "Save",
                // width: screenWidth * 0.5,
                // height: screenHeight * 0.07,
                // textSize: screenWidth * 0.05,
                functionToComply: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      // bottomNavigationBar: const bottomBar(),
    );
  }
}
