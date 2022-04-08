class Brand {
  Brand({
    required this.name,
    required this.address,
    this.hasAR = false,
    required this.image,
  });

  final String name;
  final String address;
  bool hasAR;
  final String image;

  bool get getAR => hasAR;
}
