// User Profile for UI
class UserProfile {
  final String id;
  final String email;
  String name;
  String phone;
  String address;
  String city;
  String display;
  String cartID;
  List<String> addressIDs;
  List<String> cardIDs;
  List<String> wishListIDs;
  List<String> orderHistoryIDs;

  UserProfile({
    required this.id,
    required this.email,
    this.name = '',
    this.phone = '',
    this.address = '',
    this.city = '',
    this.cartID = '',
    this.display = 'https://img.icons8.com/bubbles/50/000000/user.png',
    this.addressIDs = const [""],
    this.cardIDs = const [""],
    this.wishListIDs = const [""],
    this.orderHistoryIDs = const [""],
  });
}
