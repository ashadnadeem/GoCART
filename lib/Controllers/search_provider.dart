// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:gocart/Entities/item_entity.dart';
import 'package:gocart/Models/filter_query_model.dart';

class SearchProvider extends ChangeNotifier {
  List<Item> original_list = [];
  List<Item> search_list = [];
  bool isPopupOpen = false;

  bool get getPopupOpen => isPopupOpen;
  List<Item> get search => search_list;

  void makeCopy(List<Item> products) {
    original_list.addAll(products);
    notifyListeners();
  }

  // Reset the search list
  void resetSearch() {
    search_list = [];
    search_list.addAll(original_list);
    // notifyListeners();
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
      if (item.colors.toString().toLowerCase().contains(color.toLowerCase())) {
        search_list.add(item);
      }
    }
    notifyListeners();
  }

  // filter by size
  void filterBySize({size}) {
    search_list = [];
    for (var item in original_list) {
      if (item.sizes.toString().toLowerCase().contains(size.toLowerCase())) {
        search_list.add(item);
      }
    }
    notifyListeners();
  }

  // filter by min and max price
  void filterByPrice({min, max}) {
    search_list = [];
    for (var item in original_list) {
      if (item.price >= min && item.price <= max) {
        search_list.add(item);
      }
    }
    notifyListeners();
  }

  // filter by ar compatible
  void filterByAR() {
    search_list = [];
    for (var item in original_list) {
      if (item.arLink != "") {
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
    // notifyListeners();
  }

  // filter prods
  void filterProds({category, colors, size, ar, brandid, price}) {
    List<Item> common = [];
    common.addAll(original_list);
    if (category != null) {
      filterByCategory(category: category);
      common = getCommonProducts(common, search_list);
    }
    print("After category : ${common.length}");
    if (colors != null) {
      filterByColor(color: colors);
      common = getCommonProducts(common, search_list);
    }
    print("After color : ${common.length}");
    if (size != null) {
      filterBySize(size: size);
      common = getCommonProducts(common, search_list);
    }
    print("After size : ${common.length}");
    if (ar != null && ar) {
      filterByAR();
      common = getCommonProducts(common, search_list);
    }
    print("After ar : ${common.length}");
    if (price != null) {
      filterByPrice(min: price[0], max: price[1]);
      common = getCommonProducts(common, search_list);
    }
    print("After price : ${common.length}");

    if (brandid != null) {
      filterByBrand(brandid: brandid);
      common = getCommonProducts(common, search_list);
    }
    print("After brandid : ${common.length}");
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

  void filterByQuery(FilterQuery filterQuery) {
    print("filterByCategory : ${filterQuery.category}");
    print("filterByColor : ${filterQuery.color}");
    print("filterBySize : ${filterQuery.size}");
    print("filterByAR : ${filterQuery.arCompatible}");
    print("filterByPrice : ${filterQuery.price}");

    filterProds(
      category: filterQuery.category.trim() == ""
          ? null
          : filterQuery.category.trim(),
      colors: filterQuery.color.trim() == "" ? null : filterQuery.color.trim(),
      size: filterQuery.size.trim() == "" ? null : filterQuery.size.trim(),
      ar: filterQuery.arCompatible,
      price: filterQuery.price,
    );
  }

  void openPopup() {
    isPopupOpen = true;
    notifyListeners();
  }

  void closePopup() {
    isPopupOpen = false;
    notifyListeners();
  }
}
