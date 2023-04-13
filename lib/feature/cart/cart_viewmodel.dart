import 'package:flutter/material.dart';

import '../../components/model/cart_product.dart';

class CartVM extends ChangeNotifier {
  Map<CartProduct, int> cartProduct = {};
  double subTotal = 0;
  bool isProtected = false;
  bool isChecked = false;

  void onChangeIsChecked(bool value) {
    isChecked = value;
    notifyListeners();
  }

  void onChangeIsProtected(bool value) {
    isProtected = value;
    if (isProtected == true) {
      subTotal += 330000;
    } else {
      subTotal -= 330000;
    }
    notifyListeners();
  }

  onChangeCartProduct() {
    subTotal = 0;
    cartProduct.forEach((key, value) {
      subTotal = subTotal + (key.product.price! * value);
    });
    notifyListeners();
  }

  onChangeQuantity(int index, int res) {
    cartProduct.update(
        cartProduct.keys.elementAt(index), (value) => value = res);
    onChangeCartProduct();
    notifyListeners();
  }

  addOneQuantity(int index) {
    cartProduct.update(
        cartProduct.keys.elementAt(index), (value) => value = value + 1);
    onChangeCartProduct();
    notifyListeners();
  }

  subOneQuantity(int index) {
    cartProduct.update(
        cartProduct.keys.elementAt(index), (value) => value = value - 1);
    onChangeCartProduct();
    notifyListeners();
  }
}
