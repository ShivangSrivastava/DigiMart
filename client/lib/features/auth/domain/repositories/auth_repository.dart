import 'package:client/client.dart';

abstract class AuthRepository {
  Future<DataState<AuthResponseEntity>> login(AuthRequestEntity authEntity);
  Future<DataState<AuthResponseEntity>> register(AuthRequestEntity authEntity);
}
