import 'package:dio/dio.dart';

String _APILink = 'https://baltini-staging.myshopify.com/admin/api/2023-01/';
String _accessToken = '?access_token=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';

class BaseAPIService {
  final Dio _dio = Dio();
  late Response<dynamic> _result;

  get(
      {required String url,
      Map<String, String>? header,
      Map<String, dynamic>? parameter}) async {
    final Response<dynamic> response = await _dio.get(
      '$_APILink$url',
      queryParameters: parameter,
      options: Options(
          headers: {'X-Shopify-Access-Token': _accessToken, ...header ?? {}},
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30)),
    );
    _result = response;
    return _result;
  }
}
