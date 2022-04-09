import 'package:gocart/Models/item_model.dart';

class OrderHistory {
  OrderHistory({
    required this.orderID,
    required this.status,
    required this.quantity,
    required this.total,
    required this.cart,
  });

  final String orderID;
  final String status;
  final int quantity;
  final int total;
  final List<Item> cart;
}
