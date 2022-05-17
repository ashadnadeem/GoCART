class Cart {
  Cart({
    required this.cartID,
    required this.productID,
    required this.qty,
    required this.color,
    required this.size,
    required this.total,
  });

  String cartID;
  List<String> productID;
  List<int> qty;
  List<String> color;
  List<String> size;
  int total;
}
