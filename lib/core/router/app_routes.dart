import 'package:flutter/material.dart';

/// This class defines the routes for a GoRouter in a Flutter app, including
/// a home route and a login route.
class AppRoutes {
  /// The navigator key used along the app.
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// The onboarding route.
  static const String login = '/';

  /// The home route.
  static const String home = '/home';
}