import 'package:client/core/resources/data_state.dart';
import 'package:client/core/usecase/usecase.dart';
import 'package:client/features/auth/domain/entities/auth_entity.dart';
import 'package:client/features/auth/domain/entities/auth_response_entity.dart';
import 'package:client/features/auth/domain/repository/auth_repository.dart';

class AuthRegisterUsecase
    implements UseCase<DataState<AuthResponseEntity>, AuthEntity> {
  final AuthRepository _authRepository;

  AuthRegisterUsecase(this._authRepository);

  @override
  Future<DataState<AuthResponseEntity>> call({AuthEntity? params}) {
    return _authRepository.register(params!);
  }
}
