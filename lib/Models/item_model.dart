class Item {
  Item({
    required this.name,
    required this.description,
    required this.price,
    this.isFav = false,
    required this.image,
  });

  final String name;
  final String description;
  final int price;
  bool isFav;
  final String image;

  bool get getFav => isFav;
}
