class Item {
  Item({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.isFav = false,
    this.ar_link,
  });

  final String name;
  final String description;
  final int price;
  final String image;
  bool isFav;
  String? ar_link;

  bool get getFav => isFav;
}
