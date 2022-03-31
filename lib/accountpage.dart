import 'package:flutter/material.dart';
import 'package:gocart/accountdetails.dart';
import 'package:gocart/savedaddress.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class myAccount extends StatefulWidget {
  myAccount({Key? key}) : super(key: key);

  @override
  State<myAccount> createState() => _myAccountState();
}

class _myAccountState extends State<myAccount> {
  final Color color1 = const Color.fromARGB(255, 59, 59, 61);
  final Color color2 = const Color.fromARGB(255, 232, 72, 85);
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: topBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'My Account',
              style: GoogleFonts.poppins(
                color: color1,
                fontSize: screenWidth * 0.1,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                coolButton(
                  text: 'Account Details',
                  width: screenWidth * 0.41,
                  height: screenHeight * 0.18,
                  functionToComply: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => accountDetails()));
                  },
                  iconData: Icons.account_circle_outlined,
                  iconSize: screenWidth * 0.12,
                  textSize: screenWidth * 0.06,
                ),
                SizedBox(width: screenWidth * 0.01),
                coolButton(
                  text: 'Saved Addresses',
                  width: screenWidth * 0.41,
                  height: screenHeight * 0.18,
                  functionToComply: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => savedAddress()));
                  },
                  iconData: Icons.location_on_outlined,
                  iconSize: screenWidth * 0.12,
                  textSize: screenWidth * 0.06,
                  primaryColor: color1,
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                coolButton(
                  text: 'Payment Methods',
                  width: screenWidth * 0.41,
                  height: screenHeight * 0.18,
                  functionToComply: () {},
                  iconData: Icons.account_balance_wallet_outlined,
                  iconSize: screenWidth * 0.12,
                  textSize: screenWidth * 0.06,
                  primaryColor: color1,
                ),
                SizedBox(width: screenWidth * 0.01),
                coolButton(
                  text: 'Order History',
                  width: screenWidth * 0.41,
                  height: screenHeight * 0.18,
                  functionToComply: () {},
                  iconData: Icons.history_outlined,
                  iconSize: screenWidth * 0.12,
                  textSize: screenWidth * 0.06,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const bottomBar(),
    );
  }
}
