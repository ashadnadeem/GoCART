import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';

class addAddress extends StatefulWidget {
  addAddress({Key? key}) : super(key: key);

  @override
  State<addAddress> createState() => _addAddressState();
}

class _addAddressState extends State<addAddress> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const topBar(implyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Login Banner
            const headerBar(title: "Add Address"),
            SizedBox(height: screenHeight * 0.08),
            Container(
              width: screenHeight * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: Column(children: <Widget>[
                  // Name TextField
                  Row(children: const <Widget>[Text("  Title")]),
                  gocartTextField(
                      hint: "Title", control: TextEditingController()),
                  // Address TextField
                  Row(children: const <Widget>[Text("  Address")]),
                  gocartTextField(
                    hint: "Address",
                    control: TextEditingController(),
                    textType: TextInputType.streetAddress,
                  ),
                  // City TextField
                  Row(children: const <Widget>[Text("  City")]),
                  gocartTextField(
                    hint: "City",
                    control: TextEditingController(),
                  ),
                  // Zip Code TextField
                  Row(children: const <Widget>[Text("  Zip Code")]),
                  gocartTextField(
                    hint: "Zip Code",
                    textType: TextInputType.number,
                    control: TextEditingController(),
                  ),
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
            ),
            // Login Button
            coolButton(
                text: "Save",
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
