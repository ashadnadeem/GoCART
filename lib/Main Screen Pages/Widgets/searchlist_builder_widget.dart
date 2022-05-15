import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/ItemDetailPage.dart';
import 'package:gocart/Models/item_model.dart';
import 'package:gocart/utils.dart';

// Final list of items widget
// ignore: must_be_immutable
class SearchListBuilder extends StatefulWidget {
  SearchListBuilder({
    Key? key,
    required this.items,
    this.searchQuery = "",
  }) : super(key: key);

  List<Item> items;
  String searchQuery;

  @override
  State<SearchListBuilder> createState() => _SearchListBuilderState();
}

class _SearchListBuilderState extends State<SearchListBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return (widget.items[index].name + widget.items[index].description)
                  .toLowerCase()
                  .contains(widget.searchQuery.toLowerCase())
              ? ListTile(
                  leading: ItemThumbnail(item: widget.items[index]),
                  title: Text(TextFormatter.productNameFormatter(
                      widget.items[index].name)),
                  isThreeLine: true,
                  subtitle: Text(
                      "${widget.items[index].category}\nPKR ${widget.items[index].price.toString()}"),
                  trailing: ArrowButton(item: widget.items[index]),
                )
              : Container();
        },
        separatorBuilder: (context, index) =>
            (widget.items[index].name == widget.searchQuery)
                ? const Divider(
                    height: 2,
                    color: Colors.black,
                  )
                : const SizedBox(height: 0),
      ),
    );
  }
}

// Arrow button in each list tile
class ArrowButton extends StatelessWidget {
  const ArrowButton({
    required this.item,
    Key? key,
  }) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Color.fromARGB(255, 46, 44, 44),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemDetail(product: item),
          ),
        );
      },
    );
  }
}

// Item Tumbnail in each list tile
class ItemThumbnail extends StatelessWidget {
  const ItemThumbnail({Key? key, required this.item}) : super(key: key);

  final Item item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.5),
        color: const Color.fromARGB(255, 46, 44, 44),
        image: DecorationImage(
          image: NetworkImage(
            item.images.first,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
