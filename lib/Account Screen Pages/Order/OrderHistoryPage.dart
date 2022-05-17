// import 'package:flutter/material.dart';
// import 'package:gocart/Account%20Screen%20Pages/Order/order_history_details_page.dart';
// import 'package:gocart/Main%20Screen%20Pages/Widgets/item_list_widgets.dart';
// import 'package:gocart/Models/order_history_model.dart';
// import 'package:gocart/Models/order_history_provider.dart';
// import 'package:gocart/utils.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class OrderHistoryPage extends StatelessWidget {
//   OrderHistoryPage({Key? key}) : super(key: key);

//   List<OrderHistory> history = [];

//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;

//     history = context.read<OrderHistoryProvider>().items;

//     return Scaffold(
//       appBar: const MyAppBar(implyLeading: false),
//       body: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           SizedBox(height: screenHeight * 0.05),
//           const HeaderBar(title: "Order History"),
//           SizedBox(height: screenHeight * 0.05),
//           Expanded(
//             child: ListView.separated(
//               itemCount: history.length,
//               itemBuilder: (context, index) => Card(
//                 color: Colors.transparent,
//                 elevation: 0,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // ItemThumbnail(item: history[index].cart.first),
//                     // const SizedBox(
//                     //   width: 24,
//                     // ),
//                     Container(
//                       width: 100,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(13.5),
//                         color: const Color.fromARGB(255, 46, 44, 44),
//                         image: DecorationImage(
//                           image: NetworkImage(
//                             history[index].cart.first.image,
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         buildOrderHistoryDetail(
//                             "Order ID: ", history[index].orderID),
//                         buildOrderHistoryDetail(
//                             "Status: ", history[index].status),
//                         buildOrderHistoryDetail(
//                             "Quantity: ", history[index].quantity.toString()),
//                         buildOrderHistoryDetail(
//                             "Total: ", "PKR ${history[index].total}"),
//                       ],
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           primary: Colors.red,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(27))),
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) =>
//                               OrderHistoryDetailPage(history: history[index]),
//                         ));
//                       },
//                       child: const Text(
//                         "View Details",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               separatorBuilder: (context, index) => const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
//                 child: Divider(
//                   thickness: 1,
//                   height: 2,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: screenHeight * 0.05)
//         ],
//       ),
//     );
//   }

//   Row buildOrderHistoryDetail(String title, String text) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           title,
//           style: GoogleFonts.poppins(color: Colors.grey[600]),
//         ),
//         Text(text),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:gocart/Account%20Screen%20Pages/Order/order_tile_widget.dart';
import 'package:gocart/Controllers/user_provider.dart';
import 'package:gocart/utils.dart';
import 'package:provider/provider.dart';
import '../../Models/order_history_model.dart';
import '../../Models/order_history_provider.dart';

class OrderHistoryPage extends StatelessWidget {
  OrderHistoryPage({Key? key}) : super(key: key);
  List<OrderHistory> history = [];
  // List<String> id = [];
  @override
  Widget build(BuildContext context) {
    // Get the Order history from the provider
<<<<<<< HEAD
    // history = context.read<OrderHistoryProvider>().items;
=======
    history = context.watch<OrderHistoryProvider>().hisotry;
    // id = context.read<UserProvider>().userProfile.orderHistoryIDs;
>>>>>>> 31cf9f6848b6d47592c2c96855c4475cb8d4c8e9
    final double screenHeight = MediaQuery.of(context).size.height;
    Widget MyOrderList() {
      print(history.length);
      return Column(
        children: <Widget>[
          // OrderTile for each order in the history
          // This is Equalent to ListView.builder
          // ie: just making a list of OrderTile
          for (var item in history) OrderTile(order: item),
          for (var item in history) Text(item.orderID),
          Text("Hot reload check"),
        ],
      );
    }

    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: Column(
        children: <Widget>[
          const HeaderBar(title: "Order History"),
          SizedBox(height: screenHeight * 0.05),
          SingleChildScrollView(
            // Build a List of the Orders
            child: MyOrderList(),
          ),
        ],
      ),
    );
  }
}
