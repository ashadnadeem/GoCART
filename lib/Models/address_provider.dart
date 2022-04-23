import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'address_model.dart';

class AddressProvider extends ChangeNotifier {
  List<Address> list = [];
  CollectionReference firebaseAddress =
      FirebaseFirestore.instance.collection('address');

  List<Address> get addresses => list;

  void loadAddress() async {
    list = [];
    await firebaseAddress.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
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
        address.id = doc.id;
        list.add(address);
        // print(address.name);
      });
    });
    sortAddress();
    notifyListeners();
  }

  void addAddress(Address address) async {
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

  void deleteAddress(Address address) {
    list.remove(address);
    firebaseAddress.doc(address.id).delete();
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
