import 'package:flutter/material.dart';
import 'package:gocart/Controllers/address_provider.dart';
import 'package:gocart/Controllers/user_provider.dart';
import 'package:gocart/utils.dart';
import 'package:provider/provider.dart';

import '../../Entities/address_entity.dart';

class AddAddress extends StatefulWidget {
  AddAddress({this.address, Key? key}) : super(key: key);
  Address? address;
  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late Address address;
  String title = "Add Address";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // If there is a card Passing means editing
    if (widget.address != null) {
      title = "Edit Address";
      address = widget.address!;
      _titleController.text = address.name;
      _addressController.text = address.address;
      _cityController.text = address.city;
      _zipController.text = address.zip;
      _phoneController.text = address.phone;
    } else {
      address = Address(name: "", address: "", city: "", zip: "", phone: "");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    void _saveButton() async {
      address.name = _titleController.text;
      address.address = _addressController.text;
      address.city = _cityController.text;
      address.zip = _zipController.text;
      address.phone = _phoneController.text;
      // Check if Edit or Add
      if (widget.address != null) {
        // Edit Existing Address
        context.read<AddressProvider>().updateAddress(address);
        // No need to update User
      } else {
        // Add New Address
        var addresID =
            await context.read<AddressProvider>().addAddress(address);
        // Link the address to User
        context.read<UserProvider>().addNewAddress(addresID);
        // Save Changes to User
        context.read<UserProvider>().saveChanges();
      }
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderBar(title: title),
            SizedBox(height: screenHeight * 0.08),
            SizedBox(
              width: screenHeight * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: Column(children: <Widget>[
                  // Name TextField
                  Row(children: const <Widget>[Text("  Title")]),
                  gocartTextField(hint: "Title", control: _titleController),
                  // Address TextField
                  Row(children: const <Widget>[Text("  Address")]),
                  gocartTextField(
                    hint: "Address",
                    control: _addressController,
                    textType: TextInputType.streetAddress,
                  ),
                  // City TextField
                  Row(children: const <Widget>[Text("  City")]),
                  gocartTextField(
                    hint: "City",
                    control: _cityController,
                  ),
                  // Zip Code TextField
                  Row(children: const <Widget>[Text("  Zip Code")]),
                  gocartTextField(
                    hint: "Zip Code",
                    textType: TextInputType.number,
                    control: _zipController,
                  ),
                  // Phone Number TextField
                  Row(children: const <Widget>[Text("  Phone Number")]),
                  gocartTextField(
                    hint: "Phone Number",
                    control: _phoneController,
                    textType: TextInputType.phone,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ]),
              ),
            ),
            // Save Button
            coolButton(text: "Save", functionToComply: _saveButton),
          ],
        ),
      ),
      // bottomNavigationBar: const bottomBar(),
    );
  }
}
