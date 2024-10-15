import 'package:client/client.dart';

class ProfileRequestModel extends ProfileRequestEntity {
  ProfileRequestModel({
    super.name,
    super.password,
  });

  factory ProfileRequestModel.fromMap(Map<String, dynamic> json) {
    return ProfileRequestModel(
      name: json["name"] ?? "",
      password: json["password"] ?? "",
    );
  }
  factory ProfileRequestModel.fromEntity(ProfileRequestEntity entity) {
    return ProfileRequestModel(
        name: entity.name ?? "", password: entity.password ?? "");
  }
}
