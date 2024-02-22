import 'package:get_it/get_it.dart';
import 'package:app_estoque/presentation/presenter/pages/login/controller/login_controller.dart';

final getIt = GetIt.instance;

void InjectionDependencies() {
  getIt.registerFactory(() => LoginController());

  // getIt.registerSingleton(LoginPage(
  //   loginController: ,
  // ));
}
