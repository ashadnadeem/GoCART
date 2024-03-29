import 'package:flutter/material.dart';
import 'package:gocart/Models/brand_model.dart';

import '../BrandDetails_page.dart';

//Homepage Item Card
class BrandListBuilder extends StatelessWidget {
  const BrandListBuilder({
    Key? key,
    required this.screenWidth,
    required this.arCompatiblity,
    required this.brands,
    // required this.items,
  }) : super(key: key);

  final double screenWidth;
  final bool arCompatiblity;
  final List<Brand> brands;
  // final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.92,
      height: !arCompatiblity ? 120 : 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BrandDetailPage(
                        brand: brands[index], ar: arCompatiblity),
                  ));
                },
                child: !arCompatiblity
                    ? buildCard(index)
                    : (brands[index].hasAR && arCompatiblity)
                        ? buildCard(index)
                        : const SizedBox(),
              ),
              if (arCompatiblity)
                brands[index].hasAR ? buildARSubtext(index) : const SizedBox()
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
            width: 175,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27),
              image: DecorationImage(
                image: NetworkImage(
                  brands[index].image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          (arCompatiblity) || (brands[index].ar_link != null)
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
}
