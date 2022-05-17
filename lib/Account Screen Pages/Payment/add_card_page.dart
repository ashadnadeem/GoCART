import 'package:flutter/material.dart';
import 'package:gocart/Account%20Screen%20Pages/Widgets/debitcard_widget.dart';
import 'package:gocart/Controllers/debitcard_provider.dart';
import 'package:gocart/utils.dart';
import 'package:provider/provider.dart';

import '../../Entities/debitcard_entity.dart';
import '../../Controllers/user_provider.dart';

class AddCard extends StatefulWidget {
  AddCard({Key? key, this.card}) : super(key: key);
  DebitCard? card;
  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _nameOnCardController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  late DebitCard card;
  String title = "Add Card";
  @override
  void initState() {
    super.initState();
    // If there is a card Passing means editing
    if (widget.card != null) {
      title = "Edit Card";
      card = widget.card!;
      _cardNumberController.text = "*" * 12 + card.cardNumber.substring(12, 16);
      _nameOnCardController.text = card.cardHolderName;
      _expiryDateController.text = card.expiryDate;
      _cvvController.text = "";
      _bankNameController.text = card.bankName;
    } else {
      card = DebitCard(
          cardNumber: "", cardHolderName: "", expiryDate: "", cvv: "");
    }
  }

  bool back = false;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    card.cardNumber = _cardNumberController.text;
    card.cardHolderName = _nameOnCardController.text;
    card.expiryDate = _expiryDateController.text;
    card.cvv = _cvvController.text;
    card.bankName = _bankNameController.text;
    card.cardFront = !back;

    void _saveButton() async {
      card.cardNumber = _cardNumberController.text;
      card.cardHolderName = _nameOnCardController.text;
      card.expiryDate = _expiryDateController.text;
      card.cvv = _cvvController.text;
      card.bankName = _bankNameController.text;
      // Check if edit or add
      if (widget.card != null) {
        // Edit
        context.read<CardProvider>().updateCard(card);
      } else {
        // Add a new card
        var cardid = await context.read<CardProvider>().addCard(card);
        // Link the card to the user
        context.read<UserProvider>().addNewCard(cardid);
        // Save changes to the user
        context.read<UserProvider>().saveChanges();
      }
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Login Banner
            HeaderBar(title: title),
            SizedBox(height: screenHeight * 0.03),
            BankCard(
              options: false,
              card: card,
            ),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(
              width: screenHeight * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: Column(
                  children: <Widget>[
                    // Name TextField
                    Row(children: const <Widget>[Text("  Card Holder Name")]),
                    gocartTextField(
                      hint: "Name",
                      control: _nameOnCardController,
                      onChangedFunction: (value) {
                        back = false;
                        card.cardHolderName = value;
                        setState(() {});
                      },
                    ),
                    // Card Number TextField
                    Row(children: const <Widget>[Text("  Card Number")]),
                    gocartTextField(
                      hint: "Number",
                      control: _cardNumberController,
                      textType: TextInputType.number,
                      length: 16,
                      onChangedFunction: (value) {
                        back = false;
                        card.cardNumber = value;
                        setState(() {});
                      },
                    ),
                    // Bank Name TextField
                    Row(children: const <Widget>[Text("  Bank Name")]),
                    gocartTextField(
                      hint: "Safe Bank",
                      control: _bankNameController,
                      onChangedFunction: (value) {
                        back = false;
                        card.bankName = value;
                        setState(() {});
                      },
                    ),
                    // Expiry TextField
                    Row(children: const <Widget>[Text("  Expiry Date")]),
                    gocartTextField(
                      hint: "MM/YY",
                      textType: TextInputType.text,
                      control: _expiryDateController,
                      onChangedFunction: (value) {
                        back = false;
                        card.expiryDate = value;
                        setState(() {});
                      },
                    ),
                    // Cvv TextField
                    Row(children: const <Widget>[Text("  Cvv")]),
                    gocartTextField(
                      hint: "cvv",
                      control: _cvvController,
                      textType: TextInputType.number,
                      length: 3,
                      onChangedFunction: (value) {
                        back = true;
                        card.cardHolderName = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
            // Login Button
            coolButton(text: "Save", functionToComply: _saveButton),
          ],
        ),
      ),
      // bottomNavigationBar: const bottomBar(),
    );
  }
}
