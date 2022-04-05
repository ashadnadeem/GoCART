import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: topBar(implyLeading: true),
      body: Center(
        child: Text("Edit Address"),
      ),
    );
  }
}
