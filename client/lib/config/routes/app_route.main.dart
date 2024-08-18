part of 'app_route.dart';

final router = GoRouter(
  initialLocation: "/loading",
  routes: [
    // loading
    GoRoute(
      name: RoutesConstants.loadingPage,
      path: "/${RoutesConstants.loadingPage}",
      builder: (context, state) => const LoadingPage(),
    ),

    // auth
    GoRoute(
      name: RoutesConstants.loginPage,
      path: "/${RoutesConstants.loadingPage}",
      builder: (context, state) => const LoginPage(),
    ),

    // home
    GoRoute(
      name: RoutesConstants.authenticatedHomePage,
      path: "/${RoutesConstants.authenticatedHomePage}",
      builder: (context, state) => const AuthenticatedHomePage(),
    ),
    GoRoute(
      name: RoutesConstants.guestHomePage,
      path: "/${RoutesConstants.guestHomePage}",
      builder: (context, state) => const GuestHomePage(),
    ),

    // search
    GoRoute(
      name: RoutesConstants.searchPage,
      path: "/${RoutesConstants.searchPage}",
      builder: (context, state) => const SearchPage(),
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
