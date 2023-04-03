import 'package:dio/dio.dart';

String _productLink =
    'https://baltini-staging.myshopify.com/admin/api/2023-01/products.json';
String _accessToken = '?access_token=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';
String _getHomeItem = '&sort_order=created-desc&limit=6';
String _getRecommendedItem = '&sort_order=created-desc&limit=8';

class APIService {
  late Response response;
  final _dio = Dio();

  getHomeProducts() async {
    try {
      response = await _dio.get(_productLink + _accessToken + _getHomeItem);
    } on DioError catch (e) {
      print(e);
      return;
    }
    return response;
  }

  getRecommendedProducts() async {
    try {
      response =
          await _dio.get(_productLink + _accessToken + _getRecommendedItem);
    } on DioError catch (e) {
      print(e);
      return;
    }
    return response;
  }

  getSingleProducts(int id) async {
    try {
      response = await _dio.get('$_productLink$_accessToken&product_id=$id');
    } on DioError catch (e) {
      print(e);
      return;
    }
    return response;
  }

  getSearchedProduct(String input) async {
    try {
      response = await _dio.get('$_productLink$_accessToken');
    } on DioError catch (e) {
      print(e);
      return;
    }
    return response;
  }
}
