import 'dart:async';
import 'package:flutter/material.dart';
import '../../widgets/custom_image.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/styles/app_color.dart';
import '../../../../core/routes/named_routes.dart';
import '../../../../core/dependencies/injection_dependencies.dart';
import 'package:app_estoque/presentation/presenter/controllers/app_controller/app_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  final appController = getIt<AppController>();

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    initializeSplash();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  void initializeSplash() async {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      checkLogged();
    });
  }

  void checkLogged() async {
    await appController.checkLoggedIn();

    if (appController.isCheckLogged) {
      context.go(NamedRoutes.home);
    } else {
      context.go(NamedRoutes.login);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const CustomImage(
            'assets/images/logo.png',
            width: 240,
          ),
        ),
      ),
    );
  }
}
