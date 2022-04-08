import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/U_ItemDetailPage.dart';
import 'package:gocart/Models/brand_model.dart';
import 'package:gocart/Models/item_model.dart';

//Homepage Item Card
class ItemCardList extends StatelessWidget {
  const ItemCardList({
    Key? key,
    required this.screenWidth,
    required this.cardWidth,
    required this.hasSubtext,
    required this.isTrending,
    required this.items,
    required this.brands,
    //required this.cardHeigth,
  }) : super(key: key);

  final double screenWidth;
  final double cardWidth;
  final bool hasSubtext;
  final bool isTrending;
  final List<Item> items;
  final List<Brand> brands;
  //final double cardHeigth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.92,
      height: !hasSubtext ? 120 : 180,
      // height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: isTrending ? items.length : brands.length,
        itemBuilder: (context, index) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: isTrending
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ItemDetail(),
                    ),
                  );
                },
                child: (isTrending || !hasSubtext)
                    ? buildCard(index)
                    : (brands[index].hasAR && hasSubtext)
                        ? buildCard(index)
                        : const SizedBox(),
              ),
              if (hasSubtext)
                isTrending
                    ? buildTrendingSubtext(index)
                    : items[index].isAR
                        ? buildARSubtext(index)
                        : const SizedBox()
            ],
          );
        },
      ),
    );
  }

  // build card
  Card buildCard(int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(27),
      ),
      color:
          index % 2 == 0 ? Colors.red : const Color.fromARGB(255, 46, 44, 44),
      child: Stack(
        children: [
          Container(
            width: cardWidth,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27),
              image: DecorationImage(
                image: NetworkImage(
                  isTrending ? items[index].image : brands[index].image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          (hasSubtext && !isTrending) || (isTrending && items[index].isAR)
              ? const Positioned(
                  right: 10,
                  top: 10,
                  child: Icon(
                    Icons.camera,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  // build subtext for AR Compatible section
  Text buildARSubtext(int index) {
    return Text(
      brands[index].name,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  // build subtext for Trending section
  Padding buildTrendingSubtext(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            items[index].name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            items[index].description,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
          Text(
            items[index].price.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
