import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/ItemDetailPage.dart';
import 'package:gocart/Main%20Screen%20Pages/Widgets/item_list_widgets.dart';
import 'package:gocart/Models/item_model.dart';

class WishListBuilder extends StatefulWidget {
  WishListBuilder({Key? key, required this.wishlist}) : super(key: key);

  List<Item> wishlist;
  @override
  State<WishListBuilder> createState() => _WishListBuilderState();
}

class _WishListBuilderState extends State<WishListBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.wishlist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FavButton(item: widget.wishlist[index]),
                  ItemThumbnail(item: widget.wishlist[index]),
                ],
              ),
              title: Text(widget.wishlist[index].name),
              isThreeLine: true,
              subtitle: Text(
                  "${widget.wishlist[index].description}\nPKR ${widget.wishlist[index].price.toString()}"),
              trailing: ArrowButton(item: widget.wishlist[index]),
            ),
          );
        },
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.all(8),
          child: Divider(
            height: 2,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
