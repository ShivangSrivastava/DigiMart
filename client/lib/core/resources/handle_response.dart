import 'dart:io';

import 'package:client/core/core_export.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

Future<DataState<T>> handleResponse<T>(HttpResponse<T> httpResponse) async {
  if (httpResponse.response.statusCode == HttpStatus.ok) {
    return DataSuccess(httpResponse.data);
  }
  return DataFailed(DioException(
    error: httpResponse.response.statusMessage,
    response: httpResponse.response,
    type: DioExceptionType.badResponse,
    requestOptions: httpResponse.response.requestOptions,
  ));
}
