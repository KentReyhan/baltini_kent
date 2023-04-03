import 'package:flutter/material.dart';

import '../model/product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cartProduct = <Product>[];

  onAddItemsToCart(Product inserttedProduct) {
    cartProduct.add(inserttedProduct);
    notifyListeners();
  }
}
