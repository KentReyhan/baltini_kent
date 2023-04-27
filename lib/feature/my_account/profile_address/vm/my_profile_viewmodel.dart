import 'package:baltini_kent/components/hive/hive_helper.dart';
import 'package:baltini_kent/components/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/model/hive_model/user.dart';

class MyProfileVM extends ChangeNotifier {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  late UserProvider user;

  init(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: false);
    firstNameController.text = user.loginUser!.firstName;
    lastNameController.text = user.loginUser!.lastName;
    emailController.text = user.loginUser!.email;
  }

  updateUser(int id) async {
    User result =
        await userBox.values.firstWhere((element) => element.userID == id);
    result.firstName = firstNameController.text;
    result.lastName = lastNameController.text;
    result.email = emailController.text;
    await userBox.put(result.key, result);
    notifyListeners();
  }

  updatePassword(int id) async {
    User result =
        await userBox.values.firstWhere((element) => element.userID == id);
    result.password = newPasswordController.text;
    await userBox.put(result.key, result);
    notifyListeners();
  }
}
