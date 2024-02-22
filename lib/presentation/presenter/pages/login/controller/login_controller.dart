import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginBase with _$LoginController;

abstract class LoginBase with Store {
  @observable
  String email = 'teste@gmail.com';

  @action
  setEmail(String value) {
    email = value;
  }
}
