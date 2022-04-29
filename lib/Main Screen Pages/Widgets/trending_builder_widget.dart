import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/ItemDetailPage.dart';
import 'package:gocart/Models/item_model.dart';

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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
                padding: const EdgeInsets.only(left: 16.0),
                child: buildSubText(index),
              )
            ],
          );
        },
      ),
    );
  }

  Column buildSubText(int index) {
    return Column(
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
                  items[index].image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          items[index].ar_link != null
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
}
