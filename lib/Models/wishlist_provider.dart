import 'package:flutter/cupertino.dart';
import 'package:gocart/Models/item_model.dart';

class WishListProvider extends ChangeNotifier {
  List<Item> wishlist = [];

  List<Item> get getWishListItems => wishlist;

  void addItem(Item item) {
    wishlist.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    int index = wishlist.indexOf(item);
    wishlist.removeAt(index);
    notifyListeners();
  }
}
