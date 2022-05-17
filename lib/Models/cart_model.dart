class CartModel {
  CartModel({
    required this.productID,
    required this.qty,
    required this.color,
    required this.size,
    required this.total,
  });

  final List<String> productID;
  final List<int> qty;
  final List<String> color;
  final List<String> size;
  final int total;

  static fromJson(Map<String, dynamic> json) {
    var firebase_data = [];

    // Convert List<dynamic> to List<String> for colors
    firebase_data = json['color'] ?? [];
    var colors = firebase_data as List<dynamic>;
    List<String> colorsIDs = [];
    for (var id in colors) colorsIDs.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for product IDs
    firebase_data = json['productID'] ?? [];
    var prods = firebase_data as List<dynamic>;
    List<String> prodsID = [];
    for (var id in prods) prodsID.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for quantities
    firebase_data = json['qty'] ?? [];
    var quantities = firebase_data as List<dynamic>;
    List<int> quants = [];
    for (var id in quantities) quants.add(id);

    // Convert List<dynamic> to List<String> for sizes
    firebase_data = json['size'] ?? [];
    var sizeids = firebase_data as List<dynamic>;
    List<String> sizeIDs = [];
    for (var id in sizeids) sizeIDs.add(id);

    return CartModel(
      color: colorsIDs,
      productID: prodsID,
      qty: quants,
      size: sizeIDs,
      total: json['total'],
    );
  }

  toJson() {
    return {
      'color': color,
      'productID': productID,
      'qty': qty,
      'size': size,
      'total': total,
    };
  }
}
