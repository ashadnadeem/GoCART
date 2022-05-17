import 'package:flutter/material.dart';
import 'package:gocart/Account%20Screen%20Pages/Address/saved_address_page.dart';
import 'package:gocart/Account%20Screen%20Pages/Details/account_details_page.dart';
import 'package:gocart/Account%20Screen%20Pages/Order/OrderHistoryPage.dart';
import 'package:gocart/Account%20Screen%20Pages/Payment/payment_method_page.dart';
import 'package:gocart/Account%20Screen%20Pages/Widgets/settings_cards_widget.dart';

import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Controllers/user_provider.dart';

class AccountMain extends StatefulWidget {
  const AccountMain({Key? key}) : super(key: key);

  @override
  State<AccountMain> createState() => _AccountMainState();
}

class _AccountMainState extends State<AccountMain> {
  final Color color1 = const Color.fromARGB(255, 59, 59, 61);
  final Color color2 = const Color.fromARGB(255, 232, 72, 85);
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final userProfile = context.watch<UserProvider>().userProfile;
    return Scaffold(
      appBar: const MyAppBar(implyLeading: true),
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
                AccountSettingCard(
                  text: 'Account Details',
                  functionToComply: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AccountDetails(userProfile: userProfile)));
                  },
                  iconData: Icons.account_circle_outlined,
                ),
                SizedBox(width: screenHeight * 0.01),
                AccountSettingCard(
                  text: 'Saved Addresses',
                  functionToComply: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SavedAddress()));
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
                AccountSettingCard(
                  text: 'Payment Methods',
                  functionToComply: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PaymentMethods()));
                  },
                  iconData: Icons.account_balance_wallet_outlined,
                  primaryColor: color1,
                ),
                SizedBox(width: screenHeight * 0.01),
                AccountSettingCard(
                  text: 'Order History',
                  functionToComply: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OrderHistoryPage(),
                    ));
                  },
                  iconData: Icons.history_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const bottomBar(),
    );
  }
}
