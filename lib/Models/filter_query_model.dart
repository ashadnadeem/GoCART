class FilterQuery {
  FilterQuery({
    this.category = "",
    this.price = const [0, 100000],
    this.color = "",
    this.size = "",
    this.arCompatible = false,
  });

  String category;
  String color;
  String size;
  bool arCompatible;
  List<int> price;
}
