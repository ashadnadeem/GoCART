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
          onTap: () async {
            bool isFilter = false;
            isFilter = await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return SimpleDialog(
                          title: const Text("Filter Search"),
                          children: [
                            const FilterOptionWidget(
                              items: <String>[
                                'T-Shirt',
                                'Jeans',
                                'Mask',
                                'Specs',
                                'Kurtis',
                                'Shoes',
                              ],
                              title: "Category",
                            ),
                            const FilterOptionWidget(
                              items: <String>[
                                'Black',
                                'Red',
                                'Yellow',
                                'Blue',
                              ],
                              title: "Colors",
                            ),
                            const FilterOptionWidget(
                              items: <String>[
                                'Small',
                                'Medium',
                                'Large',
                                'Extra Large'
                              ],
                              title: "Size",
                            ),
                            const FilterOptionWidget(
                              items: <String>[
                                'Yes',
                                'No',
                              ],
                              title: "AR Compatible",
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 32.0, right: 32),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: const Text(
                                      "Filter",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      });
                });
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

class FilterOptionWidget extends StatelessWidget {
  const FilterOptionWidget({
    Key? key,
    required this.items,
    required this.title,
  }) : super(key: key);

  final List<String> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("$title: "),
          DropDownWidget(
            items: items,
          ),
        ],
      ),
    );
  }
}

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key, required this.items}) : super(key: key);

  final List<String> items;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String dropdownValue = "";

  @override
  void initState() {
    dropdownValue = widget.items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      elevation: 16,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: SizedBox(width: 75, child: Text(value)),
        );
      }).toList(),
    );
  }
}
