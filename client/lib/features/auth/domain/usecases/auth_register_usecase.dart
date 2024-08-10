import 'package:client/core/resources/data_state.dart';
import 'package:client/core/usecase/usecase.dart';
import 'package:client/features/auth/domain/domain_export.dart';

class AuthRegisterUsecase
    implements UseCase<DataState<AuthResponseEntity>, AuthEntity> {
  final AuthRepository _authRepository;

  AuthRegisterUsecase(this._authRepository);

  @override
  Future<DataState<AuthResponseEntity>> call({AuthEntity? params}) {
    return _authRepository.register(params!);
  }
}
