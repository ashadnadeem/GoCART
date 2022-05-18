import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';

import 'Screens/Main Screen Pages/checkout_page.dart';

class TryMe extends StatefulWidget {
  const TryMe({Key? key}) : super(key: key);

  @override
  State<TryMe> createState() => _TryMeState();
}

class _TryMeState extends State<TryMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Splash screen'),
            const Text('Delay'),
            const Text('Onboarding Screen'),
            const Text('Navigate to Login page'),
            logo(),
            gocartTextField(hint: "hint", control: TextEditingController()),
            ElevatedButton(
              onPressed: () {
                dialogs.showDeleteConfirmationDialog(context);
              },
              child: const Text('Try Dialog'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CheckoutPage()));
              },
              child: const Text("Checkout Page"),
            ),
            // ListTile(
            // onTap: () {
            //   Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => AssetsObject()));
            // },
            // title: Text("Custom sfb object"),
            // ),
          ],
        ),
      ),
    );
  }
}
