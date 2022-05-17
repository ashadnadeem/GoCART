// ignore_for_file: non_constant_identifier_names

class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.address,
    required this.website,
    this.hasAR = false,
    required this.image,
    this.ar_link,
  });

  final String id;
  final String name;
  final String address;
  final String website;
  bool hasAR;
  final String image;
  String? ar_link;
  bool get getAR => hasAR;
}
