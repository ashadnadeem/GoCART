import 'package:flutter/material.dart';

import '../Entities/item_entity.dart';

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

  void addToWishList(Item item) {
    wishlistItems.add(item);
    notifyListeners();
  }

  void removeFromWishList(Item item) {
    wishlistItems.remove(item);
    notifyListeners();
  }

  bool isInWishList(Item item) {
    return wishlistItems.contains(item);
  }
}
