import 'package:flutter/material.dart';

import '../../Models/item_model.dart';
import '../ItemDetailPage.dart';

class ItemGrid extends StatelessWidget {
  const ItemGrid({
    required this.searchlist,
    required this.scrollable,
    Key? key,
  }) : super(key: key);
  final List<Item> searchlist;
  final bool scrollable;
  @override
  Widget build(BuildContext context) {
    Column buildSubText(int index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            searchlist[index].name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            "PKR ${searchlist[index].price.toString()}",
            style: const TextStyle(
              fontWeight: FontWeight.normal,
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
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                image: DecorationImage(
                    image: NetworkImage(
                      searchlist[index].image,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            searchlist[index].arLink.isNotEmpty
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

    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        physics: scrollable
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: searchlist.length,
        itemBuilder: (BuildContext ctx, index) {
          return Column(
            children: [
              Expanded(
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ItemDetail(product: searchlist[index]),
                      ));
                    },
                    child: buildCard(index)),
              ),
              buildSubText(index)
            ],
          );
        },
      ),
    );
  }
}
