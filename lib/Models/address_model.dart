class Address {
  Address({
    required this.name,
    required this.address,
    required this.city,
    required this.phone,
    required this.zip,
    this.defaultAddress = false,
  });
  String name, address, city, phone, zip;
  bool defaultAddress;
}
