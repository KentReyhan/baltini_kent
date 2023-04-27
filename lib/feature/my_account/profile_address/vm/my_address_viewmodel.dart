import 'package:baltini_kent/components/model/hive_model/address.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/hive/hive_helper.dart';
import '../../../../components/model/hive_model/user.dart';
import '../../../../components/provider/user_provider.dart';

class MyAddressVM extends ChangeNotifier {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController optionalAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late UserProvider user;
  bool isDefault = false;

  onChangedIsDefault(bool value) {
    isDefault = value;
    notifyListeners();
  }

  init(
      {required BuildContext context,
      required bool isEditAddress,
      int? index}) {
    user = Provider.of<UserProvider>(context, listen: false);
    if (isEditAddress) {
      firstNameController.text = user.loginUser!.address[index!].firstName;
      lastNameController.text = user.loginUser!.address[index].lastName;
      if (user.loginUser!.address[index].company != null) {
        companyController.text = user.loginUser!.address[index].company!;
      }
      if (user.loginUser!.address[index].optionalAddress != null) {
        optionalAddressController.text =
            user.loginUser!.address[index].optionalAddress!;
      }
      addressController.text = user.loginUser!.address[index].address;
      countryController.text = user.loginUser!.address[index].country;
      stateController.text = user.loginUser!.address[index].state;
      cityController.text = user.loginUser!.address[index].city;
      zipCodeController.text = user.loginUser!.address[index].zipCode;
      phoneController.text = user.loginUser!.address[index].phone;
    }
  }

  addAddress(int id) async {
    User result =
        await userBox.values.firstWhere((element) => element.userID == id);
    result.address.add(Address(
        addressID: result.address.length + 1,
        userID: result.userID,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        country: countryController.text,
        state: stateController.text,
        city: cityController.text,
        address: addressController.text,
        zipCode: zipCodeController.text,
        isDefault: isDefault,
        phone: phoneController.text));
    userBox.put(result.key, result);
    notifyListeners();
  }

  updateAddress(int id, int index) async {
    User result =
        await userBox.values.firstWhere((element) => element.userID == id);
    result.address[index] = Address(
        addressID: result.address.length + 1,
        userID: result.userID,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        country: countryController.text,
        state: stateController.text,
        city: cityController.text,
        address: addressController.text,
        zipCode: zipCodeController.text,
        isDefault: isDefault,
        phone: phoneController.text);
    userBox.put(result.key, result);
    notifyListeners();
  }

  deleteAddress(int id, int index) async {
    User result =
        await userBox.values.firstWhere((element) => element.userID == id);
    result.address.removeAt(index);
    userBox.put(result.key, result);
    notifyListeners();
  }
}
