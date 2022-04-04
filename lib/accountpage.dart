import 'package:flutter/material.dart';
import 'package:gocart/accountdetails.dart';
import 'package:gocart/paymentmethod.dart';
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
    return Scaffold(
      appBar: topBar(implyLeading: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'My Account',
              style: GoogleFonts.poppins(
                color: color1,
                fontSize: screenHeight * 0.05,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                coolCard(
                  text: 'Account Details',
                  functionToComply: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => accountDetails()));
                  },
                  iconData: Icons.account_circle_outlined,
                ),
                SizedBox(width: screenHeight * 0.01),
                coolCard(
                  text: 'Saved Addresses',
                  functionToComply: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => savedAddress()));
                  },
                  iconData: Icons.location_on_outlined,
                  primaryColor: color1,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                coolCard(
                  text: 'Payment Methods',
                  functionToComply: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => paymentMethods()));
                  },
                  iconData: Icons.account_balance_wallet_outlined,
                  primaryColor: color1,
                ),
                SizedBox(width: screenHeight * 0.01),
                coolCard(
                  text: 'Order History',
                  functionToComply: () {},
                  iconData: Icons.history_outlined,
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
