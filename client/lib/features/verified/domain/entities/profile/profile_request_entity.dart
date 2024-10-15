// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ProfileRequestEntity extends Equatable {
  final String? name;
  final String? password;

  ProfileRequestEntity({this.name, this.password});

  @override
  List<Object> get props => [name!, password!];
}
