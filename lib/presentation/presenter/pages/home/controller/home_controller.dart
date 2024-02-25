import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeBase with _$HomeController;

abstract class HomeBase with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isSuccess = false;
}
