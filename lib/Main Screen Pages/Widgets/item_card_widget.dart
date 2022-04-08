import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/U_ItemDetailPage.dart';
import 'package:gocart/Models/item_model.dart';

//Homepage Item Card
class ItemCardList extends StatelessWidget {
  const ItemCardList(
      {Key? key,
      required this.screenWidth,
      required this.cardWidth,
      required this.hasSubtext,
      required this.isTrending,
      required this.list
      //required this.cardHeigth,
      })
      : super(key: key);

  final double screenWidth;
  final double cardWidth;
  final bool hasSubtext;
  final bool isTrending;
  final List<Item> list;
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
        itemCount: list.length,
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
                child: buildCard(index),
              ),
              if (hasSubtext)
                isTrending ? buildTrendingSubtext(index) : buildARSubtext(index)
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
      child: Expanded(
        child: Container(
          width: cardWidth,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            image: DecorationImage(
              image: NetworkImage(
                list[index].image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  // build subtext for AR Compatible section
  Text buildARSubtext(int index) {
    return Text(
      list[index].name,
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
            list[index].name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            list[index].description,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
          Text(
            list[index].price.toString(),
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
