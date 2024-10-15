import 'package:client/client.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApiService _profileApiService;

  ProfileRepositoryImpl(this._profileApiService);

  @override
  Future<DataState<ProfileResponseEntity>> deleteProfile(
      ProfileRequestEntity profileEntity) async {
    final profileModel = ProfileRequestModel.fromEntity(profileEntity);
    try {
      final httpResponse = await _profileApiService.deleteProfile(profileModel);
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<ProfileResponseEntity>> getProfile() async {
    try {
      final httpResponse = await _profileApiService.getProfile();
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<ProfileResponseEntity>> updateProfile(
      ProfileRequestEntity profileEntity) async {
    final profileModel = ProfileRequestModel.fromEntity(profileEntity);
    try {
      final httpResponse = await _profileApiService.updateProfile(profileModel);
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
