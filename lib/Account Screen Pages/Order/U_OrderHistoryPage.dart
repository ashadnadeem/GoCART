import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(implyLeading: true),
      body: Center(
        child: Text("Order History"),
      ),
    );
  }
}
