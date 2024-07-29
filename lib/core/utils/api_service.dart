import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://dummyjson.com/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await _dio.get(
      '$_baseUrl$endPoint',
      queryParameters: {
        'limit': 10,
        'select': 'title,price,category,description,images',
      },
    );
    return response.data;
  }
}
