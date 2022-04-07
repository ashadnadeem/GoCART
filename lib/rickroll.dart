import 'package:flutter/material.dart';
import 'package:gocart/main.dart';
import 'package:gocart/utils.dart';

class RickRoll extends StatelessWidget {
  const RickRoll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(implyLeading: true),
      body: Center(
        child: Container(
          height: 250,
          width: 350,
          decoration: const BoxDecoration(
            image: DecorationImage(image: NetworkImage(
                // "https://somelink",
                "https://i.imgflip.com/4whwu5.gif"), fit: BoxFit.scaleDown),
          ),
        ),
      ),
    );
  }
}
