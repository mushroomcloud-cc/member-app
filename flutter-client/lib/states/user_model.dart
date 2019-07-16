import 'package:flutter/material.dart';
import 'package:member_app/models/user.dart';

class UserModel with ChangeNotifier {
  User _user = User();

  User get user => _user;

  setUser(User value) {
    _user = value;
    notifyListeners();
  }
}
