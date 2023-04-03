import 'package:flutter/material.dart';

import '../../components/model/product.dart';
import '../../components/utils/api_service.dart';

class ProductListVM extends ChangeNotifier {
  APIService api = APIService();
  Products? products;
  List<Product> product = <Product>[];
  bool isLoading = false;
  bool isEmpty = true;

  getSearchedProduct(String input) async {
    product.clear();
    isLoading = true;
    var result = await api.getSearchedProduct(input);
    if (result.data['products'].length != 0) {
      for (int i = 0; i < result.data['products'].length; i++) {
        if (input.isEmpty ||
            result.data['products'][i]['title']
                .toLowerCase()
                .contains(input.toLowerCase())) {
          products = Products.fromJson(result.data, i);
          product.add(products!.product);
        } else {
          continue;
        }
      }
    } else {
      isEmpty = true;
    }
    isLoading = false;
    notifyListeners();
  }
}
