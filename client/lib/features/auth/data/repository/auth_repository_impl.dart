import 'package:client/core/core_export.dart';
import 'package:client/features/auth/auth_export.dart';
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
