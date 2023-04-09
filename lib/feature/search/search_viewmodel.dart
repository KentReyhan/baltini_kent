import 'dart:collection';

import 'package:flutter/material.dart';

import '../../components/model/product.dart';
import '../../components/utils/api_service.dart';

class SearchVM extends ChangeNotifier {
  APIService api = APIService();
  String searchInput = '';
  Products? products;
  Queue<String> recentlySearched = Queue<String>();
  List<Product> relatedProducts = <Product>[];
  List<Product> product = <Product>[];

  bool toggleHistory = true;
  bool toggleRelated = false;

  onChangeSearchInput(String value) {
    searchInput = value;
    notifyListeners();
  }

  onChangeToggleHistory() {
    toggleHistory = true;
    toggleRelated = false;
    notifyListeners();
  }

  onChangeToggleRelated() {
    toggleHistory = false;
    toggleRelated = true;
    notifyListeners();
  }

  getRelatedItems(String input) {
    relatedProducts.clear();
    for (int i = 0; i < product.length; i++) {
      if (product[i].title!.toLowerCase().contains(input.toLowerCase()) ||
          input.isEmpty ||
          input == '') {
        relatedProducts.add(product[i]);
      }
    }
    notifyListeners();
  }

  insertrecentlySearched(String input) async {
    if (recentlySearched.contains(input)) {
      if (recentlySearched.length == 4) {
        recentlySearched.remove(input);
        recentlySearched.addFirst(input);
        recentlySearched.removeLast();
        notifyListeners();
        return;
      } else {
        recentlySearched.remove(input);
        recentlySearched.addFirst(input);
        notifyListeners();
        return;
      }
    }
    if (recentlySearched.length == 4) {
      recentlySearched.addFirst(input);
      recentlySearched.removeLast();
      notifyListeners();
    } else {
      recentlySearched.addFirst(input);
      notifyListeners();
    }
  }

  getAllProduct() async {
    product.clear();
    var result = await api.getAllProducts();
    for (int i = 0; i < result.data['products'].length; i++) {
      products = Products.fromJson(result.data, i);
      product.add(products!.product);
    }
  }
}
