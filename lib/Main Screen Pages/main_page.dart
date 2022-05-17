import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/CartPage.dart';
import 'package:gocart/Main%20Screen%20Pages/home_page.dart';
import 'package:gocart/Main%20Screen%20Pages/search_page.dart';
import 'package:gocart/Main%20Screen%20Pages/wishlist_page.dart';
import 'package:gocart/Controllers/cart_provider.dart';
import 'package:gocart/Models/order_history_provider.dart';
import 'package:gocart/utils.dart';
import 'package:provider/provider.dart';

import '../Entities/item_entity.dart';
import '../Controllers/address_provider.dart';
import '../Controllers/debitcard_provider.dart';
import '../Controllers/item_provider.dart';
import '../Controllers/user_provider.dart';
import '../Controllers/wishlist_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> list = [Home(), SearchPage(), WishlistPage(), CartPage()];
  int _currentIndex = 0;

  // Load all the data from the Firebase for whole app
  List<String> addressIDs = [];
  List<String> cardIDs = [];
  List<String> wishlistIDs = [];
  List<String> orderHistoryIDs = [];
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () async {
      List<Item> items = context.read<ItemProvider>().items;
      print("ITEMS Loaded: ${items.length}");
      // Load Saved Address
      addressIDs = context.read<UserProvider>().user.addressIDs;
      context.read<AddressProvider>().loadAddress(addressIDs);
      print("ADDRESSES Loaded: ${addressIDs.length}");
      // Load Saved Cards
      cardIDs = context.read<UserProvider>().user.cardIDs;
      context.read<CardProvider>().loadCard(cardIDs);
      print("CARDS Loaded: ${cardIDs.length}");
      // Load Users WishList
      wishlistIDs = context.read<UserProvider>().user.wishListIDs;
      context.read<WishListProvider>().loadWishListItems(items, wishlistIDs);
      print("WISHLIST Loaded: ${wishlistIDs.length}");

      context.read<CartProvider>().initCart(context.read<UserProvider>().user);
      print("Cart Loaded: ${wishlistIDs.length}");
      // Load Users OrderHistory
      orderHistoryIDs = context.read<UserProvider>().user.orderHistoryIDs;
      context.read<OrderHistoryProvider>().loadHistory(orderHistoryIDs);
      print("Order History Loaded: ${orderHistoryIDs.length}");
    });

    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: list[_currentIndex],
      bottomNavigationBar: bottomNavBar(),
    );
  }

  BottomNavyBar bottomNavBar() {
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      containerHeight: 60,
      curve: Curves.easeIn,
      backgroundColor: const Color.fromARGB(255, 33, 32, 32),
      onItemSelected: (index) => setState(
        () {
          _currentIndex = index;
        },
      ),
      items: [
        BottomNavyBarItem(
          icon: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          activeColor: Colors.white,
          inactiveColor: Colors.white54,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.search),
          title: const Text('Search'),
          activeColor: Colors.white,
          inactiveColor: Colors.white54,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.favorite_outline_sharp),
          title: const Text('Wishlist'),
          activeColor: Colors.white,
          inactiveColor: Colors.white54,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.shopping_cart_outlined),
          title: const Text('Cart'),
          activeColor: Colors.white,
          inactiveColor: Colors.white54,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
