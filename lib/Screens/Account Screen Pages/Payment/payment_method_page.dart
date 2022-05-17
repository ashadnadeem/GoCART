// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/debitcard_provider.dart';
import '../../../Entities/debitcard_entity.dart';
import '../Widgets/debitcard_widget.dart';
import 'add_card_page.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  bool isfront = true;
  List<DebitCard> myCards = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myCards = context.watch<CardProvider>().Cards;
    final double screenHeight = MediaQuery.of(context).size.height;
    print(myCards.length);
    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const HeaderBar(title: "Payment Methods"),
            SizedBox(height: screenHeight * 0.03),
            for (var i = 0; i < myCards.length; i++) CardTile(myCards[i]),
            addCardButton(),
          ],
        ),
      ),
    );
  }

  Widget CardTile(card) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        child: BankCard(
          card: card,
          encrypt: true,
        ),
        onTap: () {
          setState(() {
            card.cardFront = !card.cardFront;
          });
        },
      ),
    );
  }

  Widget addCardButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: coolButton(
        text: "Add Card",
        functionToComply: () {
          isfront = !isfront;
          setState(() {});
          // Navigate to add Card page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCard(),
            ),
          );
        },
      ),
    );
  }
}
