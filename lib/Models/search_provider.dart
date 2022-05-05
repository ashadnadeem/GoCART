import 'package:flutter/material.dart';
import 'package:gocart/Models/item_model.dart';

class SearchProvider extends ChangeNotifier {
  List<Item> original_list = [];
  List<Item> search_list = [];

  List<Item> get search => search_list;

  void makeCopy(List<Item> products) {
    original_list.addAll(products);
    notifyListeners();
  }

  // Reset the search list
  void resetSearch() {
    search_list = [];
    search_list.addAll(original_list);
    notifyListeners();
  }

  // search_list filters the list of products based on brandId
  void filterByBrand({brandid}) {
    search_list = [];
    for (var item in original_list) {
      if (item.brandID.contains(brandid)) {
        search_list.add(item);
      }
    }
    notifyListeners();
  }

  // Filter by name
  void filterByName({productName}) {
    search_list = [];
    for (var item in original_list) {
      if (item.name.toLowerCase().contains(productName.toLowerCase())) {
        search_list.add(item);
      }
    }
    notifyListeners();
  }

  // Filter by category
  void filterByCategory({category}) {
    search_list = [];
    for (var item in original_list) {
      if (item.category.toLowerCase().contains(category.toLowerCase())) {
        search_list.add(item);
      }
    }
    notifyListeners();
  }

  // filter by colors
  void filterByColor({color}) {
    search_list = [];
    for (var item in original_list) {
      if (item.colors.contains(color.toLowerCase())) {
        search_list.add(item);
      }
    }
    notifyListeners();
  }

  // filter by size
  void filterBySize({size}) {
    search_list = [];
    for (var item in original_list) {
      if (item.sizes.contains(size.toLowerCase())) {
        search_list.add(item);
      }
    }
    notifyListeners();
  }

  // filter by ar compatible
  void filterByAR() {
    search_list = [];
    for (var item in original_list) {
      if (item.arLink.isNotEmpty) {
        search_list.add(item);
      }
    }
    notifyListeners();
  }

  // filter by is trending
  void filterByTrending() {
    search_list = [];
    for (var item in original_list) {
      if (item.isTrending) {
        search_list.add(item);
      }
    }
    notifyListeners();
  }

  // filter prods
  void filterProds({category, colors, size, ar, brandid}) {
    List<Item> common = [];
    common.addAll(original_list);
    if (category != null) {
      filterByCategory(category: category);
      common = getCommonProducts(common, search_list);
    }
    if (colors != null) {
      filterByColor(color: colors);
      common = getCommonProducts(common, search_list);
    }
    if (size != null) {
      filterBySize(size: size);
      common = getCommonProducts(common, search_list);
    }
    if (ar != null && ar) {
      filterByAR();
      common = getCommonProducts(common, search_list);
    }
    if (brandid != null) {
      filterByBrand(brandid: brandid);
      common = getCommonProducts(common, search_list);
    }
    search_list = common;
    notifyListeners();
  }

  // get common products
  // take two lists and return a list of common products
  List<Item> getCommonProducts(List<Item> list1, List<Item> list2) {
    List<Item> commonProducts = [];
    for (var item in list1) {
      if (list2.contains(item)) {
        commonProducts.add(item);
      }
    }
    return commonProducts;
  }
}
