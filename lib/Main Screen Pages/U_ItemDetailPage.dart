import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: topBar(implyLeading: true),
      body: Center(
        child: Text("Item Details"),
      ),
    );
  }
}
