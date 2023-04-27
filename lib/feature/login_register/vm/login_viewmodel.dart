import 'package:baltini_kent/components/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/hive/hive_helper.dart';
import '../../../components/model/hive_model/user.dart';

class LoginVM extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginAuth() async {
    var result = await userBox.values.firstWhere(
        (element) =>
            element.email == emailController.text &&
            element.password == passwordController.text,
        orElse: () => User(
            userID: -1,
            firstName: '-1',
            lastName: '-1',
            email: '-1',
            password: '-x1-x2'));
    if (result.userID == -1) {
      return false;
    } else {
      return true;
    }
  }
}
