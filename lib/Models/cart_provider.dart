import 'package:flutter/cupertino.dart';
import 'package:gocart/Models/item_model.dart';

class CartProvider extends ChangeNotifier {
  List<Item> list = [];

  List<Item> get cart => list;

  void addToCart(Item item) {
    list.add(item);
    notifyListeners();
  }

  void removeFromCart(Item item) {
    int index = list.indexOf(item);
    list.removeAt(index);
    notifyListeners();
  }
}
