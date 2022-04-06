import 'package:flutter/material.dart';
import 'package:gocart/AccountScreen_Pages/Payment/addcard.dart';
import 'package:gocart/utils.dart';

class paymentMethods extends StatefulWidget {
  paymentMethods({Key? key}) : super(key: key);

  @override
  State<paymentMethods> createState() => _paymentMethodsState();
}

class _paymentMethodsState extends State<paymentMethods> {
  bool isfront = true;
  DebitCard? card1, card2, card3;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    card1 = DebitCard(
      cardNumber: "6216 5100 5100 5100",
      cardHolderName: "Ashad Nadeem",
      expiryDate: "12/26",
      cvv: "123",
    );
    card2 = DebitCard(
      cardNumber: "5245 4444 4444 4444",
      cardHolderName: "Ameer Party",
      expiryDate: "12/23",
      cvv: "456",
    );
    card3 = DebitCard(
      cardNumber: "4224 5100 5100 5100",
      cardHolderName: "Waderey Ka Beta",
      expiryDate: "12/24",
      cvv: "789",
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const topBar(implyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const headerBar(title: "Payment Methods"),
            SizedBox(height: screenHeight * 0.03),
            Container(
              width: screenHeight * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: <Widget>[
                    // Card1
                    InkWell(
                      child: bankCard(
                        card: card1!,
                      ),
                      onTap: () {
                        setState(() {
                          card1!.cardFront = !card1!.cardFront;
                        });
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Card2
                    InkWell(
                      child: bankCard(
                        card: card2!,
                      ),
                      onTap: () {
                        setState(() {
                          card2!.cardFront = !card2!.cardFront;
                        });
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Card3
                    InkWell(
                      child: bankCard(
                        card: card3!,
                      ),
                      onTap: () {
                        setState(() {
                          card3!.cardFront = !card3!.cardFront;
                        });
                      },
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    coolButton(
                      text: "Add Card",
                      functionToComply: () {
                        isfront = !isfront;
                        setState(() {});
                        // Navigate to add Card page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => addCard(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const bottomBar(),
    );
  }
}
