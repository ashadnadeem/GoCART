import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/U_ItemDetailPage.dart';

//Homepage Item Card
class ItemCardList extends StatelessWidget {
  const ItemCardList({
    Key? key,
    required this.screenWidth,
    required this.cardWidth,
    required this.hasSubtext,
    required this.isTrending,
    //required this.cardHeigth,
  }) : super(key: key);

  final double screenWidth;
  final double cardWidth;
  final bool hasSubtext;
  final bool isTrending;
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
        itemCount: 4,
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ItemDetail(),
                  ));
                },
                child: buildCard(index),
              ),
              if (hasSubtext)
                isTrending ? buildTrendingSubtext() : buildARSubtext()
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
      child: SizedBox(
        width: cardWidth,
        height: 100,
      ),
    );
  }

  // build subtext for AR Compatible section
  Text buildARSubtext() {
    return const Text(
      "Nike",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  // build subtext for Trending section
  Padding buildTrendingSubtext() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Nike",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            "Contour 40",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
          Text(
            "PKR 12,000",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
