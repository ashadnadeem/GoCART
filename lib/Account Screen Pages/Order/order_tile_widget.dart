import 'package:flutter/material.dart';
import 'package:gocart/Controllers/item_provider.dart';
import 'package:gocart/Entities/item_entity.dart';
import 'package:gocart/Models/order_history_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'order_history_details_page.dart';

class OrderTile extends StatelessWidget {
  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);
  final OrderHistory order;

  @override
  Widget build(BuildContext context) {
    final double screenSizeH = MediaQuery.of(context).size.height;
    final double fontsize = screenSizeH * 0.015;

    Widget veiwDetailsButton(screenH, funct) {
      return InkWell(
        child: Text(
          "View Details",
          style: TextStyle(
            fontSize: screenH * 0.015,
            color: Colors.grey,
            decoration: TextDecoration.underline,
          ),
        ),
        onTap: funct,
      );
    }

    Widget orderHeader() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Text(
              'Order: ${order.orderID}',
              style: GoogleFonts.poppins(
                fontSize: screenSizeH * 0.02,
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black54,
                height: 2,
              ),
            ),
            veiwDetailsButton(screenSizeH, () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OrderHistoryDetailPage(history: order),
              ));
            }),
          ],
        ),
      );
    }

    Widget orderBody() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Container(width: screenSizeH * 0.03),
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
                    order.orderID,
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
                Container(width: screenSizeH * 0.03),
                Text(
                  'Status:          ',
                  style: GoogleFonts.poppins(
                    fontSize: fontsize,
                    fontWeight: FontWeight.w300,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  order.status,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    fontSize: fontsize,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  order.status == "Shipped"
                      ? Icons.local_shipping_outlined
                      : Icons.shopify_outlined,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(width: screenSizeH * 0.03),
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
                    order.cart.qty.toString(),
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
                Container(width: screenSizeH * 0.03),
                Text(
                  'Total:             PKR ',
                  style: GoogleFonts.poppins(
                    fontSize: fontsize,
                    fontWeight: FontWeight.w300,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  order.cart.total.toString(),
                  style: GoogleFonts.poppins(
                    fontSize: fontsize,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget orderImage() {
      Item item =
          context.read<ItemProvider>().getItemByID(order.cart.productID.first);
      print(item.name);
      return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Container(
          height: screenSizeH * 0.1,
          width: screenSizeH * 0.1,
          decoration: BoxDecoration(
            // Add rounded radius corners square image
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(item.images.first),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        child: Column(
          children: [
            orderHeader(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                orderImage(),
                Expanded(
                  child: orderBody(),
                ),
              ],
            ),
            SizedBox(height: screenSizeH * 0.01),
          ],
        ),
      ),
    );
  }
}
