import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/ItemDetailPage.dart';
import 'package:gocart/Models/item_model.dart';
import 'package:gocart/utils.dart';

class TrendingListBuilder extends StatelessWidget {
  const TrendingListBuilder({
    Key? key,
    required this.screenWidth,
    required this.items,
  }) : super(key: key);

  final double screenWidth;
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.92,
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(items: items, index: index);
        },
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    required this.items,
    required this.index,
    Key? key,
  }) : super(key: key);
  final List<Item> items;
  final int index;
  @override
  Widget build(BuildContext context) {
    Column buildSubText(int index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextFormatter.productNameFormatter(items[index].name),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            items[index].category.split(' ').first,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
          Text(
            "Rs: ${items[index].price}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
        ],
      );
    }

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
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                image: DecorationImage(
                  image: NetworkImage(
                    items[index].images.first,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            items[index].arLink.isNotEmpty
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.values[1],
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ItemDetail(product: items[index]),
              ),
            );
          },
          child: buildCard(index),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: buildSubText(index),
        ),
      ],
    );
  }
}
