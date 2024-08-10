import 'dart:io';

import 'package:client/core/resources/data_state.dart';
import 'package:client/features/auth/data/data_sources_export.dart';
import 'package:client/features/auth/domain/domain_export.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState<AuthResponseModel>> register(AuthEntity authEntity) async {
    final authModel = AuthModel.fromEntity(authEntity);
    try {
      final httpResponse = await _authApiService.register(authModel);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(DioException(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        type: DioExceptionType.badResponse,
        requestOptions: httpResponse.response.requestOptions,
      ));
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<AuthResponseModel>> login(AuthEntity authEntity) async {
    final authModel = AuthModel.fromEntity(authEntity);
    try {
      final httpResponse = await _authApiService.login(authModel);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(DioException(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        type: DioExceptionType.badResponse,
        requestOptions: httpResponse.response.requestOptions,
      ));
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
