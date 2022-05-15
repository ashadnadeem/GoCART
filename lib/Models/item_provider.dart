import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gocart/Models/item_model.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> list = [];

  List<Item> get items => list;

  CollectionReference firebaseProducts =
      FirebaseFirestore.instance.collection('products2');

  Future<void> loadProducts() async {
    await firebaseProducts.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        ItemModel itemModel =
            ItemModel.fromJson(doc.data() as Map<String, dynamic>);
        Item item = Item(
          name: itemModel.name,
          price: itemModel.price,
          description: itemModel.description,
          images: itemModel.images,
          category: itemModel.category,
          brandID: itemModel.brandID,
          colors: itemModel.colors,
          sizes: itemModel.sizes,
          arLink: itemModel.arLink,
          isTrending: itemModel.isTrending,
        );
        item.id = doc.id;
        list.add(item);
        print(item.name);
        print(item.brandID);
      });
    });
    notifyListeners();
  }

  void addItem(Item item) {
    list.add(item);
    notifyListeners();
  }

  List<String> getAllCategory() {
    // Iterate through the list and get all the categories
    List<String> categories = [];
    for (var item in list) {
      if (!categories.contains(item.category.split(' ')[0])) {
        categories.add(item.category.split(' ')[0]);
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

  List<int> getPriceRange() {
    // Iterate through the list and get all the prices
    // prices[0] = min price, prices[1] = max price
    List<int> prices = [];
    int max = 0;
    int min = list.first.price;
    for (var item in list) {
      if (item.price > max) {
        max = item.price;
      }
      if (item.price < min) {
        min = item.price;
      }
    }
    prices.add(min);
    prices.add(max);
    return prices;
  }

  Item getItemByID(String id) {
    for (var item in list) {
      if (item.id == id) {
        return item;
      }
    }
    // If not found return first item
    return list.first;
  }
}
