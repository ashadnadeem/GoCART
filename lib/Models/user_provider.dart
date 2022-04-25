import 'package:flutter/material.dart';
import 'package:gocart/Models/user_model.dart';

class UserProvider extends ChangeNotifier {
  // Will be initialized to when the user is logged in
  late UserProfile userProfile;

  UserProfile get user => userProfile;

  void initUser(UserProfile userProfile) {
    this.userProfile = userProfile;
    notifyListeners();
  }
}
