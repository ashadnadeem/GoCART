import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/Widgets/cart_list_widget.dart';
import 'package:gocart/Entities/cart_entity.dart';
import 'package:gocart/Models/cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Cart cart;
//  final TextEditingController _totalController = TextEditingController();
  int total = 0;

  // @override
  // void initState() {
  //   for (Item index in cart) {
  //     total = total + index.price * index.itemCount;
  //     _totalController.text = total.toString();
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    cart = context.watch<CartProvider>().cart;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Your Cart",
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 33, 32, 32),
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        CartListWidget(cart: cart),
        Container(width: screenWidth, height: 3, color: Colors.grey[700]),
        CartTotalWidget(total: total, text: "Checkout", cart: cart)
      ],
    );
  }
}
