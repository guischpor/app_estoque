import 'package:mobx/mobx.dart';
import 'package:app_estoque/presentation/domain/usecases/check_logged_usecase/check_logged_usecase.dart';

part 'app_controller.g.dart';

class AppController = AppBase with _$AppController;

abstract class AppBase with Store {
  final CheckLoggedInUseCase checkLoggedInUseCase;

  AppBase({
    required this.checkLoggedInUseCase,
  });

  @observable
  bool isCheckLogged = false;

  @action
  void setCheckLogged(bool value) {
    isCheckLogged = value;
  }

  @action
  Future<void> checkLoggedIn() async {
    final result = await checkLoggedInUseCase.getLogging();

    result.fold(
      (error) {
        print(error.toString());

        setCheckLogged(false);
      },
      (success) {
        setCheckLogged(success);
      },
    );
  }

  @action
  Future<void> setLoggedIn(bool value) async {
    final result = await checkLoggedInUseCase.setLogging(value);

    result.fold(
      (error) {
        print(error.toString());
        setCheckLogged(false);
      },
      (success) {
        setCheckLogged(success);
        print(success);
      },
    );
  }
}
