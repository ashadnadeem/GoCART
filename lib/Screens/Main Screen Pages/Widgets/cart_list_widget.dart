import 'package:flutter/material.dart';
import 'package:gocart/Entities/debitcard_entity.dart';
import 'package:gocart/Entities/cart_entity.dart';
import 'package:gocart/Controllers/cart_provider.dart';
import 'package:gocart/Controllers/item_provider.dart';
import 'package:gocart/Models/order_history_model.dart';
import 'package:gocart/Models/order_history_provider.dart';
import 'package:gocart/Screens/Main%20Screen%20Pages/home_page.dart';
import 'package:gocart/Screens/Main%20Screen%20Pages/main_page.dart';
import 'package:gocart/Screens/success_screen.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/user_provider.dart';
import '../../../Entities/item_entity.dart';
import '../ItemDetailPage.dart';
import '../checkout_page.dart';

// ignore: must_be_immutable
class CartListWidget extends StatefulWidget {
  CartListWidget({
    Key? key,
    required this.cart,
  }) : super(key: key);

  Cart cart;

  @override
  State<CartListWidget> createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  // late listOfItems = context.read()
  Item getItemFromID(String prodID) {
    return context.read<ItemProvider>().getItemByID(prodID);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 34),
        itemCount: widget.cart.productID.length,
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
                        context.read<CartProvider>().addToCart(
                            getItemFromID(widget.cart.productID[index]),
                            "",
                            "");
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
                      widget.cart.qty[index].toString(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        context.read<CartProvider>().removeFromCart(
                            getItemFromID(widget.cart.productID[index]));
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
                      getItemFromID(widget.cart.productID[index]).images.first,
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
          title: Text(getItemFromID(widget.cart.productID[index]).name),
          isThreeLine: true,
          subtitle: Text(
              "${getItemFromID(widget.cart.productID[index]).category}\nPKR ${getItemFromID(widget.cart.productID[index]).price}"),
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemDetail(
                      product: getItemFromID(widget.cart.productID[index])),
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
    required this.address,
    this.card,
  }) : super(key: key);

  final int total;
  final String text;
  final Cart cart;
  final DebitCard? card;
  final String address;

  @override
  Widget build(BuildContext context) {
    void saveMyOrder() async {
      var order = OrderHistory(
          cart: cart,
          status: "Pending",
          paymentMethod: card == null ? "COD" : card!.id,
          deliveryAddress: address);
      // Add a new order
      var orderid =
          await context.read<OrderHistoryProvider>().addOrderToHistory(order);
      // Link the card to the user
      context.read<UserProvider>().addNewOrder(orderid);
      // Save changes to the user
      context.read<UserProvider>().saveChanges();
      context.read<CartProvider>().clearCart();
      // Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SuccessScreen(nextPage: MainPage()),
      ));
    }

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
          cart.total.toString(),
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
                if (cart.total == 0) {
                  dialogs.errorDialog(
                      context, "Invalid Cart", "Cart can not be empty.");
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CheckoutPage(),
                    ),
                  );
                }
              } else if (text == "Confirm") {
                if (cart.total == 0) {
                  dialogs.errorDialog(
                      context, "Invalid Cart", "Cart can not be empty.");
                } else {
                  saveMyOrder();
                }
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
