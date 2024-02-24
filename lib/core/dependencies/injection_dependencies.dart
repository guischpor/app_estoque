import 'package:get_it/get_it.dart';
import '../hive_config/hive_config.dart';
import 'package:app_estoque/presentation/domain/usecases/signup_usecase/signup_usecase.dart';
import 'package:app_estoque/presentation/presenter/pages/login/controller/login_controller.dart';
import '../../presentation/data/datasources/local/signup_datasources/signup_datasource_impl.dart';
import 'package:app_estoque/presentation/presenter/pages/signup/controller/signup_controller.dart';
import '../../presentation/data/repositories_impl/signup_repository_impl/signup_repository_impl.dart';

final getIt = GetIt.instance;

void injectionDependencies() {
  //DataSources
  getIt.registerFactory(() => SignUpDataSourceImpl());

  //Repositories
  getIt.registerFactory(
      () => SignUpRepositoryImpl(getIt<SignUpDataSourceImpl>()));

  //UseCases
  getIt.registerFactory(() => SignUpUseCase(getIt<SignUpRepositoryImpl>()));

  //Controllers
  getIt.registerFactory(() => LoginController());
  getIt.registerFactory(() => SignUpController(
        signUpUseCase: getIt<SignUpUseCase>(),
      ));

  getIt.registerFactory(() => HiveConfig());

  // getIt.registerSingleton(LoginPage(
  //   loginController: ,
  // ));
}
