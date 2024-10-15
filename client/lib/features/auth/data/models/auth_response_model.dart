// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:client/client.dart';

class AuthResponseModel extends AuthResponseEntity {
  const AuthResponseModel({
    super.token,
    super.message,
  });

  factory AuthResponseModel.fromEntity(AuthResponseEntity entity) {
    return AuthResponseModel(
      token: entity.token,
      message: entity.message,
    );
  }

  factory AuthResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AuthResponseModel(
      token: json['token'],
      message: json['message'],
    );
  }
}
