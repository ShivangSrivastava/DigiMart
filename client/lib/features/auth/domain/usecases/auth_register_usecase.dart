import 'package:client/client.dart';

class AuthRegisterUsecase
    implements UseCase<DataState<AuthResponseEntity>, AuthRequestEntity> {
  final AuthRepository _authRepository;

  AuthRegisterUsecase(this._authRepository);

  @override
  Future<DataState<AuthResponseEntity>> call({params}) {
    return _authRepository.register(params!);
  }
}
