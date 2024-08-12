import 'package:client/core/resources/data_state.dart';
import 'package:client/features/auth/domain/entities/auth_entity.dart';
import 'package:client/features/auth/domain/entities/auth_response_entity.dart';

abstract class AuthRepository {
  Future<DataState<AuthResponseEntity>> login(AuthEntity authEntity);
  Future<DataState<AuthResponseEntity>> register(AuthEntity authEntity);
}
