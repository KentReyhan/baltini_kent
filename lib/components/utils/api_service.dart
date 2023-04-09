import 'package:baltini_kent/components/utils/base_api_service.dart';
import 'package:dio/dio.dart';

String _productLink = 'products.json';

class APIService extends BaseAPIService {
  BaseAPIService api = BaseAPIService();
  late Response response;

  getHomeProducts() async {
    try {
      response = await api.get(url: _productLink, parameter: {
        'sort_order': 'created_desc',
        'limit': 6,
        'status': 'active'
      });
    } on DioError catch (e) {
      print(e);
      return;
    }
    return response;
  }

  getAllProducts() async {
    try {
      response =
          await api.get(url: _productLink, parameter: {'status': 'active'});
    } on DioError catch (e) {
      print(e);
      return;
    }
    return response;
  }

  getSingleProducts(int id) async {
    try {
      response = await api
          .get(url: _productLink, parameter: {'ids': id, 'status': 'active'});
    } on DioError catch (e) {
      print(e);
      return;
    }
    return response;
  }

  getSearchedProduct(String input) async {
    try {
      response =
          await api.get(url: _productLink, parameter: {'status': 'active'});
    } on DioError catch (e) {
      print(e);
      return;
    }
    return response;
  }
}
