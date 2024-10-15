// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ProfileResponseEntity extends Equatable {
  final String? message;
  final String? name;
  final String? email;

  ProfileResponseEntity({this.message, this.name, this.email});

  @override
  List<Object> get props => [message!, name!, email!];
}
