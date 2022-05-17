// Stream Provider for Authentication
import 'package:flutter/material.dart';

import '../Entities/user_auth_entity.dart';

class AuthProvider extends ChangeNotifier {
  // Will be initialized to when the user is logged in
  late UserAuth userAuth;

  UserAuth get user => userAuth;

  void initUser(UserAuth userAuth) {
    this.userAuth = userAuth;
    notifyListeners();
  }
}
