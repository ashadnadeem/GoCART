import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gocart/Entities/cart_entity.dart';
import 'package:gocart/Controllers/debitcard_provider.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Controllers/address_provider.dart';
import '../../Controllers/cart_provider.dart';
import '../../Entities/address_entity.dart';
import '../../Entities/debitcard_entity.dart';
import '../Account Screen Pages/Widgets/address_tile_widget.dart';
import 'Widgets/cart_list_widget.dart';

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
    // ignore: todo
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
            CartTotalWidget(
                total: total,
                text: "Confirm",
                cart: cart,
                address: _selectedAddress.address,
                card: _card),
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
                    if (kDebugMode) {
                      print("Swap Address");
                    }
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
