import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginBase with _$LoginController;

abstract class LoginBase with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isObscure = true;

  @observable
  bool isChecked = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  setLoading(bool value) {
    isLoading = value;
  }

  @action
  void setObscure() {
    isObscure = !isObscure;
  }

  @action
  void setChecked(bool? value) {
    isChecked = value ?? false;
  }
}
