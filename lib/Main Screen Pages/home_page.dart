import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/Widgets/brand_builder_widget.dart';
import 'package:gocart/Main%20Screen%20Pages/Widgets/trending_builder_widget.dart';
import 'package:gocart/Models/brand_model.dart';
import 'package:gocart/Models/brand_provider.dart';
import 'package:gocart/Models/item_model.dart';
import 'package:gocart/Models/item_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);

  List<Item> items = [];
  List<Brand> brands = [];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    items = context.read<ItemProvider>().items;
    brands = context.read<BrandProvider>().brands;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                Text('Recomended Brands  ',
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
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            BrandListBuilder(
              screenWidth: screenWidth,
              hasSubtext: false,
              brands: brands,
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: screenWidth * 0.04),
                Text('Trending  ',
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w300)),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Container(width: screenWidth * 0.04),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            // ItemCardList(
            //   screenWidth: screenWidth,
            //   cardWidth: 100,
            //   hasSubtext: true,
            //   isTrending: true,
            //   items: items,
            //   brands: brands,
            // ),
            TrendingListBuilder(screenWidth: screenWidth, items: items),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: screenWidth * 0.04),
                Text('AR Compatible  ',
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
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            BrandListBuilder(
              screenWidth: screenWidth,
              hasSubtext: true,
              brands: brands,
            ),
          ],
        ),
      ),
    );
  }
}
