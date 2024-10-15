import 'package:client/client.dart';

class ProfileUpdateUsecase
    implements UseCase<DataState<ProfileResponseEntity>, ProfileRequestEntity> {
  final ProfileRepository _profileRepository;

  ProfileUpdateUsecase(this._profileRepository);

  @override
  Future<DataState<ProfileResponseEntity>> call(
      {ProfileRequestEntity? params}) {
    return _profileRepository.updateProfile(params!);
  }
}
