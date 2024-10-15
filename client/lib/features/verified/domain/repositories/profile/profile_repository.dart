import 'package:client/client.dart';

abstract class ProfileRepository {
  Future<DataState<ProfileResponseEntity>> getProfile();
  Future<DataState<ProfileResponseEntity>> updateProfile(
      ProfileRequestEntity profileEntity);
  Future<DataState<ProfileResponseEntity>> deleteProfile(
      ProfileRequestEntity profileEntity);
}
