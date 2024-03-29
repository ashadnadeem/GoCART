import 'package:flutter/material.dart';
import 'package:gocart/Models/brand_model.dart';
import 'package:gocart/Controllers/brand_provider.dart';
import 'package:gocart/Controllers/item_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Controllers/search_provider.dart';
import '../../Entities/item_entity.dart';
import 'Widgets/brand_builder_widget.dart';
import 'Widgets/trending_builder_widget.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);

  List<Item> items = [];
  List<Item> trending = [];
  List<Brand> brands = [];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    items = context.read<ItemProvider>().items;
    context.read<SearchProvider>().filterByTrending();
    trending = context.read<SearchProvider>().search;
    brands = context.read<BrandProvider>().brands;

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
