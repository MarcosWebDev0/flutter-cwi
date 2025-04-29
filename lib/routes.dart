import 'package:filme_flix/pages/home_page.dart';
import 'package:filme_flix/pages/landing_page.dart';
import 'package:filme_flix/pages/login_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingPage(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        final index = state.extra as int? ?? 0;
        return HomePage(
          index: index,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const LandingPage(),
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const LandingPage(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const LandingPage(),
        ),
      ]
    ),
  ],
);