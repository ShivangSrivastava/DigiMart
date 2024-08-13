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
  final List<String> categories;

  const AppAuthenticated({required this.token, required this.categories});
}

// app unauthenticated state
class AppUnauthenticated extends AppState {
  final List<String> categories;

  const AppUnauthenticated({required this.categories});
}

class AppLoading extends AppState {}

class AppNoInternet extends AppState {}
