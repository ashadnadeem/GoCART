import 'package:flutter/cupertino.dart';
import 'package:gocart/Models/item_model.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> list = [];

  List<Item> get items => list;

  void addItem(Item item) {
    list.add(item);
    notifyListeners();
  }
}
