// For Authentication Firebase
class UserAuth {
  final String id;
  final String email;
  String name;
  String photoUrl;

  UserAuth({
    required this.id,
    required this.email,
    this.name = '',
    this.photoUrl = '',
  });
}

// User Profile for UI
class UserProfile {
  final String id;
  final String email;
  String name;
  String phone;
  String address;
  String city;
  String display;
  List<String> addressIDs;

  UserProfile({
    required this.id,
    required this.email,
    this.name = '',
    this.phone = '',
    this.address = '',
    this.city = '',
    this.display = 'https://img.icons8.com/bubbles/50/000000/user.png',
    this.addressIDs = const [""],
  });
}

// Model for Firebase
class UserProfileModel {
  final String email;
  final String name;
  final String phone;
  final String address;
  final String city;
  final String display;
  final List<String> addresses;

  UserProfileModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    required this.display,
    required this.addresses,
  });

  static fromJson(Map<String, dynamic> json) {
    var adressids = json['addressIDs'] as List<dynamic>;
    // Convert List<dynamic> to List<String>
    List<String> addressIDs = [];
    for (var id in adressids) addressIDs.add(id.toString().trim());

    return UserProfileModel(
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      display: json['display'],
      addresses: addressIDs,
    );
  }

  toJson() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'address': address,
      'city': city,
      'display': display,
      'addressIDs': addresses,
    };
  }
}
