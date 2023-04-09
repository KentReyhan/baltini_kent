import 'package:flutter/material.dart';

class QuantityProvider extends ChangeNotifier {
  int quantity = 1;
  onChangeQuantity(int value) {
    quantity = value;
    notifyListeners();
  }

  addOneQuantity() {
    quantity = (quantity + 1);
    print(quantity);
    notifyListeners();
  }

  subOneQuantity() {
    quantity = (quantity - 1);
    print(quantity);
    notifyListeners();
  }
}
