import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/ItemDetailPage.dart';
import 'package:gocart/Main%20Screen%20Pages/checkout_page.dart';
import 'package:gocart/Main%20Screen%20Pages/main_page.dart';
import 'package:gocart/Models/cart_provider.dart';
import 'package:gocart/Models/item_model.dart';
import 'package:gocart/Models/order_history_model.dart';
import 'package:gocart/Models/order_history_provider.dart';
import 'package:gocart/Models/total_provider.dart';
import 'package:gocart/success_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class CartListWidget extends StatefulWidget {
  const CartListWidget({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final List<Item> cart;

  @override
  State<CartListWidget> createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 34),
        itemCount: widget.cart.length,
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
                        context
                            .read<CartProvider>()
                            .incCount(widget.cart[index]);
                        // total = total + (cart[index].price);
                        context
                            .read<TotalProvider>()
                            .add(widget.cart[index].price);
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
                      widget.cart[index].itemCount.toString(),
                      // _totalController.text,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        context
                            .read<CartProvider>()
                            .decCount(widget.cart[index]);
                        // total = total - (cart[index].price);
                        context
                            .read<TotalProvider>()
                            .sub(widget.cart[index].price);
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
                      widget.cart[index].image,
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
          title: Text(widget.cart[index].name),
          isThreeLine: true,
          subtitle: Text(
              "${widget.cart[index].description}\n${widget.cart[index].price}"),
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemDetail(product: widget.cart[index]),
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
    );
  }
}

class CartTotalWidget extends StatelessWidget {
  const CartTotalWidget({
    Key? key,
    required this.total,
    required this.text,
    required this.cart,
  }) : super(key: key);

  final int total;
  final String text;
  final List<Item> cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              primary: Colors.red,
              fixedSize: const Size(120, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27),
              ),
            ),
            onPressed: () {
              if (text == "Checkout") {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CheckoutPage(),
                  ),
                );
              } else {
                int count = 0;
                for (Item i in cart) {
                  count = count + i.itemCount;
                }
                context.read<OrderHistoryProvider>().addItem(
                      OrderHistory(
                          orderID: (Random().nextInt(10000000)).toString(),
                          status: "Booked",
                          quantity: count,
                          total: total,
                          cart: cart),
                    );
                context.read<CartProvider>().clearCart();
                context.read<TotalProvider>().clearTotal();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const SuccessScreen(nextPage: MainPage()),
                  ),
                );
              }
            },
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
