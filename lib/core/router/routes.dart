
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_orn/core/router/router.dart';

/// This class defines the routes for a GoRouter in a Flutter app, including
final GoRouter router = GoRouter(
  initialLocation: AppRoutes.login,
  navigatorKey: AppRoutes.navigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) {
        return const HomePage();
      },
    ),
  ],
);
