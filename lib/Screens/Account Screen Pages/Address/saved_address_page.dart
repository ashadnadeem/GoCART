import 'package:flutter/material.dart';
import 'package:gocart/utils.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/address_provider.dart';
import '../../../Entities/address_entity.dart';
import '../Widgets/address_tile_widget.dart';
import 'add_address_page.dart';

class SavedAddress extends StatefulWidget {
  const SavedAddress({Key? key}) : super(key: key);

  @override
  State<SavedAddress> createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  List<Address> myAddresses = [];
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myAddresses = context.watch<AddressProvider>().addresses;
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
        context.read<AddressProvider>().updateDefault(userAddress);
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
