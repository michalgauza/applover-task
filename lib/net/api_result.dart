import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

enum ResultStatus { success, failure, apiError }

class ApiResult<T> {
  final ResultStatus status;
  final T data;
  final Exception error;
  final DioError dioError;

  const ApiResult._({
    @required this.status,
    this.data,
    this.error,
    this.dioError,
  }) : assert(status != null);

  const ApiResult.success(T data)
      : this._(
          status: ResultStatus.success,
          data: data,
        );

  const ApiResult.failure(Exception error)
      : this._(
          status: ResultStatus.failure,
          error: error,
        );

  const ApiResult.apiError(DioError dioError, T data)
      : this._(
          status: ResultStatus.apiError,
          dioError: dioError,
          data: data,
        );
}
