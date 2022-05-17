import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/Widgets/searchlist_builder_widget.dart';
import 'package:gocart/Models/filter_query_model.dart';
import 'package:gocart/Controllers/item_provider.dart';
import 'package:gocart/Controllers/search_provider.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Entities/item_entity.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Item> list = [];
  bool _filterPopup = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SearchProvider>().resetSearch();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    _filterPopup = context.watch<SearchProvider>().getPopupOpen;
    list = context.watch<SearchProvider>().search;
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
            onTap: () {
              context.read<SearchProvider>().resetSearch();
              context.read<SearchProvider>().openPopup();
              setState(() {});
            },
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Search Bar
            searchBar(),
            SizedBox(height: screenHeight * 0.02),
            // Filter Button Divider
            filterButton(screenHeight),
            // Filter Results
            SearchListBuilder(items: list, searchQuery: _searchController.text)
          ],
        ),
        _filterPopup
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(),
              )
            : Container(),
        _filterPopup
            ? Center(heightFactor: 5.0, child: FilterMenu())
            : Container(),
      ]),
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
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }
}

class FilterMenu extends StatefulWidget {
  FilterMenu({Key? key}) : super(key: key);

  @override
  State<FilterMenu> createState() => _FilterMenuState();
}

class _FilterMenuState extends State<FilterMenu> {
  int min = 0;
  int max = 100;
  bool isARCompatible = false;
  late double _fontSize;
  late List<String> allCategories;
  late List<String> allColors;
  late List<String> allSizes;
  late List<int> priceRange;
  late FilterQuery filterQuery;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterQuery = FilterQuery();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    _fontSize = screenHeight * 0.017;
    // Fetch
    allCategories = context.read<ItemProvider>().getAllCategory();
    allColors = context.read<ItemProvider>().getAllColors();
    allSizes = context.read<ItemProvider>().getAllSizes();
    priceRange = context.read<ItemProvider>().getPriceRange();

    Widget categoryDropDown() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Category: ",
            style: GoogleFonts.poppins(
              color: Colors.black54,
              fontSize: _fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black54,
                width: 1,
              ),
              color: Colors.white70,
            ),
            child: DropdownButton<String>(
              value: filterQuery.category == ""
                  ? allCategories.first
                  : filterQuery.category,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: screenHeight * 0.05,
              dropdownColor: Colors.grey.shade50,
              elevation: 0,
              alignment: AlignmentDirectional.centerStart,
              borderRadius: BorderRadius.circular(15),
              style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: screenHeight * 0.015,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (String? newValue) {
                filterQuery.category = newValue ?? "";
                setState(() {});
              },
              items: allCategories.map((opt) {
                return DropdownMenuItem<String>(
                  value: opt,
                  child: Text(opt.split(" ").first),
                );
              }).toList(),
            ),
          ),
        ],
      );
    }

    Widget sizeFilter() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Size: ",
            style: GoogleFonts.poppins(
              color: Colors.black54,
              fontSize: _fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black54,
                width: 1,
              ),
              color: Colors.white70,
            ),
            child: DropdownButton<String>(
              value: filterQuery.size == "" ? allSizes.first : filterQuery.size,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: screenHeight * 0.05,
              dropdownColor: Colors.grey.shade50,
              elevation: 0,
              alignment: AlignmentDirectional.centerStart,
              borderRadius: BorderRadius.circular(15),
              style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: screenHeight * 0.015,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (String? newValue) {
                filterQuery.size = newValue ?? "";
                setState(() {});
              },
              items: allSizes.map((opt) {
                return DropdownMenuItem<String>(
                  value: opt,
                  child: Text(opt),
                );
              }).toList(),
            ),
          ),
        ],
      );
    }

    Widget colorDropDown() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Color: ",
            style: GoogleFonts.poppins(
              color: Colors.black54,
              fontSize: _fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black54,
                width: 1,
              ),
              color: Colors.white70,
            ),
            child: DropdownButton<String>(
              value:
                  filterQuery.color == "" ? allColors.first : filterQuery.color,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: screenHeight * 0.05,
              dropdownColor: Colors.grey.shade50,
              elevation: 0,
              alignment: AlignmentDirectional.centerStart,
              borderRadius: BorderRadius.circular(15),
              style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: screenHeight * 0.015,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (String? newValue) {
                filterQuery.color = newValue ?? allColors.first;
                setState(() {});
              },
              items: allColors.map((opt) {
                return DropdownMenuItem<String>(
                  value: opt,
                  child: Text(opt),
                );
              }).toList(),
            ),
          ),
        ],
      );
    }

    Widget radioButton(text, isSelected, left) {
      return ElevatedButton(
        onPressed: () {
          isARCompatible = text == "Yes" ? true : false;
          filterQuery.arCompatible = isARCompatible;
          setState(() {});
        },
        child: Text(text),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(screenHeight * 0.06, screenHeight * 0.02),
          primary: isSelected ? Colors.grey : Colors.white,
          onPrimary: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: left
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
          ),
          shadowColor: Colors.grey.shade900,
          side: BorderSide(color: Colors.grey.shade900, width: 1),
        ),
      );
    }

    Widget arCompatible() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "AR Compatible: ",
            style: GoogleFonts.poppins(
              color: Colors.black54,
              fontSize: _fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(child: Container()),
          radioButton("Yes", isARCompatible, true),
          radioButton("No", !isARCompatible, false),
        ],
      );
    }

    Widget priceTextBox() {
      int scaleFactor = ((priceRange[1] - priceRange[0]) / 100).round();
      int priceMin = scaleFactor * min;
      int priceMax = scaleFactor * max;
      filterQuery.price = [priceMin, priceMax];
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Price: ",
            style: GoogleFonts.poppins(
              color: Colors.black54,
              fontSize: _fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black54,
                width: 1,
              ),
              color: Colors.white70,
            ),
            child: Text("PKR $priceMin - $priceMax.".padRight(30)),
          ),
        ],
      );
    }

    Widget priceSlider() {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black54,
            width: 1,
          ),
          color: Colors.white70,
        ),
        child: RangeSlider(
          values: RangeValues(min * 1.0, max * 1.0),
          max: 100.0,
          activeColor: Colors.redAccent,
          onChanged: (newValues) {
            min = newValues.start.round();
            max = newValues.end.round();
            setState(() {});
          },
        ),
      );
    }

    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(32),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Filter Products",
              style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: _fontSize * 1.5,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 16),
            categoryDropDown(),
            const SizedBox(height: 20),
            sizeFilter(),
            const SizedBox(height: 20),
            colorDropDown(),
            const SizedBox(height: 20),
            arCompatible(),
            const SizedBox(height: 20),
            priceTextBox(),
            const SizedBox(height: 20),
            priceSlider(),
            const SizedBox(height: 40),
            coolButton(
                text: "Filter",
                functionToComply: () {
                  context.read<SearchProvider>().filterByQuery(filterQuery);
                  context.read<SearchProvider>().closePopup();
                }),
          ],
        ));
  }
}
