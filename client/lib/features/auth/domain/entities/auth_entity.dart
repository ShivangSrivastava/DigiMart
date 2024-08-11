// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? email;
  final String? name;
  final String? password;
  final UserRole? role;

  const AuthEntity({this.email, this.name, this.password, this.role});

  @override
  List<Object> get props => [email!, name!, password!, role!];
}

enum UserRole { user, vendor }
