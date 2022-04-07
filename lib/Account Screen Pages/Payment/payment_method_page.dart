import 'package:flutter/material.dart';
import 'package:gocart/Account%20Screen%20Pages/Payment/add_card_page.dart';
import 'package:gocart/Account%20Screen%20Pages/Widgets/debitcard_widget.dart';
import 'package:gocart/Models/debitcard_model.dart';
import 'package:gocart/utils.dart';

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
    myCards.add(DebitCard(
      cardNumber: "6216510051005100",
      cardHolderName: "Ashad Nadeem",
      expiryDate: "12/26",
      cvv: "123",
    ));
    myCards.add(DebitCard(
      cardNumber: "5245444444444444",
      cardHolderName: "Ameer Party",
      expiryDate: "12/23",
      cvv: "456",
    ));
    myCards.add(DebitCard(
      cardNumber: "4224510051005100",
      cardHolderName: "Waderey Ka Beta",
      expiryDate: "12/24",
      cvv: "789",
    ));
  }

  @override
  Widget build(BuildContext context) {
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
