import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/Widgets/item_list_widgets.dart';
import 'package:gocart/Models/item_model.dart';
import 'package:gocart/Models/item_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<Item> list = [];

  @override
  Widget build(BuildContext context) {
    // final double screenHeight = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;
    list = context.read<ItemProvider>().list;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Wishlist",
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 33, 32, 32),
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          ItemList(
            isWishlist: true,
            items: list,
          ),
        ],
      ),
    );
  }
}
