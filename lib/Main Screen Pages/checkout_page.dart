import 'package:flutter/material.dart';
import 'package:gocart/Account%20Screen%20Pages/Widgets/address_tile_widget.dart';
import 'package:gocart/Main%20Screen%20Pages/ItemDetailPage.dart';
import 'package:gocart/Main%20Screen%20Pages/Widgets/cart_list_widget.dart';
import 'package:gocart/Models/cart_model.dart';
import 'package:gocart/Models/debitcard_model.dart';
import 'package:gocart/Models/debitcard_provider.dart';
import 'package:gocart/Models/total_provider.dart';
import 'package:gocart/Models/user_provider.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Models/address_model.dart';
import '../Models/address_provider.dart';
import '../Models/cart_provider.dart';
import '../Models/item_model.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late Cart cart;
//  final TextEditingController _totalController = TextEditingController();
  int total = 0;
  DebitCard? _card;
  late Address _selectedAddress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final List<Address> _address = context.read<AddressProvider>().list;
    if (_address.isNotEmpty) {
      // Check if user has any address
      _selectedAddress = _address.first;
    } else {
      // Use a blank address for UI to not crash
      _selectedAddress = Address(
          name: "name",
          address: "address",
          city: "city",
          phone: "phone",
          zip: "zip");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    cart = context.watch<CartProvider>().cart;
    total = context.read<TotalProvider>().total;

    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: <Widget>[
            const HeaderBar(title: "Checkout"),
            delieryAddressCard(),
            paymentMethodCard(),
            //orderDetailsCard(),
            Container(height: 16),
            // Container(height: 1, color: Colors.black26),
            dividerRow("Order details", null),
            CartListWidget(cart: cart),
            Container(width: screenWidth, height: 3, color: Colors.grey[700]),
            CartTotalWidget(total: total, text: "Confirm", cart: cart),
            // orderSummaryCard(),//From the Cart Page reuse
          ],
        ),
      ),
      // bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget delieryAddressCard() {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(children: <Widget>[
      dividerRow("Delivery Address", Icons.swap_horiz_rounded),
      SizedBox(height: screenHeight * 0.01),
      AddressTile(address: _selectedAddress, editable: false),
      SizedBox(height: screenHeight * 0.01),
    ]);
  }

  Widget paymentMethodCard() {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        dividerRow("Payment Method", null),
        SizedBox(height: screenHeight * 0.02),
        // Card for payment method
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          paymentButton("COD", _card == null),
          paymentButton(
              _card == null
                  ? "Card"
                  : _card!.cardNumber.substring(12).padLeft(8, "*"),
              _card != null),
        ]),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }

  // Widget orderDetailsCard() {
  //   List<Item> items = context.watch<CartProvider>().list;
  //   return SingleChildScrollView(
  //     child: Column(children: [
  //       dividerRow("Order Details", null),
  //       Container(height: 8),
  //       for (Item item in items) OrderTile(item),
  //     ]),
  //   );
  // }

  // Widget OrderTile(Item item) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20),
  //     child: Column(
  //       children: [
  //         Container(height: 2, color: Colors.black26),
  //         Container(height: 8),
  //         Row(
  //           children: [
  //             // Circle avatar of items image
  //             CircleAvatar(
  //               backgroundImage: NetworkImage(item.image),
  //               radius: 20,
  //             ),
  //             // Small Gap
  //             const SizedBox(width: 15),
  //             // Column for item name and Description
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   item.name,
  //                   style: GoogleFonts.poppins(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //                 Text(
  //                   item.description,
  //                   style: GoogleFonts.poppins(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w400,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             // Expanded Container
  //             Expanded(child: Container()),
  //             // Price Text
  //             Text(
  //               "PKR ${item.price}",
  //               style: GoogleFonts.poppins(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ],
  //         ),
  //         Container(),
  //         Container(height: 1, color: Colors.black26),
  //         // Container(height: 8),
  //       ],
  //     ),
  //   );
  // }

  Widget paymentButton(text, isSelected) {
    final double screenHeight = MediaQuery.of(context).size.height;
    DebitCard? selectedCard;
    return ElevatedButton(
      onPressed: text == 'COD'
          ? () {
              _card = null;
              setState(() {});
            }
          : () async {
              List<DebitCard> debitCards = context.read<CardProvider>().Cards;
              selectedCard = (await dialogs.showSwapDialog(context, debitCards))
                  as DebitCard?;
              _card = selectedCard;
              setState(() {});
            },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(screenHeight * 0.2, screenHeight * 0.02),
        primary: isSelected ? Colors.grey : Colors.white,
        onPrimary: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: text == "COD"
              ? const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
        ),
        shadowColor: Colors.grey.shade900,
        side: BorderSide(color: Colors.grey.shade900, width: 1),
      ),
    );
  }

  Widget dividerRow(text, icon) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth * 0.04,
        ),
        Text("$text  ",
            style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: screenHeight * 0.020,
                fontWeight: FontWeight.w300)),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.black54,
          ),
        ),
        Container(width: screenWidth * 0.04),
        icon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: Icon(icon),
                  color: Colors.black54,
                  iconSize: screenHeight * 0.04,
                  onPressed: () async {
                    print("Swap Address");
                    List<Address> addresses =
                        context.read<AddressProvider>().addresses;
                    _selectedAddress = (await dialogs.showSwapDialog(
                            context, addresses)) as Address? ??
                        addresses.first;
                    setState(() {});
                  },
                ),
              )
            : Container(),
      ],
    );
  }
}
