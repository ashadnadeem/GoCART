import 'package:gocart/Entities/cart_entity.dart';

import '../Entities/item_entity.dart';

class OrderHistory {
  OrderHistory({
    // required this.cart,
    // required this.orderID,
    // required this.status,
    // required this.paymentMethod,
    // required this.deliveryAddress,
    required this.orderID,
    required this.status,
    required this.quantity,
    required this.total,
    required this.cart,
  });

  // Cart cart;
  // String orderID;
  // String status;
  // String paymentMethod;
  // String deliveryAddress;
  final String orderID;
  final String status;
  final int quantity;
  final int total;
  final List<Item> cart;
}

// class OrderHistoryModel {
//   OrderHistoryModel({
//     required this.status,
//     required this.paymentMethod,
//     required this.deliveryAddress,
//     required this.productID,
//     required this.qty,
//     required this.color,
//     required this.size,
//     required this.total,
//   });

//   final List<String> productID;
//   final List<int> qty;
//   final List<String> color;
//   final List<String> size;
//   final int total;

//   String status;
//   String paymentMethod;
//   String deliveryAddress;

//   static fromJson(Map<String, dynamic> json) {
//     var firebase_data = [];

//     // Convert List<dynamic> to List<String> for colors
//     firebase_data = json['color'] ?? [];
//     var colors = firebase_data as List<dynamic>;
//     List<String> colorsIDs = [];
//     for (var id in colors) colorsIDs.add(id.toString().trim());

//     // Convert List<dynamic> to List<String> for product IDs
//     firebase_data = json['productID'] ?? [];
//     var prods = firebase_data as List<dynamic>;
//     List<String> prodsID = [];
//     for (var id in prods) prodsID.add(id.toString().trim());

//     // Convert List<dynamic> to List<String> for quantities
//     firebase_data = json['qty'] ?? [];
//     var quantities = firebase_data as List<dynamic>;
//     List<int> quants = [];
//     for (var id in quantities) quants.add(id);

//     // Convert List<dynamic> to List<String> for sizes
//     firebase_data = json['size'] ?? [];
//     var sizeids = firebase_data as List<dynamic>;
//     List<String> sizeIDs = [];
//     for (var id in sizeids) sizeIDs.add(id);

//     return OrderHistoryModel(
//       color: colorsIDs,
//       productID: prodsID,
//       qty: quants,
//       size: sizeIDs,
//       total: json['total'],
//       deliveryAddress: json['delivery'],
//       paymentMethod: json['payment'],
//       status: json['status'],
//     );
//   }

//   toJson() {
//     return {
//       'color': color,
//       'productID': productID,
//       'qty': qty,
//       'size': size,
//       'total': total,
//       'delivery': deliveryAddress,
//       'payment': paymentMethod,
//       'status': status,
//     };


//   }
// }
