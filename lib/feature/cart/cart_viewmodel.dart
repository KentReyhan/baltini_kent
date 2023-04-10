import 'package:flutter/material.dart';

import '../../components/model/cart_product.dart';

class CartVM extends ChangeNotifier {
  Map<CartProduct, int> cartProduct = {};
  double totalPrice = 0;
  bool isProtected = false;
  bool isChecked = false;

  onChangeCartProduct() {
    totalPrice = 0;
    cartProduct.forEach((key, value) {
      totalPrice = totalPrice + (key.product.price! * value);
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

  void onChangeIsChecked(bool value) {
    isChecked = value;
    notifyListeners();
  }

  void onChangeIsProtected(bool value) {
    isProtected = value;
    if (isProtected == true) {
      totalPrice += 330000;
    } else {
      totalPrice -= 330000;
    }
    notifyListeners();
  }
}
