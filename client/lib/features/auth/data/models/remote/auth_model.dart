import 'package:client/features/auth/auth_export.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    super.email,
    super.name,
    super.password,
    super.role,
  });

  factory AuthModel.fromMap(
    Map<String, dynamic> json,
  ) {
    return AuthModel(
      email: json['email'] ??= "",
      name: json['name'] ??= "",
      password: json['password'] ??= "",
      role: json['role'] ??= "user",
    );
  }

  factory AuthModel.fromEntity(
    AuthEntity entity,
  ) {
    return AuthModel(
      email: entity.email ?? "",
      name: entity.name ?? "",
      password: entity.password ?? "",
      role: entity.role ?? UserRole.user,
    );
  }
}
