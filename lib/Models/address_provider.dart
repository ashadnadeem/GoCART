import 'package:flutter/material.dart';
import 'address_model.dart';

class AddressProvider extends ChangeNotifier {
  List<Address> list = [];

  List<Address> get addresses => list;

  void addAddress(Address address) {
    list.add(address);
    notifyListeners();
  }

  void updateDefault(Address address) {
    notifyListeners();
  }

  void deleteAddress(Address address) {}
}
