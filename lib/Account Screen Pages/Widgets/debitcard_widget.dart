import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:gocart/Account%20Screen%20Pages/Payment/U_EditCardForm.dart';
import 'package:gocart/Models/debitcard_model.dart';

// DebitCard Container
// ignore: must_be_immutable
class BankCard extends StatelessWidget {
  BankCard({required this.card, Key? key, this.options = true})
      : super(key: key);
  final DebitCard card;
  bool options;
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
    return Row(
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
            cardNumber: card.cardNumber,
            cardExpiry: card.expiryDate,
            cardHolderName: card.cardHolderName,
            cvv: card.cvv,
          ),
        ),
        options
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit_note_outlined,
                        size: screenSizeH * 0.04),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EditCard(),
                      ));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: IconButton(
                      icon: Icon(Icons.delete_forever_outlined,
                          color: Colors.red, size: screenSizeH * 0.04),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
