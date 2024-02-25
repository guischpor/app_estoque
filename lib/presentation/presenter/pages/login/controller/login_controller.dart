import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../../../../../core/styles/app_color.dart';
import '../../../widgets/show_snackbar_dialog.dart';
import '../../../../domain/usecases/login_usecase/login_usecase.dart';
import 'package:app_estoque/presentation/domain/usecases/remember_account_usecase/remember_account_usecase.dart';

part 'login_controller.g.dart';

class LoginController = LoginBase with _$LoginController;

abstract class LoginBase with Store {
  final LoginUseCase loginUseCase;
  final RememberAccountUseCase rememberAccountUseCase;

  LoginBase({
    required this.loginUseCase,
    required this.rememberAccountUseCase,
  });

  @observable
  bool isLoading = false;

  @observable
  bool isObscure = true;

  @observable
  bool isSuccess = false;

  @observable
  bool isChecked = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  Map<dynamic, dynamic> rememberData = {};

  @action
  setLoading(bool value) {
    isLoading = value;
  }

  @action
  void setSuccess(bool value) {
    isSuccess = value;
  }

  @action
  void setObscure() {
    isObscure = !isObscure;
  }

  @action
  void setChecked({
    bool? value,
    required BuildContext context,
    required String password,
    required String email,
  }) {
    isChecked = value ?? false;

    if (email.trim().isEmpty || password.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(showSnackBarDialog(
        title: 'Aviso!',
        label: 'Os campos não podem ser vazios',
        icon: Icons.error,
        textColorLabel: AppColors.white,
        backgroundColor: AppColors.red,
      ));

      isChecked = false;
    }

    rememberAccountUseCase.call(
      email: email,
      isChecked: isChecked,
      password: password,
    );
  }

  @action
  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final result = await loginUseCase(
      email: email,
      password: password,
    );

    result.fold(
      (error) {
        print(error.toString());
        setLoading(false);
        setSuccess(false);
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Error',
            label: error.toString(),
            icon: Icons.error,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.red,
          ),
        );
      },
      (success) {
        print(success);
        setLoading(false);
        setSuccess(true);
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Sucesso',
            label: 'Login realizado com sucesso',
            icon: Icons.check,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.green,
          ),
        );
      },
    );
  }

  Future<void> getRememberAccount() async {
    final result = await rememberAccountUseCase.getRememberAccount();

    result.fold(
      (error) {
        print(error.toString());
      },
      (success) {
        rememberData = success;

        print(rememberData);
      },
    );
  }
}
