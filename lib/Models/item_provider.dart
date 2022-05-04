import 'package:flutter/cupertino.dart';
import 'package:gocart/Models/item_model.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> list = [];

  List<Item> get items => list;

  void addItem(Item item) {
    list.add(item);
    notifyListeners();
  }

  List<String> getAllCategory() {
    // Iterate through the list and get all the categories
    List<String> categories = [];
    for (var item in list) {
      if (!categories.contains(item.category)) {
        categories.add(item.category);
      }
    }
    return categories;
  }

  List<String> getAllColors() {
    // Iterate through the list and get all the colors
    List<String> colors = [];
    for (var item in list) {
      for (var color in item.colors) {
        if (!colors.contains(color)) {
          colors.add(color);
        }
      }
    }
    return colors;
  }

  List<String> getAllSizes() {
    // Iterate through the list and get all the sizes
    List<String> sizes = [];
    for (var item in list) {
      for (var size in item.sizes) {
        if (!sizes.contains(size)) {
          sizes.add(size);
        }
      }
    }
    return sizes;
  }
}
