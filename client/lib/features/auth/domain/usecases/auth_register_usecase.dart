import 'package:client/core/core_export.dart';
import 'package:client/features/auth/auth_export.dart';

class AuthRegisterUsecase
    implements UseCase<DataState<AuthResponseEntity>, AuthEntity> {
  final AuthRepository _authRepository;

  AuthRegisterUsecase(this._authRepository);

  @override
  Future<DataState<AuthResponseEntity>> call({AuthEntity? params}) {
    return _authRepository.register(params!);
  }
}
