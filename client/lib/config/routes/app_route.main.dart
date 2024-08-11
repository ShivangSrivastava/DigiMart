part of 'app_route.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: RoutesConstants.homePage,
      path: "/",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: RoutesConstants.loginPage,
      path: "/login",
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
