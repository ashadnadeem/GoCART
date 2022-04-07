import 'package:flutter/material.dart';
import 'package:gocart/Account%20Screen%20Pages/Address/add_address_page.dart';
import 'package:gocart/Account%20Screen%20Pages/Widgets/address_tile_widget.dart';
import 'package:gocart/Models/address_model.dart';
import 'package:gocart/utils.dart';

class SavedAddress extends StatefulWidget {
  const SavedAddress({Key? key}) : super(key: key);

  @override
  State<SavedAddress> createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderBar(title: "Saved Addresses"),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(
              width: screenHeight * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AddressTile(
                      defaultAddress: true,
                      address: Address(
                        name: "Default Address",
                        address: "E-1103, Creek Vista Apartments, DHA",
                        city: "Karachi",
                        phone: "+92 343 5301300",
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    AddressTile(
                      address: Address(
                        name: "My Home",
                        address: "E-1103, Creek Vista Apartments, DHA",
                        city: "Karachi",
                        phone: "+92 343 5301300",
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    AddressTile(
                      address: Address(
                        name: "Ashad's Home",
                        address: "4B/1 1st Central Lane DHA",
                        city: "Karachi",
                        phone: "+92 308 26380000",
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    coolButton(
                      text: "Add Address",
                      functionToComply: () {
                        // Navigate to add address page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddAddress(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const bottomBar(),
    );
  }
}
