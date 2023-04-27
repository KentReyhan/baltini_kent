import 'package:flutter/material.dart';

import '../hive/hive_helper.dart';
import '../model/hive_model/user.dart';

class UserProvider extends ChangeNotifier {
  User? loginUser;

  getUser(String email, String password) async {
    loginUser = await userBox.values.firstWhere(
        (element) => element.email == email && element.password == password,
        orElse: () => User(
            userID: -1,
            firstName: '-1',
            lastName: '-1',
            email: '-1',
            password: '-x1-x2'));
    notifyListeners();
  }

  logout() async {
    loginUser = null;
    notifyListeners();
  }
}
