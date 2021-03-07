
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_app/net/net.dart';


class ApiRepository {
  DioClient dioClient;
  final String baseUrl;

  ApiRepository({@required this.baseUrl}) {
    assert(baseUrl != null);

    dioClient = DioClient(baseUrl: this.baseUrl, dio: Dio());
  }

  Future<ApiResult> login({
    @required String email,
    @required String password,
    ProgressCallback onReceiveProgress,
  }) async {
    assert(email != null);
    assert(password != null);
    return await dioClient.post(
      uri: "/login",
      data: {"email": email, "password": email},
      onReceiveProgress: onReceiveProgress,
    );
  }
}
