import 'package:dio/dio.dart';
import 'api_endpoint.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio) {
    _dio
      ..options.baseUrl = ApiEndpoints.baseUrl
      ..options.connectTimeout = ApiEndpoints.connectionTimeout
      ..options.receiveTimeout = ApiEndpoints.receiveTimeout
      ..options.responseType = ResponseType.json;
  }

  Future<Response> post(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      rethrow;
    }
  }
}
