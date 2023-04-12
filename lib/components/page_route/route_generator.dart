import 'package:flutter/material.dart';

import '../../feature/cart/cart_page.dart';
import '../../feature/checkout/checkout_page.dart';
import '../../feature/product_detail/product_detail_page.dart';
import '../../feature/product_list/product_list_page.dart';
import '../../feature/search/search_page.dart';
import '../../feature/tabbar/bottom_nav_bar.dart';
import '../model/product.dart';
import 'slide_right_route.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case '/':
        return slideRightRoute(const ActivityBar());
      case '/product_detail':
        return slideRightRoute(ProductDetailPage(product: argument as Product));
      case '/product_list':
        return slideRightRoute(const ProductListPage(isOriginSearch: false));
      case '/product_list/from_search':
        return slideRightRoute(const ProductListPage(isOriginSearch: true));
      case '/search':
        return slideUpRoute(const SearchPage());
      case '/cart':
        return slideUpRoute(const CartPage());
      case '/checkout':
        return slideUpRoute(const CheckoutPage());
      default:
        return _routeDoesNotExist();
    }
  }

  static Route<dynamic> _routeDoesNotExist() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
          body: Center(
        child: Text('Page does not exist'),
      )),
    );
  }
}
