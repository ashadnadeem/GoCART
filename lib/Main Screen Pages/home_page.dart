import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/Widgets/brand_builder_widget.dart';
import 'package:gocart/Main%20Screen%20Pages/Widgets/item_grid_widget.dart';
import 'package:gocart/Main%20Screen%20Pages/Widgets/trending_builder_widget.dart';
import 'package:gocart/Models/brand_model.dart';
import 'package:gocart/Models/brand_provider.dart';
import 'package:gocart/Models/debitcard_provider.dart';
import 'package:gocart/Models/item_model.dart';
import 'package:gocart/Models/item_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Models/address_provider.dart';
import '../Models/search_provider.dart';
import '../Models/user_provider.dart';
import '../Models/wishlist_provider.dart';

class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);

  List<Item> items = [];
  List<Item> trending = [];
  List<Brand> brands = [];
  List<String> addressIDs = [];
  List<String> cardIDs = [];
  List<String> wishlistIDs = [];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    items = context.read<ItemProvider>().items;
    context.read<SearchProvider>().filterByTrending();
    trending = context.read<SearchProvider>().search;
    brands = context.read<BrandProvider>().brands;
    Future.delayed(Duration.zero, () async {
      // Load Saved Address
      addressIDs = context.read<UserProvider>().user.addressIDs;
      context.read<AddressProvider>().loadAddress(addressIDs);
      // Load Saved Cards
      cardIDs = context.read<UserProvider>().user.cardIDs;
      context.read<CardProvider>().loadCard(cardIDs);

      // Load Users WishList
      wishlistIDs = context.read<UserProvider>().user.wishListIDs;
      context.read<WishListProvider>().loadWishListItems(items, wishlistIDs);
    });
    Widget textDivider(String text) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: screenWidth * 0.04),
          Text('$text  ',
              style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: screenHeight * 0.020,
                  fontWeight: FontWeight.w300)),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.grey,
            ),
          ),
          Container(width: screenWidth * 0.04),
        ],
      );
    }

    Widget moreForYouBuilder() {
      items.shuffle();
      return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: screenWidth / (screenHeight * 0.68),
          crossAxisCount: 3,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          children: [
            // Load Only first 6 items
            for (var i = 0; i < 6; i++) ItemCard(items: items, index: i),
            // Load More Items redirect to another page with all items categorised
          ]);
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: screenHeight * 0.03),
          textDivider('Recomended Brands'),
          SizedBox(height: screenHeight * 0.015),
          BrandListBuilder(
            screenWidth: screenWidth,
            arCompatiblity: false,
            brands: brands,
            // items: items,
          ),
          SizedBox(height: screenHeight * 0.015),
          textDivider('Trending'),
          SizedBox(height: screenHeight * 0.015),
          // ItemCardList(
          //   screenWidth: screenWidth,
          //   cardWidth: 100,
          //   hasSubtext: true,
          //   isTrending: true,
          //   items: items,
          //   brands: brands,
          // ),
          TrendingListBuilder(screenWidth: screenWidth, items: trending),
          SizedBox(height: screenHeight * 0.015),
          textDivider('AR Compatible'),
          SizedBox(height: screenHeight * 0.015),
          BrandListBuilder(
            screenWidth: screenWidth,
            arCompatiblity: true,
            brands: brands,
          ),
          textDivider('More For You'),
          SizedBox(height: screenHeight * 0.015),
          // Item Grids
          moreForYouBuilder(),
        ],
      ),
    );
  }
}
