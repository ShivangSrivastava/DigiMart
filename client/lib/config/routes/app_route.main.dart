part of 'app_route.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: RoutesConstants.homePage,
      path: "/home",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: RoutesConstants.loginPage,
      path: "/login",
      builder: (context, state) => const LoginPage(),
    ),
  ],
  redirect: _redirect,
);

FutureOr<String?> _redirect(context, state) {
    final bloc = BlocProvider.of<AppBloc>(context);
    if (bloc.state is AppAuthenticated) {
      return null;
    }
    if (bloc.state is AppUnauthenticated && state.matchedLocation != '/login') {
      return '/login';
    }
    if (bloc.state is AppAuthenticated && state.matchedLocation == '/login') {
      return '/home';
    }
    return null;
  }
