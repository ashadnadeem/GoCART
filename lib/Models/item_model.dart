class Item {
  Item({
    required this.name,
    required this.description,
    required this.price,
    this.isFav = false,
    required this.image,
    this.isAR = false,
  });

  final String name;
  final String description;
  final int price;
  bool isFav;
  final String image;
  bool isAR;

  bool get getFav => isFav;
}
