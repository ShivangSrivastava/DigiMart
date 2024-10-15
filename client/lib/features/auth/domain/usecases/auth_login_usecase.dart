import 'package:client/client.dart';

class AuthLoginUsecase
    implements UseCase<DataState<AuthResponseEntity>, AuthRequestEntity> {
  final AuthRepository _authRepository;

  AuthLoginUsecase(this._authRepository);

  @override
  Future<DataState<AuthResponseEntity>> call({params}) {
    return _authRepository.login(params!);
  }
}
