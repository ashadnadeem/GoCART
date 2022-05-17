class Item {
  Item({
    required this.brandID,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
    this.colors = const ['not selected', 'red', 'blue', 'green'],
    this.sizes = const ['NA', 'S', 'M', 'L', 'XL'],
    this.itemCount = 0, //Need to get rid of this
    this.arLink = '',
    this.isTrending = false,
  });

  final String brandID;
  final String name;
  final String description;
  final String category;
  final int price;
  final List<String> images;
  final bool isTrending;
  List<String> colors;
  List<String> sizes;
  int itemCount;
  String arLink;

  late final String id;
}
