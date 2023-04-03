import 'dart:collection';

import 'package:baltini_kent/components/model/product.dart';
import 'package:baltini_kent/components/utils/api_service.dart';
import 'package:baltini_kent/components/widget/global_widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/widget/global_widget/image_aspect_ratio.dart';

class ProductDetailVM extends ChangeNotifier {
  APIService api = APIService();
  Product? product;
  Products? fetchProducts;

  List<Product> recommendedProducts = <Product>[];
  List<Widget> recommendedProductsCard = <Widget>[];
  Queue<Product> recentlyViewed = Queue<Product>();
  List<Widget> recentlyViewedCard = <Widget>[];
  List<dynamic>? size;

  final images = <Widget>[
    const ImageAspectRatio(x: 2, y: 3),
    const ImageAspectRatio(x: 2, y: 3),
    const ImageAspectRatio(x: 2, y: 3),
    const ImageAspectRatio(x: 2, y: 3),
    const ImageAspectRatio(x: 2, y: 3),
  ];

  initialize(Object? product, BuildContext context) {
    Provider.of<ProductDetailVM>(context, listen: false)
        .getRecommendedProducts();
    Provider.of<ProductDetailVM>(context, listen: false)
        .updateRecentlyViewedWidget();
    Provider.of<ProductDetailVM>(context, listen: false).product =
        product as Product?;
    Provider.of<ProductDetailVM>(context, listen: false).size =
        Provider.of<ProductDetailVM>(context, listen: false).product!.options[1]
            ['values'];
  }

  getRecommendedProducts() async {
    recommendedProducts.clear();
    recommendedProductsCard.clear();
    var result = await api.getRecommendedProducts();
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
}
