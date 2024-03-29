import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';
import 'Services/auth.dart';

class RickRoll extends StatefulWidget {
  const RickRoll({Key? key}) : super(key: key);

  @override
  State<RickRoll> createState() => _RickRollState();
}

class _RickRollState extends State<RickRoll> {
  @override
  Widget build(BuildContext context) {
    final _auth = AuthService();
    return Scaffold(
      appBar: const MyAppBar(implyLeading: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(image: NetworkImage(
                    // "https://somelink",
                    "https://i.imgflip.com/4whwu5.gif"), fit: BoxFit.scaleDown),
              ),
            ),
            coolButton(
              text: "Logout",
              functionToComply: () async {
                // logout
                await _auth.signOut();
                // pop until login page
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            )
          ],
        ),
      ),
    );
  }
}
