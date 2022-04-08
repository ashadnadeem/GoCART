import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/U_ItemDetailPage.dart';
import 'package:gocart/Models/item_model.dart';
import 'package:gocart/Models/item_provider.dart';
import 'package:provider/provider.dart';

// Final list of items widget
// ignore: must_be_immutable
class ItemList extends StatefulWidget {
  ItemList({
    Key? key,
    required this.items,
    required this.isWishlist,
    this.searchQuery = "",
  }) : super(key: key);

  List<Item> items;
  bool isWishlist;
  String searchQuery;

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: widget.items[index].name == widget.searchQuery ||
                    (widget.isWishlist == true && widget.items[index].isFav)
                ? ListTile(
                    leading: !widget.isWishlist
                        ? ItemThumbnail(item: widget.items[index])
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FavIcon(item: widget.items[index]),
                              ItemThumbnail(item: widget.items[index]),
                            ],
                          ),
                    title: Text(widget.items[index].name),
                    isThreeLine: true,
                    subtitle: Text(
                        "${widget.items[index].description}\nPKR ${widget.items[index].price.toString()}"),
                    trailing: ArrowButton(item: widget.items[index]),
                  )
                : null,
          );
        },
        separatorBuilder: (context, index) =>
            (widget.items[index].name == widget.searchQuery) ||
                    (widget.items[index].isFav && widget.isWishlist)
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
            item.image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Favourites Icon used in list - Only in wishlist page
class FavIcon extends StatefulWidget {
  const FavIcon({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(right: 20),
      onPressed: () {
        widget.item.isFav
            ? context.read<ItemProvider>().removeFromWishlist(widget.item)
            : context.read<ItemProvider>().addToWishlist(widget.item);
        setState(() {});
      },
      icon: !widget.item.isFav
          ? const Icon(
              Icons.favorite_border_outlined,
              color: Color.fromARGB(255, 46, 44, 44),
            )
          : const Icon(Icons.favorite_rounded),
      color: Colors.red,
    );
  }
}
