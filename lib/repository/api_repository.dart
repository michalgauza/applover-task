import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_app/net/api_result.dart';
import 'package:login_app/net/dio_client.dart';

class ApiRepository {
  DioClient dioClient;
  final String baseUrl;

  ApiRepository({@required this.baseUrl}) {
    assert(baseUrl != null);

    dioClient = DioClient(baseUrl: this.baseUrl, dio: Dio());
  }

  Future<void> login() async {
    final ApiResult result = await dioClient.post(
      uri: "/login",
      data: {"email": "eve.holt@reqres.in", "password": "cityslicka"},
      onReceiveProgress: (x, y) {
        print('1 x = $x | y = $y');
      },
      onSendProgress: (x, y) {
        print('2 x = $x | y = $y');
      },
    );

    switch (result.status) {
      case ResultStatus.success:
        print('${result.data}');
        break;
      case ResultStatus.failure:
        print('${result.error}');
        if (result.error is SocketException) {
          print('Please check your internet connection.');
        } else {
          print('Unknown error');
        }
        break;
      case ResultStatus.apiError:
        print('${result.data} | ${result.dioError}');
        break;
    }
  }
}
