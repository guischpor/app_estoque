import 'named_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_estoque/presentation/presenter/pages/login/view/login_page.dart';

class RouterApp {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: NamedRoutes.login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
        // routes: <RouteBase>[
        //   GoRoute(
        //     path: 'details',
        //     builder: (BuildContext context, GoRouterState state) {
        //       return const DetailsScreen();
        //     },
        //   ),
        // ],
      ),
    ],
  );
}
