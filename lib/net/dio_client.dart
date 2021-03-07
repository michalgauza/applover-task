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

  // Future<dynamic> get(
  //     String uri, {
  //       Map<String, dynamic> queryParameters,
  //       Options options,
  //       CancelToken cancelToken,
  //       ProgressCallback onReceiveProgress,
  //     }) async {
  //   try {
  //     var response = await _dio.get(
  //       uri,
  //       queryParameters: queryParameters,
  //       options: options,
  //       cancelToken: cancelToken,
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     return response.data;
  //   } on SocketException catch (e) {
  //     throw SocketException(e.toString());
  //   } on FormatException catch (_) {
  //     throw FormatException("Unable to process the data");
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<dynamic> post({
    @required String uri,
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    assert(uri != null);

    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
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
