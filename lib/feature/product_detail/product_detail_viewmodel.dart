import 'dart:collection';

import 'package:baltini_kent/components/model/product.dart';
import 'package:baltini_kent/components/utils/api_service.dart';
import 'package:baltini_kent/components/widget/global_widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/const/img_string.dart';

class ProductDetailVM extends ChangeNotifier {
  APIService api = APIService();
  Product? product;
  Products? fetchProducts;

  List<Product> recommendedProducts = <Product>[];
  List<Widget> recommendedProductsCard = <Widget>[];
  Queue<Product> recentlyViewed = Queue<Product>();
  List<Widget> recentlyViewedCard = <Widget>[];
  List<dynamic>? size;

  String? selectedSize;
  int selectedIndex = 0;

  List<Image> images = <Image>[];

  initialize(Object? product, BuildContext context) {
    var init = Provider.of<ProductDetailVM>(context, listen: false);
    init.getRecommendedProducts();
    init.updateRecentlyViewedWidget();
    init.product = product as Product?;
    init.size = init.product!.options[1]['values'];
    init.selectedSize = init.size![0];
    init.setImage();
  }

  setImage() {
    images.clear();
    if (product!.images.length != 0) {
      for (int i = 0; i < product!.images.length; i++) {
        images.add(Image.network(product!.images[i]['src']));
      }
    } else {
      images.add(Image.asset(placeholder));
      images.add(Image.asset(placeholder));
      images.add(Image.asset(placeholder));
      images.add(Image.asset(placeholder));
      images.add(Image.asset(placeholder));
    }
  }

  getRecommendedProducts() async {
    recommendedProducts.clear();
    recommendedProductsCard.clear();
    var result = await api.getAllProducts();
    for (int i = 0; i < 8; i++) {
      fetchProducts = Products.fromJson(result.data, i);
      recommendedProducts.add(fetchProducts!.product);
    }
    updateRecommendedProductWidget();
    notifyListeners();
  }

  insertRecentlyViewed(Product product) async {
    if (recentlyViewed.contains(product)) {
      if (recentlyViewed.length == 8) {
        recentlyViewed.remove(product);
        recentlyViewed.addFirst(product);
        recentlyViewed.removeLast();
        notifyListeners();
        return;
      } else {
        recentlyViewed.remove(product);
        recentlyViewed.addFirst(product);
        notifyListeners();
        return;
      }
    }
    if (recentlyViewed.length == 8) {
      recentlyViewed.addFirst(product);
      recentlyViewed.removeLast();
      notifyListeners();
    } else {
      recentlyViewed.addFirst(product);
      notifyListeners();
    }
  }

  updateRecommendedProductWidget() {
    for (int i = 0; i < 8; i++) {
      recommendedProductsCard.add(ProductCard(product: recommendedProducts[i]));
    }
    notifyListeners();
  }

  updateRecentlyViewedWidget() {
    recentlyViewedCard.clear();
    for (int i = 0; i < recentlyViewed.length; i++) {
      recentlyViewedCard.add(ProductCard(product: recentlyViewed.elementAt(i)));
    }
  }

  void onChangedSize(String value, int index) {
    selectedSize = value;
    selectedIndex = index;
    notifyListeners();
  }
}
