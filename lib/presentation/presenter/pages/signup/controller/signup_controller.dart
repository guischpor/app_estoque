import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignUpController = SignUpBase with _$SignUpController;

abstract class SignUpBase with Store {
  @observable
  bool isLoading = false;

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
  setLoading(bool value) {
    isLoading = value;
  }

  @action
  void setObscure() {
    isObscure = !isObscure;
  }

  @action
  void setPasswordConfirmationObscure() {
    isPasswordConfirmationObscure = !isPasswordConfirmationObscure;
  }
}
