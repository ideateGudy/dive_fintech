import 'package:dive_fintech/features/auth/presentation/pages/change_password_page.dart';
import 'package:dive_fintech/features/auth/presentation/pages/change_password_success_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/forgot_password_screen.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/main_navigation_page.dart';

class AppRoutes {
  // Auth routes
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String forgotPasswordCode = '/forgot-password-code';
  static const String changePassword = '/change-password';
  static const String changePasswordSuccess = '/change-password-success';

  // Main routes
  static const String home = '/';
  static const String search = '/search';
  static const String messages = '/messages';
  static const String settings = '/settings';
}

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      // Auth routes
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        name: 'signup',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPasswordCode,
        name: 'forgot-password-code',
        builder: (context, state) => const ForgotPasswordPageCode(),
      ),
      GoRoute(
        path: AppRoutes.changePassword,
        name: 'change-password',
        builder: (context, state) => const ChangePasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.changePasswordSuccess,
        name: 'change-password-success',
        builder: (context, state) => const ChangePasswordSuccessPage(),
      ),

      // Main app routes with bottom navigation
      ShellRoute(
        builder: (context, state, child) {
          return MainNavigationPage(child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.home,
            name: 'home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: AppRoutes.search,
            name: 'search',
            builder: (context, state) => const Scaffold(
              body: Center(child: Text('Search Page')),
            ),
          ),
          GoRoute(
            path: AppRoutes.messages,
            name: 'messages',
            builder: (context, state) => const Scaffold(
              body: Center(child: Text('Messages Page')),
            ),
          ),
          GoRoute(
            path: AppRoutes.settings,
            name: 'settings',
            builder: (context, state) => const Scaffold(
              body: Center(child: Text('Settings Page')),
            ),
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
