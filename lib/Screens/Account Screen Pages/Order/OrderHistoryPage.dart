// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';
import 'package:provider/provider.dart';

import '../../../Models/order_history_model.dart';
import '../../../Models/order_history_provider.dart';
import 'order_tile_widget.dart';

// ignore: must_be_immutable
class OrderHistoryPage extends StatelessWidget {
  OrderHistoryPage({Key? key}) : super(key: key);
  List<OrderHistory> history = [];
  // List<String> id = [];
  @override
  Widget build(BuildContext context) {
    // Get the Order history from the provider
    // history = context.read<OrderHistoryProvider>().items;
    history = context.watch<OrderHistoryProvider>().hisotry;
    // id = context.read<UserProvider>().userProfile.orderHistoryIDs;

    final double screenHeight = MediaQuery.of(context).size.height;
    // ignore: non_constant_identifier_names
    Widget MyOrderList() {
      print(history.length);
      return Column(
        children: <Widget>[
          // OrderTile for each order in the history
          // This is Equalent to ListView.builder
          // ie: just making a list of OrderTile
          for (var item in history) OrderTile(order: item),
        ],
      );
    }

    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const HeaderBar(title: "Order History"),
            SizedBox(height: screenHeight * 0.03),
            SingleChildScrollView(
              // Build a List of the Orders
              child: MyOrderList(),
            ),
          ],
        ),
      ),
    );
  }
}
