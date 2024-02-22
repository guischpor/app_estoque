import 'package:flutter/material.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../core/dependencies/injection_dependencies.dart';
import 'package:app_estoque/presentation/presenter/pages/login/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = getIt<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: customAppBar(
            widget: const Text('Login'),
            context: context,
            isLeading: false,
          ),
          body: Center(
            child: Text(loginController.email),
          ),
        );
      },
    );
  }
}
