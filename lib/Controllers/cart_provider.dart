import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:gocart/Models/cart_model.dart';

import '../Entities/cart_entity.dart';
import '../Entities/item_entity.dart';
import '../Entities/user_entity.dart';

class CartProvider extends ChangeNotifier {
  // List<Item> list = [];

  // List<Item> get cart => list;

  CollectionReference firebaseCart =
      FirebaseFirestore.instance.collection('carts');

  // String cartId = "";

  Cart cart = Cart(
    cartID: "",
    productID: [],
    qty: [],
    color: [],
    size: [],
    total: 0,
  );

  Cart get getCart => cart;

  void createCart(UserProfile user) {
    firebaseCart.doc(user.id).set(
          CartModel(
            color: cart.color,
            productID: cart.productID,
            qty: cart.qty,
            size: cart.size,
            total: cart.total,
          ).toJson(),
        );

    notifyListeners();
  }

  void loadCartFromFirebase(UserProfile user) async {
    await firebaseCart.doc(user.id).get().then((doc) {
      // Load User from Firebase to User Provider
      CartModel cartModel =
          CartModel.fromJson(doc.data() as Map<String, dynamic>);
      cart.cartID = user.id;
      cart.color = cartModel.color;
      cart.productID = cartModel.productID;
      cart.qty = cartModel.qty;
      cart.size = cartModel.size;
      cart.total = cartModel.total;
    });
    notifyListeners();
  }

  void initCart(UserProfile userProfile) async {
    firebaseCart.doc(userProfile.id).get().then((doc) {
      if (doc.exists) {
        // Update User Profile
        // print("User ${userProfile.email} is in Firebase");
        loadCartFromFirebase(userProfile);
      } else {
        // Add User to Firebase
        // print("User is not in Firebase");
        createCart(userProfile);
        // print("added in FB!");
      }
    });
  }

  void saveChanges() async {
    await firebaseCart.doc(cart.cartID).set(CartModel(
          productID: cart.productID,
          color: cart.color,
          size: cart.size,
          qty: cart.qty,
          total: cart.total,
        ).toJson());
    print("${cart.total} saved in Firebase");
  }

  void addToCart(Item prod, String color, String size) {
    if (cart.productID.contains(prod.id)) {
      int index = cart.productID.indexOf(prod.id);
      cart.qty[index] += 1;
      cart.color[index] = cart.color[index] + "/" + color;
      cart.size[index] = cart.size[index] + "/" + size;
      cart.total = cart.total + prod.price;
    } else {
      cart.productID.add(prod.id);
      cart.color.add(color);
      cart.size.add(size);
      cart.total = cart.total + prod.price;
      cart.qty.add(1);
    }
    saveChanges();
    notifyListeners();
  }

  void removeFromCart(Item prod) {
    if (cart.productID.contains(prod.id)) {
      int index = cart.productID.indexOf(prod.id);
      if (cart.qty[index] > 1) {
        cart.qty[index] -= 1;
        // String str = "";
        // for (var i in "Black/White".split("/")) str = str + "/" + i;
        // str.replaceFirst("/", "");
        cart.total = cart.total - prod.price;
      } else {
        cart.productID.removeAt(index);
        cart.size.removeAt(index);
        cart.color.removeAt(index);
        cart.qty.removeAt(index);
        cart.total = cart.total - prod.price;
      }
    }
    saveChanges();
    notifyListeners();
  }

  int getCount(Item prod) {
    int index = cart.productID.indexOf(prod.id);

    return cart.qty[index];
  }
}
