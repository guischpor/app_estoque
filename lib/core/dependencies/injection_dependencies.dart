import 'package:get_it/get_it.dart';
import 'package:app_estoque/presentation/presenter/pages/login/controller/login_controller.dart';
import 'package:app_estoque/presentation/presenter/pages/signup/controller/signup_controller.dart';

final getIt = GetIt.instance;

void InjectionDependencies() {
  //Controllers
  getIt.registerFactory(() => LoginController());
  getIt.registerFactory(() => SignUpController());

  // getIt.registerSingleton(LoginPage(
  //   loginController: ,
  // ));
}
