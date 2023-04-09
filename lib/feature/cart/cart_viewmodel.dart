import 'package:flutter/material.dart';

import '../../components/model/cart_product.dart';

class CartVM extends ChangeNotifier {
  Map<CartProduct, int> cartProduct = {};

  onChangeQuantity(int index, int res) {
    cartProduct.update(
        cartProduct.keys.elementAt(index), (value) => value = res);
    notifyListeners();
  }

  addOneQuantity(int index) {
    cartProduct.update(
        cartProduct.keys.elementAt(index), (value) => value = value + 1);
    notifyListeners();
  }

  subOneQuantity(int index) {
    cartProduct.update(
        cartProduct.keys.elementAt(index), (value) => value = value - 1);
    notifyListeners();
  }
}
