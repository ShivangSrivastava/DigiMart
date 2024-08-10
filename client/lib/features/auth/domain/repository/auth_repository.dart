import 'package:client/core/resources/data_state.dart';
import 'package:client/features/auth/domain/domain_export.dart';

abstract class AuthRepository {
  Future<DataState<AuthResponseEntity>> login(AuthEntity authEntity);
  Future<DataState<AuthResponseEntity>> register(AuthEntity authEntity);
}
