import 'package:filme_flix/components/constants/routes_endpoints.dart';
import 'package:filme_flix/pages/home_page.dart';
import 'package:filme_flix/pages/landing_page.dart';
import 'package:filme_flix/pages/login_page.dart';
import 'package:filme_flix/utils/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: RoutesEndpoints.landing,
  routes: [
    GoRoute(
      path: RoutesEndpoints.landing,
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
          path: RoutesEndpoints.login,
          builder: (context, state) => const LoginPage(),
        ),
    ShellRoute(
      builder: (context, state, child) {
        final index = state.extra as int? ?? 0;
        return CustomNavigationBar(
          index: index,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: RoutesEndpoints.home,
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: RoutesEndpoints.search,
          builder: (context, state) => Container(color: Colors.amber,),
        ),
        GoRoute(
          path: RoutesEndpoints.favorites,
          builder: (context, state) => Container(color: Colors.blue,),
        ),
        GoRoute(
          path: RoutesEndpoints.settings,
          builder: (context, state) => Container(color: Colors.red,),
        ),
      ]
    ),
  ],
);