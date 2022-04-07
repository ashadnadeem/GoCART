import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/Widgets/item_list_widgets.dart';
import 'package:gocart/Models/item_model.dart';
import 'package:gocart/Models/item_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Item> list = [];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    list = context.watch<ItemProvider>().items;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          searchBar(),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          filterButton(screenHeight),
          ItemList(
              items: list,
              isWishlist: false,
              searchQuery: _searchController.text)
        ],
      ),
    );
  }

  // Filter Button
  Row filterButton(double screenHeight) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'Filter Search',
            style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: screenHeight * 0.020,
                fontWeight: FontWeight.w300,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  // Search Bar
  SizedBox searchBar() {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15),
          hintText: "Search",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: InkWell(
              onTap: () {}, child: const Icon(Icons.arrow_forward_ios_rounded)),
          filled: true,
          fillColor: Colors.grey[350],
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(27),
          ),
        ),
        onSubmitted: (value) {
          setState(() {});
        },
      ),
    );
  }
}
