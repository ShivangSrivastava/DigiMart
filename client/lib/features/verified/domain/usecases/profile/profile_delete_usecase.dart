import 'package:client/client.dart';

class ProfileDeleteUsecase
    implements UseCase<DataState<ProfileResponseEntity>, ProfileRequestEntity> {
  final ProfileRepository _profileRepository;

  ProfileDeleteUsecase(this._profileRepository);

  @override
  Future<DataState<ProfileResponseEntity>> call({params}) {
    return _profileRepository.deleteProfile(params!);
  }
}
