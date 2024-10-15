import 'package:client/client.dart';

class ProfileResponseModel extends ProfileResponseEntity {
  ProfileResponseModel({super.email, super.message, super.name});

  // factory ProfileResponseModel.fromEntity(ProfileResponseEntity entity) {
  //   return ProfileResponseModel(
  //       email: entity.email ?? "",
  //       message: entity.message ?? "",
  //       name: entity.name ?? "");
  // }

  factory ProfileResponseModel.fromJson(Map<String, dynamic> map) {
    return ProfileResponseModel(
        email: map["email"] ?? "",
        message: map["message"] ?? "",
        name: map["name"] ?? "");
  }
}
