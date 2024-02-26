import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:validatorless/validatorless.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../../../core/styles/app_color.dart';
import '../../../../../core/app_consts/assets.dart';
import '../../../widgets/form/custom_text_form.dart';
import '../../../../../core/routes/named_routes.dart';
import '../../../../../core/styles/app_text_style.dart';
import '../../../widgets/custom_buttons/custom_button.dart';
import '../../../widgets/custom_buttons/custom_text_button.dart';
import '../../../../../core/dependencies/injection_dependencies.dart';
import 'package:app_estoque/presentation/presenter/pages/login/controller/login_controller.dart';
import 'package:app_estoque/presentation/presenter/controllers/app_controller/app_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = getIt<LoginController>();
  final appController = getIt<AppController>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getRememberAccount();
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    await loginController.login(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (loginController.isSuccess) {
      context.go(NamedRoutes.home);

      await appController.setLoggedIn(true);
    }
  }

  void getRememberAccount() async {
    if (loginController.rememberData.isEmpty ||
        loginController.rememberData['isChecked'] == null) {
      return;
    }

    await loginController.getRememberAccount().then((value) {
      if (loginController.rememberData['isChecked']) {
        _emailController.text = loginController.rememberData['email'];
        _passwordController.text = loginController.rememberData['password'];
        loginController.isChecked = loginController.rememberData['isChecked'];
      } else {
        _emailController.clear();
        _passwordController.clear();
        loginController.isChecked = loginController.rememberData['isChecked'];
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return loginController.isSuccess
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                backgroundColor: AppColors.scaffoldBackgroundColor,
                body: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.sizeOf(context).longestSide * 0.02,
                          ),
                          child: const CustomImage(
                            Assets.logo,
                            height: 200,
                          ),
                        ),
                        _form(),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).longestSide * 0.02,
            ),
            child: CustomTextForm(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              labelText: 'E-mail',
              preffix: const Icon(
                Icons.email,
                color: AppColors.blueLight,
                size: 20,
              ),
              validator: Validatorless.multiple([
                Validatorless.required('E-mail obrigatório!'),
                Validatorless.email('E-mail inválido!'),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).longestSide * 0.02,
              vertical: MediaQuery.sizeOf(context).longestSide * 0.02,
            ),
            child: CustomTextForm(
              keyboardType: TextInputType.visiblePassword,
              obscureText: loginController.isObscure,
              controller: _passwordController,
              labelText: 'Senha',
              preffix: const Icon(
                Icons.lock,
                color: AppColors.blueLight,
                size: 20,
              ),
              suffix: CustomIconButton(
                iconData: loginController.isObscure
                    ? Icons.visibility_off
                    : Icons.visibility,
                onTap: () => loginController.setObscure(),
              ),
              validator: Validatorless.multiple([
                Validatorless.required('Senha obrigatória!'),
                Validatorless.min(6, 'Senha deve ter pelo menos 6 caracteres!'),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).longestSide * 0.01,
              bottom: MediaQuery.sizeOf(context).longestSide * 0.01,
            ),
            child: _checkBox(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).longestSide * 0.02,
            ),
            child: CustomButton(
              onPressed: () async => await login(),
              label: 'ENTRAR',
              width: double.infinity,
              fontSize: 15,
              padding: const EdgeInsets.all(12),
              backgroundColor: AppColors.blueLight,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).longestSide * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Não tem uma conta?',
                  style: AppTextStyle.fontRobotoblack18.font14.bold,
                ),
                CustomTextButton.black(
                  title: 'Crie a sua!',
                  onTap: () async {
                    context.go(NamedRoutes.signUp);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: loginController.isChecked,
              onChanged: (value) => loginController.setChecked(
                context: context,
                password: _passwordController.text,
                email: _emailController.text,
                value: value,
              ),
            ),
            Text(
              'Lembrar conta!',
              style: AppTextStyle.robotoBlue18.font14.bold,
            ),
          ],
        ),
      ],
    );
  }
}
