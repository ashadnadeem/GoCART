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
 List<Address> myAddresses = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myAddresses.add(Address(
      name: "My Home",
      address: "F-67, Apartment-C",
      city: "Karachi",
      zip: "74100",
      phone: "+92 346 7755530",
    ));
    myAddresses.add(Address(
      name: "Ashad's Home",
      address: "E-102, Sector-1",
      city: "Noida",
      zip: "201301",
      phone: "+92 333 3333330",
    ));
    myAddresses.add(Address(
      name: "My Office",
      address: "B-34, West-Avenue, Main-Road",
      city: "Karachi",
      zip: "44000",
      phone: "+92 345 8909930",
    ));
    myAddresses[0].defaultAddress = true;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const HeaderBar(title: "Saved Addresses"),
            SizedBox(height: screenHeight * 0.03),
            for (var i = 0; i < myAddresses.length; i++)
              addressCard(myAddresses[i]),
            addAddressButton(),
          ],
        ),
      ),
      
    );
  }

  Widget addressCard(userAddress) {
    return InkWell(
      child: AddressTile(address: userAddress),
      onTap: () {
        myAddresses.remove(userAddress);
        (userAddress as Address).defaultAddress = true;
        myAddresses.insert(0, userAddress);
        // mark rest of the addresses as false
        for (var i = 1; i < myAddresses.length; i++) {
          (myAddresses[i]).defaultAddress = false;
        }
        setState(() {});
      },
    );
  }

  Widget addAddressButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: coolButton(
        text: "Add Address",
        functionToComply: () {
          // Navigate to add address page
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddAddress()));
        },
      ),
    );
  }
}
