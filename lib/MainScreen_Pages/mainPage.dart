import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:gocart/MainScreen_Pages/CartPage.dart';
import 'package:gocart/MainScreen_Pages/HomePage.dart';
import 'package:gocart/MainScreen_Pages/SearchPage.dart';
import 'package:gocart/MainScreen_Pages/WishlistPage.dart';
import 'package:gocart/utils.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Widget> list = const [Home(), SearchPage(), WishlistPage(), CartPage()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: const topBar(),
        appBar: const topBar(implyLeading: false),
        body: list[_currentIndex],
        bottomNavigationBar: BottomBar()
        // bottomNavigationBar: bottomBar(list: list, index: _currInd),
        // bottomNavigationBar: const bottomBar(),
        );
  }

  BottomNavyBar BottomBar() {
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      containerHeight: 60,
      curve: Curves.easeIn,
      backgroundColor: Color.fromARGB(255, 33, 32, 32),
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
