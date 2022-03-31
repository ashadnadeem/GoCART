import 'package:flutter/material.dart';
import 'package:gocart/addaddress.dart';
import 'package:gocart/utils.dart';

class savedAddress extends StatefulWidget {
  savedAddress({Key? key}) : super(key: key);

  @override
  State<savedAddress> createState() => _savedAddressState();
}

class _savedAddressState extends State<savedAddress> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const topBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const headerBar(title: "Saved Address"),
            addressTile(
              defaultAddress: true,
              address: Address(
                name: "Default Address",
                address: "E-1103, Creek Vista Apartments, DHA",
                city: "Karachi",
                phone: "+92 343 5301300",
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            addressTile(
              address: Address(
                name: "My Home",
                address: "E-1103, Creek Vista Apartments, DHA",
                city: "Karachi",
                phone: "+92 343 5301300",
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            addressTile(
              address: Address(
                name: "Ashad's Home",
                address: "4B/1 1st Central Lane DHA",
                city: "Karachi",
                phone: "+92 308 26380000",
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            coolButton(
              text: "Add Address",
              width: screenWidth * 0.45,
              height: screenHeight * 0.07,
              textSize: screenWidth * 0.05,
              functionToComply: () {
                // Navigate to add address page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => addAddress(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: const bottomBar(),
    );
  }
}
