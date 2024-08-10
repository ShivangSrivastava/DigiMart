// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AuthResponseEntity extends Equatable {
  final String? token;
  final String? message;

  AuthResponseEntity({this.token, this.message});

  @override
  List<Object> get props => [token!, message!];
}
