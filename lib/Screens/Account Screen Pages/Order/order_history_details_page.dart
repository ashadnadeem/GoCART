import 'package:flutter/material.dart';
import 'package:gocart/Controllers/brand_provider.dart';
import 'package:gocart/Controllers/debitcard_provider.dart';
import 'package:gocart/Controllers/item_provider.dart';
import 'package:gocart/Entities/item_entity.dart';

import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Entities/order_history_entity.dart';
import '../../Main Screen Pages/ItemDetailPage.dart';

class OrderHistoryDetailPage extends StatefulWidget {
  const OrderHistoryDetailPage({Key? key, required this.history})
      : super(key: key);
  final OrderHistory history;
  @override
  State<OrderHistoryDetailPage> createState() => _OrderHistoryDetailPageState();
}

class _OrderHistoryDetailPageState extends State<OrderHistoryDetailPage> {
  int total = 0;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = screenHeight * 0.015;

    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: screenHeight * 0.03,
          ),
          const HeaderBar(title: "Order Details"),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Order Details   ',
                  style: GoogleFonts.poppins(
                    fontSize: screenHeight * 0.02,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black54,
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          orderDetailsbuild(screenHeight, fontsize),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Product List   ',
                  style: GoogleFonts.poppins(
                    fontSize: screenHeight * 0.02,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black54,
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 34),
              itemCount: widget.history.cart.productID.length,
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
                              "x${widget.history.cart.qty[index].toString()}",
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
                          image: imageLoader(index),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 16,
                    // ),
                  ],
                ),
                title: Text(
                  getBrandName(getItem(index).brandID),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                // title: Text(widget.history.cart[index].name),
                isThreeLine: true,
                subtitle: Text(
                    "${TextFormatter.productNameFormatter(getItem(index).name)}\n ${widget.history.cart.size[index]} | ${widget.history.cart.color[index]}\nPKR ${getItem(index).price}"),
                // "${widget.history.cart[index].description}\n${widget.history.cart[index].price}"),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              ItemDetail(product: getItem(index))),
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
                "PKR ${widget.history.cart.total.toString()}",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column orderDetailsbuild(double screenHeight, double fontsize) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: <Widget>[
            Container(width: screenHeight * 0.03),
            Text(
              'Order ID:      ',
              style: GoogleFonts.poppins(
                fontSize: fontsize,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
            Expanded(
              child: Text(
                widget.history.orderID,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.poppins(
                  fontSize: fontsize,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(width: screenHeight * 0.03),
            Text(
              'Status:          ',
              style: GoogleFonts.poppins(
                fontSize: fontsize,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
            Text(
              widget.history.status,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: GoogleFonts.poppins(
                fontSize: fontsize,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(width: screenHeight * 0.03),
            Text(
              'Quantity:      ',
              style: GoogleFonts.poppins(
                fontSize: fontsize,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
            Expanded(
              child: Text(
                sumAll().toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.poppins(
                  fontSize: fontsize,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(right: 64.0),
              child: Icon(widget.history.status == "Pending"
                  ? Icons.pending_actions_rounded
                  : widget.history.status == "Booked"
                      ? Icons.check_box_outlined
                      : widget.history.status == "Shipped"
                          ? Icons.local_shipping_rounded
                          : Icons.check_box),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(width: screenHeight * 0.03),
            Text(
              'Total:             PKR ',
              style: GoogleFonts.poppins(
                fontSize: fontsize,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
            Text(
              widget.history.cart.total.toString(),
              style: GoogleFonts.poppins(
                fontSize: fontsize,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(width: screenHeight * 0.03),
            Text(
              'Delivery Address:   ',
              style: GoogleFonts.poppins(
                fontSize: fontsize,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
            Expanded(
              child: Text(
                widget.history.deliveryAddress,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.poppins(
                  fontSize: fontsize,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(width: screenHeight * 0.03),
            Text(
              'Payment Method:   ',
              style: GoogleFonts.poppins(
                fontSize: fontsize,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
            Text(
              widget.history.paymentMethod == "COD"
                  ? "COD"
                  : "${getBankName(widget.history.paymentMethod)} - ${getCardNum(widget.history.paymentMethod).substring(12).padLeft(8, "*")}",
              style: GoogleFonts.poppins(
                fontSize: fontsize,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ],
    );
  }

  int sumAll() {
    int sum = 0;
    for (int i in widget.history.cart.qty) {
      sum += i;
    }

    return sum;
  }

  String getBankName(String cardID) {
    return context.read<CardProvider>().getBankFromID(cardID);
  }

  String getCardNum(String cardID) {
    return context.read<CardProvider>().getCardNumFromID(cardID);
  }

  String getBrandName(String brandID) {
    return context.read<BrandProvider>().getBrandName(brandID);
  }

  Item getItem(int index) {
    return context
        .read<ItemProvider>()
        .getItemByID(widget.history.cart.productID[index]);
  }

  NetworkImage imageLoader(int index) {
    return NetworkImage(getItem(index).images.first);
  }
}
