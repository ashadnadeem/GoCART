import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';

class EditCard extends StatelessWidget {
  const EditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(implyLeading: true),
      body: Center(
        child: Text("EditCard"),
      ),
    );
  }
}
