import 'package:flutter/material.dart';
import 'package:gocart/Models/brand_model.dart';

import 'package:gocart/Models/item_model.dart';

class SearchProvider extends ChangeNotifier {
  List<Item> searchlist = [];

  List<Item> get search => searchlist;

  void clearList() {
    searchlist.clear();
  }

  void addItem(Brand brand, List<Item> items) {
    // searchlist.clear();
    for (Item i in items) {
      if (i.brandID == brand.id) {
        searchlist.add(i);
      }
    }
    notifyListeners();
  }
}
