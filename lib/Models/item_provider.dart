import 'package:flutter/cupertino.dart';
import 'package:gocart/Models/item_model.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> list = [];

  List<Item> get items => list;

  void addItem(Item item) {
    list.add(item);
    notifyListeners();
  }

  void addToWishlist(Item item) {
    int index = list.indexOf(item);
    list[index].isFav = true;
    notifyListeners();
  }

  void removeFromWishlist(Item item) {
    int index = list.indexOf(item);
    list[index].isFav = false;
    notifyListeners();
  }

  bool getFav(Item item) {
    int index = list.indexOf(item);
    return list[index].isFav;
  }
}
