import 'package:flutter/material.dart';

import '../../components/model/shipping_option.dart';

class CheckoutVM extends ChangeNotifier {
  String firstName = '';
  String lastName = '';
  String phone = '';
  String email = '';
  String country = '';
  String state = '';
  String city = '';
  String address = '';
  String zipCode = '';
  String optionalAddress = '';
  String company = '';

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
  List<String> billingAddressOption = [
    'Same as shipping address',
    'Use a different billing address'
  ];

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

  onChangedFirstName(String value) {
    firstName = value;
    notifyListeners();
  }

  onChangedLastName(String value) {
    lastName = value;
    notifyListeners();
  }

  onChangedPhone(String value) {
    phone = value;
    notifyListeners();
  }

  onChangedEmail(String value) {
    email = value;
    notifyListeners();
  }

  onChangedCountry(String value) {
    country = value;
    notifyListeners();
  }

  onChangedState(String value) {
    state = value;
    notifyListeners();
  }

  onChangedCity(String value) {
    city = value;
    notifyListeners();
  }

  onChangedAddress(String value) {
    address = value;
    notifyListeners();
  }

  onChangedZipCode(String value) {
    zipCode = value;
    notifyListeners();
  }

  onChangedCompany(String value) {
    company = value;
    notifyListeners();
  }

  onChangedOptionalAddress(String value) {
    optionalAddress = value;
    notifyListeners();
  }

  checkIfEmpty() {
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        country.isEmpty ||
        state.isEmpty ||
        city.isEmpty ||
        address.isEmpty ||
        zipCode.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
