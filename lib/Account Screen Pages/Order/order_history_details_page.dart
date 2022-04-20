import 'package:flutter/material.dart';

import 'package:gocart/Main%20Screen%20Pages/ItemDetailPage.dart';
import 'package:gocart/Models/order_history_model.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderHistoryDetailPage extends StatefulWidget {
  OrderHistoryDetailPage({Key? key, required this.history}) : super(key: key);
  final OrderHistory history;
  @override
  State<OrderHistoryDetailPage> createState() => _OrderHistoryDetailPageState();
}

class _OrderHistoryDetailPageState extends State<OrderHistoryDetailPage> {
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
    final double screenHeight = MediaQuery.of(context).size.height;
    // wigdet.cart = context.watch<CartProvider>().cart;
    // total = context.read<TotalProvider>().total;

    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: screenHeight * 0.05,
          ),
          HeaderBar(title: "Order Details"),

          // Text(
          //   "Order Details",
          //   style: GoogleFonts.poppins(
          //     color: const Color.fromARGB(255, 33, 32, 32),
          //     fontSize: 50,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 34),
              itemCount: widget.history.cart.length,
              itemBuilder: (context, index) => ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 0,
                            child: Text(
                              "x${widget.history.cart[index].itemCount.toString()}",
                              // _totalController.text,
                            ),
                          ),
                        ],
                      ),
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
                            widget.history.cart[index].image,
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
                title: Text(widget.history.cart[index].name),
                isThreeLine: true,
                subtitle: Text(
                    "${widget.history.cart[index].description}\n${widget.history.cart[index].price}"),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ItemDetail(product: widget.history.cart[index]),
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
                "PKR ${widget.history.total.toString()}",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                ),
              ),
            ],
          ),
          // CartTotalWidget(total: total, text: "Checkout", cart: cart)
        ],
      ),
    );
  }
}
