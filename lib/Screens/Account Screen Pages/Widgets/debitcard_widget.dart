import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/debitcard_provider.dart';
import '../../../Controllers/user_provider.dart';
import '../../../Entities/debitcard_entity.dart';
import '../Payment/add_card_page.dart';

// DebitCard Container
// ignore: must_be_immutable
class BankCard extends StatelessWidget {
  BankCard(
      {required this.card, this.encrypt = false, Key? key, this.options = true})
      : super(key: key);
  final DebitCard card;
  bool encrypt;
  bool options;
  String cardEncrypt(String cardNumber) {
    // Put * and display only last 4 digits
    String card = '';
    card = cardNumber.substring(0, 4) +
        "*" * 8 +
        cardNumber.substring(cardNumber.length - 4, cardNumber.length);
    return card;
  }

  @override
  Widget build(BuildContext context) {
    final double screenSizeH = MediaQuery.of(context).size.height;
    Color cardColor;
    if (getCardType(card.cardNumber) == CardType.visa) {
      // Visa
      cardColor = Colors.red.shade900;
    } else if (getCardType(card.cardNumber) == CardType.masterCard) {
      // MasterCard
      cardColor = Colors.blueGrey;
    } else if (getCardType(card.cardNumber) == CardType.maestro) {
      // Union Pay
      cardColor = Colors.purple.shade900;
    } else {
      // Unknown
      cardColor = Colors.black;
    }

    Widget deleteButton() {
      return IconButton(
        icon: Icon(Icons.delete_forever_outlined,
            color: Colors.red, size: screenSizeH * 0.04),
        onPressed: () {
          // Delete Address from Firebase and Delink from User
          context.read<CardProvider>().deleteCard(card);
          context.read<UserProvider>().removeCard(card.id);
          context.read<UserProvider>().saveChanges();
        },
      );
    }

    Widget editButton() {
      return IconButton(
        icon: Icon(Icons.edit_note_outlined, size: screenSizeH * 0.04),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddCard(card: card),
          ));
        },
      );
    }

    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CreditCard(
              width: screenSizeH * 0.45,
              height: screenSizeH * 0.26,
              // frontBackground: CardBackgrounds.black,
              frontBackground: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: cardColor,
              ),
              backBackground: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: cardColor,
              ), //Color(0xffF9F9FA)
              cardType: getCardType(card.cardNumber),
              // cardType: CardType.discover,
              showShadow: true,
              bankName: card.bankName,
              showBackSide: !card.cardFront,
              cardNumber:
                  encrypt ? cardEncrypt(card.cardNumber) : card.cardNumber,
              cardExpiry: card.expiryDate,
              cardHolderName: card.cardHolderName,
              cvv: card.cvv,
            ),
          ),
          options
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    editButton(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: deleteButton(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
