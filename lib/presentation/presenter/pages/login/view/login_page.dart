import 'package:flutter/material.dart';
import '../../../widgets/custom_app_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        widget: const Text('Login'),
        context: context,
        isLeading: false,
      ),
      body: const Center(
        child: Text('Login'),
      ),
    );
  }
}
