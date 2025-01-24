
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_orn/core/router/router.dart';
import 'package:prueba_tecnica_orn/feature/product/presentation/pages/details_product_page.dart';

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
    GoRoute(
      path: AppRoutes.productDetail,
      builder: (context, state) {
        final productId = state.extra as int;
        return ProductDetailPage(productId: productId.toString());
      },
    ),
  ],
);
