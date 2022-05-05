import 'package:flutter/cupertino.dart';
import 'package:gocart/Models/item_model.dart';

class WishListProvider extends ChangeNotifier {
  List<Item> wishlistItems = [];

  List<Item> get getWishListItems => wishlistItems;

  void loadWishListItems(List<Item> allItems, List<String> wishlistIDs) {
    wishlistItems = [];
    for (var item in allItems) {
      if (wishlistIDs.contains(item.id)) {
        wishlistItems.add(item);
      }
    }
    notifyListeners();
  }
}
