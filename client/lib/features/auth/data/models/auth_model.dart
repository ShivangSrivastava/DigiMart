import 'package:client/features/auth/domain/domain_export.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    final String? email,
    final String? name,
    final String? password,
    final UserRole? role,
  }) : super(email: email, name: name, password: password, role: role);

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
