import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/U_ItemDetailPage.dart';
import 'package:gocart/Models/cart_provider.dart';
import 'package:gocart/Models/item_model.dart';
import 'package:gocart/Models/total_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Item> cart = [];
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
    total = context.read<TotalProvider>().total;

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
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 34),
            itemCount: cart.length,
            itemBuilder: (context, index) => ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            context.read<CartProvider>().incCount(cart[index]);
                            // total = total + (cart[index].price);
                            context
                                .read<TotalProvider>()
                                .add(cart[index].price);
                            // _totalController.text = total.toString();
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Text(
                          cart[index].itemCount.toString(),
                          // _totalController.text,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            context.read<CartProvider>().decCount(cart[index]);
                            // total = total - (cart[index].price);
                            context
                                .read<TotalProvider>()
                                .sub(cart[index].price);
                            // _totalController.text = total.toString();
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.remove,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.5),
                      color: const Color.fromARGB(255, 46, 44, 44),
                      image: DecorationImage(
                        image: NetworkImage(
                          cart[index].image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 16,
                  // ),
                ],
              ),
              title: Text(cart[index].name),
              isThreeLine: true,
              subtitle:
                  Text("${cart[index].description}\n${cart[index].price}"),
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ItemDetail(product: cart[index]),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.all(8),
              child: Divider(
                // thickness: 1,
                height: 2,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(width: screenWidth, height: 3, color: Colors.grey[700]),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Total: ",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              total.toString(),
              style: GoogleFonts.poppins(
                fontSize: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                ),
                onPressed: () {
                  //Checkout page
                },
                child: const Text("Checkout"),
              ),
            ),
          ],
        )
      ],
    );
  }
}
