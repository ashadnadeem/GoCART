import 'package:flutter/material.dart';
import 'package:gocart/Account%20Screen%20Pages/Order/order_tile_widget.dart';
import 'package:gocart/utils.dart';
import 'package:provider/provider.dart';
import '../../Models/item_provider.dart';
import '../../Models/order_model.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    Widget MyOrderList() {
      return Column(
        children: <Widget>[
          OrderTile(
            order: Order(
              id: "8146440301365158",
              status: "Shipped",
              quantity: 1,
              total: 7899,
              items: [
                context.watch<ItemProvider>().items[0],
              ],
            ),
            orderNum: 1,
          ),
          OrderTile(
            order: Order(
              id: "8146128327445158",
              status: "Delivered",
              quantity: 2,
              total: 57000,
              items: [
                context.watch<ItemProvider>().items[2],
                context.watch<ItemProvider>().items[3],
              ],
            ),
            orderNum: 2,
          )
        ],
      );
    }

    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: Column(
        children: <Widget>[
          const HeaderBar(title: "Order History"),
          SizedBox(height: screenHeight * 0.05),
          SingleChildScrollView(
            child: MyOrderList(),
          ),
        ],
      ),
    );
  }
}
