import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/const/img_string.dart';
import '../../components/model/hive_model/address.dart';
import '../../components/model/shipping_method.dart';
import '../../components/provider/user_provider.dart';

class CheckoutVM extends ChangeNotifier {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController optionalAddressController = TextEditingController();

  late UserProvider user;
  late Address selectedAddress;
  bool isAlertDialog = false;
  bool isToPayment = false;
  String selectedShippingOption = '';
  String selectedPaymentOption = '';
  double selectedShippingTax = 0;
  String selectedBillingAddressOption = 'Same as shipping address';

  List<ShippingMethod> shippingOption = [
    ShippingMethod(
        shippingDetail:
            'Express International Shipping (3-5 Business Days) Import Duties & Tax Included',
        shippingCost: 0,
        shippingTax: 0.1)
  ];
  List<String> paymentOption = [
    'Credit Card',
    'Shop pay - Pay in full or in installments',
    'Afterpay',
    'Klarna - Flexible Payments',
    'NihaoPay'
  ];

  Map<String, List<String>> paymentOptionMap = {
    'Credit Card': [
      iconCreditCard1,
      iconCreditCard2,
      iconCreditCard3,
      iconCreditCard4
    ],
    'Shop pay - Pay in full or in installments': [iconShoppay],
    'Afterpay': [iconAfterpay],
    'Klarna - Flexible Payments': [iconKlarna],
    'NihaoPay': [iconNihao1, iconNihao2, iconNihao3]
  };

  List<String> billingAddressOption = [
    'Same as shipping address',
    'Use a different billing address'
  ];

  init(BuildContext context, int index) {
    user = Provider.of<UserProvider>(context, listen: false);
    if (user.loginUser!.address.isNotEmpty) {
      selectedAddress = user.loginUser!.address[index];
    }
    firstNameController.text = selectedAddress.firstName;
    lastNameController.text = selectedAddress.lastName;
    if (selectedAddress.company != null) {
      companyController.text = selectedAddress.company!;
    }
    if (selectedAddress.optionalAddress != null) {
      optionalAddressController.text = selectedAddress.optionalAddress!;
    }
    addressController.text = selectedAddress.address;
    countryController.text = selectedAddress.country;
    stateController.text = selectedAddress.state;
    cityController.text = selectedAddress.city;
    zipCodeController.text = selectedAddress.zipCode;
    phoneController.text = selectedAddress.phone;

    notifyListeners();
  }

  onChangedSelectedShippingTax(double input) {
    selectedShippingTax = input;
    notifyListeners();
  }

  onChangedSelectedShippingOption(String input) {
    selectedShippingOption = input;
    notifyListeners();
  }

  onChangedSelectedPaymentOption(String input) {
    selectedPaymentOption = input;
    notifyListeners();
  }

  onChangedSelectedBillingAddressOption(String input) {
    selectedBillingAddressOption = input;
    notifyListeners();
  }

  onChangedAlertDialog(bool value) {
    isAlertDialog = value;
    notifyListeners();
  }

  onChangedToPayment(bool value) {
    isToPayment = value;
    notifyListeners();
  }

  onChangedSelectedAddress(Address value) {
    selectedAddress = value;
    notifyListeners();
  }

  checkIfEmpty() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        countryController.text.isEmpty ||
        stateController.text.isEmpty ||
        cityController.text.isEmpty ||
        addressController.text.isEmpty ||
        zipCodeController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
