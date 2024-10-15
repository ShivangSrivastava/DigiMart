import 'package:client/client.dart';

class AuthRequestModel extends AuthRequestEntity {
  const AuthRequestModel({
    super.email,
    super.name,
    super.password,
    super.role,
  });

  factory AuthRequestModel.fromMap(
    Map<String, dynamic> json,
  ) {
    return AuthRequestModel(
      email: json['email'] ??= "",
      name: json['name'] ??= "",
      password: json['password'] ??= "",
      role: json['role'] ??= "user",
    );
  }

  factory AuthRequestModel.fromEntity(
    AuthRequestEntity entity,
  ) {
    return AuthRequestModel(
      email: entity.email ?? "",
      name: entity.name ?? "",
      password: entity.password ?? "",
      role: entity.role ?? UserRole.user,
    );
  }
}
