import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';

class addCard extends StatefulWidget {
  addCard({Key? key}) : super(key: key);

  @override
  State<addCard> createState() => _addCardState();
}

class _addCardState extends State<addCard> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _nameOnCardController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool back = false;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    DebitCard card1 = DebitCard(
      cardNumber: _cardNumberController.text,
      expiryDate: _expiryDateController.text,
      cvv: _cvvController.text,
      cardHolderName: _nameOnCardController.text,
      bankName: _bankNameController.text,
      cardFront: !back,
    );
    return Scaffold(
      appBar: const topBar(implyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Login Banner
            const headerBar(title: "Add a Card"),
            SizedBox(height: screenHeight * 0.03),
            bankCard(
              options: false,
              card: card1,
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              width: screenHeight * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: Column(children: <Widget>[
                  // Name TextField
                  Row(children: const <Widget>[Text("  Card Holder Name")]),
                  gocartTextField(
                    hint: "Name",
                    control: _nameOnCardController,
                    onChangedFunction: (value) {
                      back = false;
                      card1.cardHolderName = value;
                      setState(() {});
                    },
                  ),
                  // Address TextField
                  Row(children: const <Widget>[Text("  Card Number")]),
                  gocartTextField(
                    hint: "Number",
                    control: _cardNumberController,
                    textType: TextInputType.number,
                    length: 13,
                    onChangedFunction: (value) {
                      back = false;
                      card1.cardNumber = value;
                      setState(() {});
                    },
                  ),
                  // City TextField
                  Row(children: const <Widget>[Text("  Bank Name")]),
                  gocartTextField(
                    hint: "Safe Bank",
                    control: _bankNameController,
                    onChangedFunction: (value) {
                      back = false;
                      card1.bankName = value;
                      setState(() {});
                    },
                  ),
                  // Zip Code TextField
                  Row(children: const <Widget>[Text("  Expiry Date")]),
                  gocartTextField(
                    hint: "MM/YY",
                    textType: TextInputType.text,
                    control: _expiryDateController,
                    onChangedFunction: (value) {
                      back = false;
                      card1.expiryDate = value;
                      setState(() {});
                    },
                  ),
                  // Phone Number TextField
                  Row(children: const <Widget>[Text("  Cvv")]),
                  gocartTextField(
                    hint: "cvv",
                    control: _cvvController,
                    textType: TextInputType.number,
                    onChangedFunction: (value) {
                      back = true;
                      card1.cardHolderName = value;
                      setState(() {});
                    },
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
