import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/U_ItemDetailPage.dart';
import 'package:gocart/Models/cart_provider.dart';
import 'package:gocart/Models/item_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Item> cart = [];

  @override
  Widget build(BuildContext context) {
    context.read<CartProvider>().cart;

    return Center(
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
                      onTap: () {},
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                  const Expanded(flex: 0, child: Text("1")),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {},
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
                ),
              ),
              // const SizedBox(
              //   width: 16,
              // ),
            ],
          ),
          title: Text(cart[index].name),
          isThreeLine: true,
          subtitle: Text("${cart[index].description}\n${cart[index].price}"),
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
    );
  }
}
