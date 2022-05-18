import '../Entities/cart_entity.dart';

class OrderHistory {
  OrderHistory({
    required this.cart,
    required this.status,
    required this.paymentMethod,
    required this.deliveryAddress,
  });

  Cart cart;
  late final String orderID;
  String status;
  String paymentMethod;
  String deliveryAddress;
}
