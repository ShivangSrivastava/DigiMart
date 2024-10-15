import 'package:client/client.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: SharedRoutes.loadingPage,
  routes: [
    // Shared
    GoRoute(
      name: SharedRoutes.loadingPage,
      path: SharedRoutes.loadingPage,
      builder: (context, state) => const LoadingPage(),
    ),
  ],
);
