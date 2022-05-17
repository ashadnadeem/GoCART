// ignore_for_file: curly_braces_in_flow_control_structures

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
    var firebaseData = [];

    // Convert List<dynamic> to List<String> for colors
    firebaseData = json['color'] ?? [];
    List<String> colorsIDs = [];
    for (var id in firebaseData) colorsIDs.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for product IDs
    firebaseData = json['productID'] ?? [];
    List<String> prodsID = [];
    for (var id in firebaseData) prodsID.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for quantities
    firebaseData = json['qty'] ?? [];
    List<int> quants = [];
    for (var id in firebaseData) quants.add(id);

    // Convert List<dynamic> to List<String> for sizes
    firebaseData = json['size'] ?? [];
    List<String> sizeIDs = [];
    for (var id in firebaseData) sizeIDs.add(id);

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
