import 'package:baltini_kent/components/utils/api_service.dart';
import 'package:flutter/material.dart';

import '../../components/model/product.dart';

class HomeVM extends ChangeNotifier {
  APIService api = APIService();
  Products? products;
  List<Product> product = <Product>[];
  bool isLoading = false;

  getHomeItem() async {
    product.clear();
    isLoading = true;
    var result = await api.getHomeProducts();
    for (int i = 0; i < 6; i++) {
      products = Products.fromJson(result.data, i);
      product.add(products!.product);
    }
    isLoading = false;
    notifyListeners();
  }
}
