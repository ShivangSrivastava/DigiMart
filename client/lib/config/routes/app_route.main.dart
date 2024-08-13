part of 'app_route.dart';

final router = GoRouter(
  initialLocation: "/loading",
  routes: [
    GoRoute(
      name: RoutesConstants.authenticatedHomePage,
      path: "/authenticatedHome",
      builder: (context, state) => const AuthenticatedHomePage(),
    ),
    GoRoute(
      name: RoutesConstants.guestHomePage,
      path: "/guestHome",
      builder: (context, state) => const GuestHomePage(),
    ),
    GoRoute(
      name: RoutesConstants.loginPage,
      path: "/login",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: RoutesConstants.loadingPage,
      path: "/loading",
      builder: (context, state) => const LoadingPage(),
    ),
  ],
  redirect: _redirect,
);

FutureOr<String?> _redirect(context, GoRouterState state) {
  final bloc = BlocProvider.of<AppBloc>(context);
  if (bloc.state is AppAuthenticated) {
    return null;
  }
  if (bloc.state is AppUnauthenticated &&
      state.name != RoutesConstants.loginPage &&
      state.name != RoutesConstants.guestHomePage) {
    return router.namedLocation(RoutesConstants.guestHomePage);
  }

  return null;
}
