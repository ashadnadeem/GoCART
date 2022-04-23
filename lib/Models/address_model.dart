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
  late final String id;
  bool defaultAddress;
}

class AddressModel {
  final String name;
  final String address;
  final String city;
  final String phone;
  final String zip;
  final bool defaultAddress;

  AddressModel({
    required this.name,
    required this.address,
    required this.city,
    required this.phone,
    required this.zip,
    this.defaultAddress = false,
  });

  static fromJson(Map<String, dynamic> json) {
    return AddressModel(
      name: json['name'],
      address: json['address'],
      city: json['city'],
      phone: json['phone'],
      zip: json['zip'],
      defaultAddress: json['defaultAddress'],
    );
  }

  toJson() {
    return {
      'name': name,
      'address': address,
      'city': city,
      'phone': phone,
      'zip': zip,
      'defaultAddress': defaultAddress,
    };
  }
}
