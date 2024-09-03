import 'package:client/core/core_export.dart';
import 'package:client/features/auth/auth_export.dart';

abstract class AuthRepository {
  Future<DataState<AuthResponseEntity>> login(AuthEntity authEntity);
  Future<DataState<AuthResponseEntity>> register(AuthEntity authEntity);
}
