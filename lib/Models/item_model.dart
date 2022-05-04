class Item {
  Item({
    required this.id,
    required this.brandID,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    this.colors = const ['not selected', 'red', 'blue', 'green'],
    this.sizes = const ['NA', 'S', 'M', 'L', 'XL'],
    this.itemCount = 0, //Need to get rid of this
    this.ar_link,
  });

  final String brandID;
  final String id;
  final String name;
  final String description;
  final String category;
  final int price;
  final String image;
  List<String> colors;
  List<String> sizes;
  int itemCount;
  String? ar_link;
}
