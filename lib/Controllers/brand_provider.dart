import 'package:flutter/cupertino.dart';
import 'package:gocart/Models/brand_model.dart';

class BrandProvider extends ChangeNotifier {
  List<Brand> list = [];

  List<Brand> get brands => list;

  void addItem(Brand brand) {
    list.add(brand);
    notifyListeners();
  }

  void addAR(Brand brand) {
    int index = list.indexOf(brand);
    list[index].hasAR = true;
    notifyListeners();
  }

  void removeAR(Brand brand) {
    int index = list.indexOf(brand);
    list[index].hasAR = false;
    notifyListeners();
  }

  bool getAR(Brand brand) {
    int index = list.indexOf(brand);
    return list[index].hasAR;
  }

  String getBrandName(brandID) {
    for (var brand in list) {
      if (brand.id == brandID) {
        return brand.name;
      }
    }
    return "Not Listed";
  }
}
