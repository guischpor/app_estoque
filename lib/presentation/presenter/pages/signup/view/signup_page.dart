import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_image.dart';
import '../controller/signup_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../widgets/custom_icon_button.dart';
import 'package:validatorless/validatorless.dart';
import '../../../../../core/styles/app_color.dart';
import '../../../../../core/app_consts/assets.dart';
import '../../../widgets/form/custom_text_form.dart';
import '../../../../../core/routes/named_routes.dart';
import '../../../../../core/styles/app_text_style.dart';
import '../../../widgets/custom_buttons/custom_button.dart';
import '../../../../../core/dependencies/injection_dependencies.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:app_estoque/presentation/presenter/widgets/custom_app_bar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final signUpController = getIt<SignUpController>();

  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    signUpController.setLoading(true);

    await signUpController.createUser(
      name: _nameController.text,
      cpf: _cpfController.text,
      email: _emailController.text,
      password: _passwordController.text,
      context: context,
    );

    if (signUpController.isSuccess) {
      context.go(NamedRoutes.login);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    _nameController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          appBar: customAppBar(
            context: context,
            widget: Text(
              'Crie sua conta',
              style: AppTextStyle.nunitoWhite18.font24.bold,
            ),
            isLeading: true,
            onTap: () {
              context.go(NamedRoutes.login);
            },
          ),
          body: signUpController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical:
                              MediaQuery.sizeOf(context).longestSide * 0.04,
                        ),
                        child: const CustomImage(
                          Assets.createAccount02,
                          height: 200,
                        ),
                      ),
                      _form()
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).longestSide * 0.02,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).longestSide * 0.02,
              ),
              child: CustomTextForm(
                keyboardType: TextInputType.name,
                controller: _nameController,
                labelText: 'Nome',
                preffix: const Icon(
                  Icons.person,
                  color: AppColors.blueLight,
                  size: 20,
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Nome é obrigatório!'),
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).longestSide * 0.02,
              ),
              child: CustomTextForm(
                keyboardType: TextInputType.number,
                controller: _cpfController,
                labelText: 'CPF',
                preffix: const Icon(
                  Icons.width_normal_rounded,
                  color: AppColors.blueLight,
                  size: 20,
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('CPF é obrigatório!'),
                ]),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  MaskTextInputFormatter(mask: '###.###.###-##'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).longestSide * 0.02,
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
              padding: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).longestSide * 0.02,
              ),
              child: CustomTextForm(
                keyboardType: TextInputType.visiblePassword,
                obscureText: signUpController.isObscure,
                controller: _passwordController,
                labelText: 'Senha',
                preffix: const Icon(
                  Icons.lock,
                  color: AppColors.blueLight,
                  size: 20,
                ),
                suffix: CustomIconButton(
                  iconData: signUpController.isObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onTap: () => signUpController.setObscure(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Senha obrigatória!'),
                  Validatorless.min(
                      6, 'Senha deve ter pelo menos 6 caracteres!'),
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).longestSide * 0.02,
              ),
              child: CustomTextForm(
                keyboardType: TextInputType.visiblePassword,
                obscureText: signUpController.isPasswordConfirmationObscure,
                controller: _passwordConfirmationController,
                labelText: 'Confirme a sua Senha',
                preffix: const Icon(
                  Icons.lock,
                  color: AppColors.blueLight,
                  size: 20,
                ),
                suffix: CustomIconButton(
                  iconData: signUpController.isPasswordConfirmationObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onTap: () =>
                      signUpController.setPasswordConfirmationObscure(),
                ),
                validator: Validatorless.compare(
                  _passwordController,
                  'As senhas não são iguais!',
                ),
              ),
            ),
            CustomButton(
              onPressed: () async => await signUp(),
              label: 'CADASTRAR',
              width: double.infinity,
              fontSize: 15,
              padding: const EdgeInsets.all(12),
              backgroundColor: AppColors.blueLight,
            ),
          ],
        ),
      ),
    );
  }
}
