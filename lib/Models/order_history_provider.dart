import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gocart/Entities/cart_entity.dart';
import 'package:gocart/Models/order_history_model.dart';

class OrderHistoryProvider extends ChangeNotifier {
  List<OrderHistory> list = [];
  CollectionReference firebaseHistory =
      FirebaseFirestore.instance.collection('orderhistory');
  List<OrderHistory> get hisotry => list;

  void loadHistory(orderIDs) async {
    list = [];

    for (var id in orderIDs) {
      if (id == "") continue;

      var doc = await firebaseHistory.doc(id).get();

      OrderHistoryModel orderHistoryModel =
          OrderHistoryModel.fromJson(doc.data() as Map<String, dynamic>);
      OrderHistory order = OrderHistory(
        cart: Cart(
            cartID: "",
            productID: orderHistoryModel.productID,
            qty: orderHistoryModel.qty,
            color: orderHistoryModel.color,
            size: orderHistoryModel.size,
            total: orderHistoryModel.total),
        status: orderHistoryModel.status,
        paymentMethod: orderHistoryModel.paymentMethod,
        deliveryAddress: orderHistoryModel.deliveryAddress,
      );
      order.orderID = id;
      list.add(order);
    }
    notifyListeners();
  }

  Future<String> addOrderToHistory(OrderHistory order) async {
    var newRef = await firebaseHistory.add(
      OrderHistoryModel(
        status: order.status,
        paymentMethod: order.paymentMethod,
        deliveryAddress: order.deliveryAddress,
        productID: order.cart.productID,
        qty: order.cart.qty,
        color: order.cart.color,
        size: order.cart.size,
        total: order.cart.total,
      ).toJson(),
    );

    order.orderID = newRef.id;

    list.add(order);
    notifyListeners();
    return newRef.id;
  }

  Cart getOrderByID(String id) {
    for (var item in list) {
      if (item.orderID == id) {
        return item.cart;
      }
    }
    // If not found return first item
    return list.first.cart;
  }
}
