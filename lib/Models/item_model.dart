class Item {
  Item({
    required this.name,
    required this.description,
    required this.price,
    this.isFav = false,
    required this.image,
    this.ar_link,
  });

  final String name;
  final String description;
  final int price;
  bool isFav;
  final String image;
  String? ar_link;

  bool get getFav => isFav;
}
