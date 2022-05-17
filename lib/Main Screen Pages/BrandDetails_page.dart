import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/ItemDetailPage.dart';
import 'package:gocart/Models/brand_model.dart';
import 'package:gocart/Controllers/search_provider.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Entities/item_entity.dart';
import 'Widgets/item_grid_widget.dart';

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
                  fontSize: 40,
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
              ItemGrid(searchlist: searchlist, scrollable: true),
            ],
          ),
        ),
      ),
    );
  }
}
