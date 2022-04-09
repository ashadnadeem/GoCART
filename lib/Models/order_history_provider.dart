import 'package:flutter/cupertino.dart';
import 'package:gocart/Models/item_model.dart';
import 'package:gocart/Models/order_history_model.dart';

class OrderHistoryProvider extends ChangeNotifier {
  List<OrderHistory> list = [];

  List<OrderHistory> get items => list;

  void addItem(OrderHistory order) {
    list.add(order);
    notifyListeners();
  }

  // void addToWishlist(List<Item> cart) {
  //   int index = list.indexOf(cart);
  //   // list[index].isFav = true;
  //   notifyListeners();
  // }

  // void removeFromWishlist(Item item) {
  //   int index = list.indexOf(item);
  //   list[index].isFav = false;
  //   notifyListeners();
  // }

  // bool getFav(Item item) {
  //   int index = list.indexOf(item);
  //   return list[index].isFav;
  // }
}
