import 'package:client/client.dart';

class ProfileGetUsecase
    implements UseCase<DataState<ProfileResponseEntity>, void> {
  final ProfileRepository _profileRepository;

  ProfileGetUsecase(this._profileRepository);

  @override
  Future<DataState<ProfileResponseEntity>> call({params}) {
    return _profileRepository.getProfile();
  }
}
