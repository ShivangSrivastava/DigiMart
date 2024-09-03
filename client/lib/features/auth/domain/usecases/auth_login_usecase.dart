import 'package:client/core/core_export.dart';
import 'package:client/features/auth/auth_export.dart';

class AuthLoginUsecase
    implements UseCase<DataState<AuthResponseEntity>, AuthEntity> {
  final AuthRepository _authRepository;

  AuthLoginUsecase(this._authRepository);

  @override
  Future<DataState<AuthResponseEntity>> call({AuthEntity? params}) {
    return _authRepository.login(params!);
  }
}
