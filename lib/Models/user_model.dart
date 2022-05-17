// Model for Firebase
// ignore_for_file: curly_braces_in_flow_control_structures

class UserProfileModel {
  final String email;
  final String name;
  final String phone;
  final String address;
  final String city;
  final String display;
  final String cartID;
  final List<String> addresses;
  final List<String> cards;
  final List<String> wishListIDs;
  final List<String> orderHistoryIDs;

  UserProfileModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    required this.display,
    required this.addresses,
    required this.cards,
    required this.wishListIDs,
    required this.cartID,
    required this.orderHistoryIDs,
  });

  static fromJson(Map<String, dynamic> json) {
    var firebaseData = [];

    // Convert List<dynamic> to List<String> for addresses
    firebaseData = json['addressIDs'] ?? [];
    List<String> addressIDs = [];
    for (var id in firebaseData) addressIDs.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for cards
    firebaseData = json['cardIDs'] ?? [];
    List<String> cardIDs = [];
    for (var id in firebaseData) cardIDs.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for wishlist
    firebaseData = json['wishlistIDs'] ?? [];
    List<String> favIDs = [];
    for (var id in firebaseData) favIDs.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for order history
    firebaseData = json['orderIDs'] ?? [];
    List<String> orderIDs = [];
    for (var id in firebaseData) orderIDs.add(id.toString().trim());

    return UserProfileModel(
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      display: json['display'],
      cartID: json['cartID'] ?? "",
      addresses: addressIDs,
      cards: cardIDs,
      wishListIDs: favIDs,
      orderHistoryIDs: orderIDs,
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
      'cardIDs': cards,
      'wishlistIDs': wishListIDs,
      'cartID': cartID,
      'orderIDs': orderHistoryIDs,
    };
  }
}
