class Item {
  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.itemCount = 0,
    this.ar_link,
  });

  final String id;
  final String name;
  final String description;
  final int price;
  final String image;
  int itemCount;
  String? ar_link;
}
