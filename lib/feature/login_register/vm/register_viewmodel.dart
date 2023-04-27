import 'package:flutter/material.dart';

import '../../../components/hive/hive_helper.dart';
import '../../../components/model/hive_model/user.dart';

class RegisterVM extends ChangeNotifier {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  validateRegister() async {
    if (firstNameController.text.isEmpty ||
            lastNameController.text.isEmpty ||
            emailController.text.isEmpty ||
            passwordController.text
                .isEmpty /*||
        await checkIfEmailExist(emailController.text)*/
        ) {
      return false;
    } else {
      await userBox.add(User(
          userID: userBox.length + 1,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text));
      return true;
    }
  }

  checkIfEmailExist(String? inputtedEmail) async {
    var result = await userBox.values.firstWhere(
        (element) => element.email == inputtedEmail,
        orElse: () => User(
            userID: -1,
            firstName: '-1',
            lastName: '-1',
            password: '-x1-x2',
            email: '-1'));
    if (result.userID == -1) {
      return false;
    } else {
      return true;
    }
  }
}
