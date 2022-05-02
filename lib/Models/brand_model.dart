class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.address,
    this.hasAR = false,
    required this.image,
    this.ar_link,
  });

  final String id;
  final String name;
  final String address;
  bool hasAR;
  final String image;
  String? ar_link;
  bool get getAR => hasAR;
}
