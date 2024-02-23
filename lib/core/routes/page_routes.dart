import 'named_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:app_estoque/presentation/presenter/pages/login/view/login_page.dart';
import 'package:app_estoque/presentation/presenter/pages/signup/view/signup_page.dart';

class RouterApp {
  final GoRouter router = GoRouter(
    initialLocation: NamedRoutes.login,
    routes: <RouteBase>[
      GoRoute(
        path: NamedRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: NamedRoutes.signUp,
        builder: (context, state) => const SignUpPage(),
      ),
    ],
  );
}
