import 'package:flutter/material.dart';

import '../../components/model/product.dart';
import '../../components/utils/api_service.dart';

class ProductListVM extends ChangeNotifier {
  APIService api = APIService();
  Products? products;
  List<Product> product = <Product>[];
  bool isLoading = false;
  bool isEmpty = true;
  String selectedSort = 'Featured';

  List<String> sort = [
    'Best Selling',
    'Featured',
    'Lowest Price',
    'Highest Price',
    'Alphabetically, A-Z',
    'Alphabetically, Z-A',
    'Date, New to Old',
    'Date, Old to New'
  ];

  List<String> filter = [
    'Gender',
    'Category',
    'Product Type',
    'Designer',
    'Size',
    'Price'
  ];

  onChangedSelectedSort(String input) {
    selectedSort = input;
    sortProduct();
    notifyListeners();
  }

  sortProduct() {
    switch (selectedSort) {
      case 'Best Selling':
        break;
      case 'Featured':
        break;
      case 'Lowest Price':
        product.sort((a, b) => a.price!.compareTo(b.price!));
        break;
      case 'Highest Price':
        product.sort((a, b) => b.price!.compareTo(a.price!));
        break;
      case 'Alphabetically, A-Z':
        product.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Alphabetically, Z-A':
        product.sort((a, b) => b.title.compareTo(a.title));
        break;
      case 'Date, New to Old':
        product.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
      case 'Date, Old to New':
        product.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
    }
  }

  getSearchedProduct(String input) async {
    product.clear();
    isLoading = true;
    isEmpty = true;
    var result = await api.getSearchedProduct(input);
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
    if (product.isNotEmpty) {
      isEmpty = false;
    }
    isLoading = false;
    notifyListeners();
  }
}
