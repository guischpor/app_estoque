import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../../../widgets/show_snackbar_dialog.dart';
import 'package:app_estoque/core/styles/app_color.dart';
import 'package:app_estoque/presentation/domain/entities/user_entity.dart';
import '../../../../domain/usecases/get_user_usecase/get_user_usecase.dart';
import 'package:app_estoque/presentation/domain/usecases/signup_usecase/signup_usecase.dart';

part 'signup_controller.g.dart';

class SignUpController = SignUpBase with _$SignUpController;

abstract class SignUpBase with Store {
  final SignUpUseCase signUpUseCase;
  final GetUserUseCase getUserUseCase;

  SignUpBase({
    required this.signUpUseCase,
    required this.getUserUseCase,
  });

  @observable
  UserEntity? user;

  @observable
  bool isLoading = false;

  @observable
  bool isSuccess = false;

  @observable
  bool isObscure = true;

  @observable
  bool isPasswordConfirmationObscure = true;

  @observable
  String name = '';

  @observable
  String cpf = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String passwordConfirmation = '';

  @action
  void setLoading(bool value) {
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
  void setPasswordConfirmationObscure() {
    isPasswordConfirmationObscure = !isPasswordConfirmationObscure;
  }

  @action
  Future<void> createUser({
    required String name,
    required String cpf,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final user = UserEntity(
      name: name,
      cpf: cpf,
      email: email,
      password: password,
    );

    final result = await signUpUseCase(user);

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
        setLoading(false);
        setSuccess(true);

        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Parabéns',
            label: 'Sua conta foi criada com sucesso!',
            icon: Icons.check,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.green,
          ),
        );
      },
    );
  }

  @action
  Future<void> getUser({
    required BuildContext context,
    required String id,
    required String email,
    required String cpf,
  }) async {
    final result = await getUserUseCase.call(
      id: id,
      email: email,
      cpf: cpf,
    );
    result.fold(
      (error) {
        print(error.toString());
        setLoading(false);
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
        user = success;
        setLoading(false);
      },
    );
  }
}
