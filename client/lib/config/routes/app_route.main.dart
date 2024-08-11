part of 'app_route.dart';

final routers = GoRouter(
  routes: [
    GoRoute(
      name: RoutesConstants.homePage,
      path: "/",
      builder: (context, state) => const HomePage(),
    ),
  ],
);
