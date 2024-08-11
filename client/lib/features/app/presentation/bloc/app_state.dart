part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {}

// app authenticased state
class AppAuthenticated extends AppState {
  final String token;

  const AppAuthenticated({required this.token});
}

// app unauthenticated state
class AppUnauthenticated extends AppState {}
