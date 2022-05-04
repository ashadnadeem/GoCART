import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/ItemDetailPage.dart';
import 'package:gocart/Models/brand_model.dart';
import 'package:gocart/Models/item_model.dart';
import 'package:gocart/Models/search_provider.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BrandDetailPage extends StatefulWidget {
  BrandDetailPage({
    Key? key,
    required this.brand,
    required this.ar,
  }) : super(key: key);

  Brand brand;
  bool ar;

  @override
  State<BrandDetailPage> createState() => _BrandDetailPageState();
}

class _BrandDetailPageState extends State<BrandDetailPage> {
  List<Item> searchlist = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      setState(() {
        // context.read<SearchProvider>().filterByBrand(brandid: widget.brand.id);
        context
            .read<SearchProvider>()
            .filterProds(brandid: widget.brand.id, ar: widget.ar);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    searchlist = context.watch<SearchProvider>().search;

    return Scaffold(
      appBar: const MyAppBar(implyLeading: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Brand Name
              Text(
                widget.brand.name,
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 33, 32, 32),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Address
              Text(
                widget.brand.address,
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 33, 32, 32),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Website Link clickable to open in browser, color blue
              InkWell(
                child: Text(
                  widget.brand.website,
                  style: GoogleFonts.poppins(
                    color: Colors.deepPurple,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // launch(widget.brand.website);
                },
              ),
              const SizedBox(height: 10),
              // GridView of Items in the brand
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
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
              )
            ],
          ),
        ),
      ),
    );
  }

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
          searchlist[index].ar_link != null
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
