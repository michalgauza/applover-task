import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:login_app/net/api_result.dart';

const defaultConnectTimeout = Duration.millisecondsPerMinute;
const defaultReceiveTimeout = Duration.millisecondsPerMinute;

class DioClient {
  final String baseUrl;

  Dio _dio;

  final List<Interceptor> interceptors;

  DioClient({
    @required this.baseUrl,
    Dio dio,
    this.interceptors,
  }) {
    assert(baseUrl != null);
    _dio = dio ?? Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = defaultConnectTimeout
      ..options.receiveTimeout = defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors);
    }
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: true));
    }
  }

  Future<dynamic> post({
    @required String uri,
    data,
    Map<String, dynamic> queryParameters,
  }) async {
    assert(uri != null);

    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
      return ApiResult.success(response.data);
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.RESPONSE) {
          return ApiResult.apiError(e, e.response.data["error"]);
        } else if (e.type == DioErrorType.DEFAULT) {
          return ApiResult.apiError(e, "Please check your internet connection");
        } else {
          return ApiResult.apiError(e, "Ups... Something went wrong");
        }
      }
      return ApiResult.failure(e);
    }
  }
}
