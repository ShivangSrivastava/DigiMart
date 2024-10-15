import 'package:client/client.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState<AuthResponseModel>> register(
      AuthRequestEntity authEntity) async {
    final authModel = AuthRequestModel.fromEntity(authEntity);
    try {
      final httpResponse = await _authApiService.register(authModel);
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<AuthResponseModel>> login(
      AuthRequestEntity authEntity) async {
    final authModel = AuthRequestModel.fromEntity(authEntity);
    try {
      final httpResponse = await _authApiService.login(authModel);
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
