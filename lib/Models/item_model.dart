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

// Item Model Class
class ItemModel {
  final String brandID;
  final String name;
  final String description;
  final String category;
  final int price;
  final List<String> images;
  final List<String> colors;
  final List<String> sizes;
  final String arLink;
  final bool isTrending;
  ItemModel({
    required this.brandID,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
    this.colors = const ['not selected', 'red', 'blue', 'green'],
    this.sizes = const ['NA', 'S', 'M', 'L', 'XL'],
    this.arLink = "",
    this.isTrending = false,
  });

  static fromJson(Map<String, dynamic> json) {
    // Convert List<dynamic> to List<String> for colors
    List<String> colorList = ['not selected'];
    List<String> sizeList = ['NA'];
    List<String> imageList = [];
    if (json['colors'] != null) {
      var colors = json['colors'] as List<dynamic>;
      for (var id in colors) colorList.add(id.toString().trim());
    }
    if (json['sizes'] != null) {
      var sizes = json['sizes'] as List<dynamic>;
      for (var id in sizes) sizeList.add(id.toString().trim());
    }
    if (json['images'] != null) {
      var images = json['images'] as List<dynamic>;
      for (var id in images) imageList.add(id.toString().trim());
    }
    return ItemModel(
      name: json['name'],
      description: json['description'] ?? "No description",
      price: json['price'] ?? 0,
      images: imageList,
      category: json['category'],
      colors: colorList,
      sizes: sizeList,
      arLink: json['arLink'] ?? "",
      brandID: json['brandID'] ?? "404",
      isTrending: json['isTrending'] ?? false,
    );
  }

  toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'image': images,
      'category': category,
      'colors': colors,
      'sizes': sizes,
      'arLink': arLink,
      'brandID': brandID,
      'isTrending': isTrending,
    };
  }
}
