// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Entities/address_entity.dart';
import '../Models/address_model.dart';

class AddressProvider extends ChangeNotifier {
  List<Address> list = [];
  CollectionReference firebaseAddress =
      FirebaseFirestore.instance.collection('address');

  List<Address> get addresses => list;

  void loadAddress(addressIDs) async {
    list = [];
    // Get List of Address Ids from UserProfile
    // Fetch Addresss from Firebase in each addressID
    for (var id in addressIDs) {
      if (id == "") continue;
      var doc = await firebaseAddress.doc(id).get();
      AddressModel addressModel =
          AddressModel.fromJson(doc.data() as Map<String, dynamic>);

      Address address = Address(
        name: addressModel.name,
        address: addressModel.address,
        city: addressModel.city,
        phone: addressModel.phone,
        zip: addressModel.zip,
        defaultAddress: addressModel.defaultAddress,
      );
      address.id = id;
      list.add(address);
    }
    sortAddress();
    notifyListeners();
  }

  Future<String> addAddress(Address address) async {
    // Convert Address to Address Model
    var newRef = await firebaseAddress.add(AddressModel(
      name: address.name,
      address: address.address,
      city: address.city,
      phone: address.phone,
      zip: address.zip,
      defaultAddress: address.defaultAddress,
    ).toJson());
    address.id = newRef.id;
    // Add to provider
    list.add(address);
    notifyListeners();
    return newRef.id;
  }

  void updateDefault(Address address) {
    list.forEach((element) async {
      if (element.id == address.id) {
        // Update default address
        element.defaultAddress = true;
      } else {
        // Remove default address
        element.defaultAddress = false;
      }
      await firebaseAddress.doc(element.id).update(AddressModel(
            name: element.name,
            address: element.address,
            city: element.city,
            phone: element.phone,
            zip: element.zip,
            defaultAddress: element.defaultAddress,
          ).toJson());
    });
    // Sort Address
    sortAddress();
    notifyListeners();
  }

  void deleteAddress(Address address) async {
    list.remove(address);
    await firebaseAddress.doc(address.id).delete();
    notifyListeners();
  }

  void updateAddress(Address address) async {
    await firebaseAddress.doc(address.id).update(AddressModel(
          name: address.name,
          address: address.address,
          city: address.city,
          phone: address.phone,
          zip: address.zip,
          defaultAddress: address.defaultAddress,
        ).toJson());
    notifyListeners();
  }

  void sortAddress() => list.sort((a, b) => a.defaultAddress ? -1 : 1);
}
