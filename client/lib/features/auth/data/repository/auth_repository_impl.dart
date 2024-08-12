import 'package:client/core/resources/data_state.dart';
import 'package:client/core/resources/handle_response.dart';
import 'package:client/features/auth/data/data_sources/auth_api_service.dart';
import 'package:client/features/auth/data/models/remote/auth_model.dart';
import 'package:client/features/auth/data/models/remote/auth_response_model.dart';
import 'package:client/features/auth/domain/entities/auth_entity.dart';
import 'package:client/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState<AuthResponseModel>> register(AuthEntity authEntity) async {
    final authModel = AuthModel.fromEntity(authEntity);
    try {
      final httpResponse = await _authApiService.register(authModel);
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<AuthResponseModel>> login(AuthEntity authEntity) async {
    final authModel = AuthModel.fromEntity(authEntity);
    try {
      final httpResponse = await _authApiService.login(authModel);
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
