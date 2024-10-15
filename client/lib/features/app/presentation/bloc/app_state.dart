part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {}

class VerificationSuccess extends AppState {}

class VerificationFailure extends AppState {}

class AppLoading extends AppState {}

class NetworkError extends AppState {}
