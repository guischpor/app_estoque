import 'package:get_it/get_it.dart';
import '../hive_config/hive_config.dart';
import '../services/user_service_local.dart';
import '../../presentation/domain/usecases/get_user_usecase/get_user_usecase.dart';
import '../../presentation/presenter/controllers/app_controller/app_controller.dart';
import 'package:app_estoque/presentation/domain/usecases/login_usecase/login_usecase.dart';
import 'package:app_estoque/presentation/domain/usecases/signup_usecase/signup_usecase.dart';
import 'package:app_estoque/presentation/presenter/pages/home/controller/home_controller.dart';
import 'package:app_estoque/presentation/presenter/pages/login/controller/login_controller.dart';
import '../../presentation/data/datasources/local/signup_datasources/signup_datasource_impl.dart';
import 'package:app_estoque/presentation/presenter/pages/signup/controller/signup_controller.dart';
import '../../presentation/data/repositories_impl/signup_repository_impl/signup_repository_impl.dart';
import 'package:app_estoque/presentation/domain/usecases/create_sotck_usecase/create_sotck_usecase.dart';
import 'package:app_estoque/presentation/domain/usecases/check_logged_usecase/check_logged_usecase.dart';
import 'package:app_estoque/presentation/presenter/pages/create_stock_form/controller/stock_controller.dart';
import 'package:app_estoque/presentation/data/datasources/local/login_datasources/login_datasource_impl.dart';
import 'package:app_estoque/presentation/domain/usecases/remember_account_usecase/remember_account_usecase.dart';
import 'package:app_estoque/presentation/data/repositories_impl/login_repository_impl/login_repository_impl.dart';
import 'package:app_estoque/presentation/domain/usecases/get_stock_product_usecase/get_stock_product_usecase.dart';
import 'package:app_estoque/presentation/data/datasources/local/get_user_datasources/get_user_datasource_impl.dart';
import 'package:app_estoque/presentation/data/repositories_impl/get_user_repository_impl/get_user_repository_impl.dart';
import 'package:app_estoque/presentation/domain/usecases/delete_stock_product_usecase/delete_stock_product_usecase.dart';
import 'package:app_estoque/presentation/data/datasources/local/create_sotck_datasources/create_sotck_datasource_impl.dart';
import 'package:app_estoque/presentation/data/datasources/local/check_logged_datasources/check_logged_datasource_impl.dart';
import 'package:app_estoque/presentation/domain/usecases/get_all_stocks_products_usecase/get_all_stocks_products_usecase.dart';
import 'package:app_estoque/presentation/data/repositories_impl/create_sotck_repository_impl/create_sotck_repository_impl.dart';
import 'package:app_estoque/presentation/data/repositories_impl/check_logged_repository_impl/check_logged_repository_impl.dart';
import 'package:app_estoque/presentation/data/datasources/local/remember_account_datasources/remember_account_datasource_impl.dart';
import 'package:app_estoque/presentation/data/datasources/local/get_stock_product_datasources/get_stock_product_datasource_impl.dart';
import 'package:app_estoque/presentation/data/repositories_impl/remember_account_repository_impl/remember_account_repository_impl.dart';
import 'package:app_estoque/presentation/data/repositories_impl/get_stock_product_repository_impl/get_stock_product_repository_impl.dart';
import 'package:app_estoque/presentation/data/datasources/local/delete_stock_product_datasources/delete_stock_product_datasource_impl.dart';
import 'package:app_estoque/presentation/data/repositories_impl/delete_stock_product_repository_impl/delete_stock_product_repository_impl.dart';
import 'package:app_estoque/presentation/data/datasources/local/get_all_stocks_products_datasources/get_all_stocks_products_datasource_impl.dart';
import 'package:app_estoque/presentation/data/repositories_impl/get_all_stocks_products_repository_impl/get_all_stocks_products_repository_impl.dart';

final getIt = GetIt.instance;

void injectionDependencies() {
  //DataSources
  getIt.registerFactory(() => SignUpDataSourceImpl());
  getIt.registerFactory(() => GetUserDataSourceImpl());
  getIt.registerFactory(() => LoginDataSourceImpl());
  getIt.registerFactory(() => RememberAccountDataSourceImpl());
  getIt.registerFactory(() => CheckLoggedDataSourceImpl());
  getIt.registerFactory(() => CreateStockDataSourceImpl());
  getIt.registerFactory(() => GetAllStockProductsDataSourceImpl());
  getIt.registerFactory(() => DeleteStockProductDataSourceImpl());
  getIt.registerFactory(() => GetStockProductDataSourceImpl());

  //Repositories
  getIt.registerFactory(
      () => SignUpRepositoryImpl(getIt<SignUpDataSourceImpl>()));
  getIt.registerFactory(
      () => GetUserRepositoryImpl(getIt<GetUserDataSourceImpl>()));
  getIt
      .registerFactory(() => LoginRepositoryImpl(getIt<LoginDataSourceImpl>()));
  getIt.registerFactory(() => RememberAccountRepositoryImpl(
        getIt<RememberAccountDataSourceImpl>(),
      ));
  getIt.registerFactory(() => CheckLoggedRepositoryImpl(
        getIt<CheckLoggedDataSourceImpl>(),
      ));
  getIt.registerFactory(() => CreateStockRepositoryImpl(
        getIt<CreateStockDataSourceImpl>(),
      ));
  getIt.registerFactory(() => GetAllStockProductsRepositoryImpl(
        getIt<GetAllStockProductsDataSourceImpl>(),
      ));
  getIt.registerFactory(() => DeleteStockProductRepositoryImpl(
        getIt<DeleteStockProductDataSourceImpl>(),
      ));
  getIt.registerFactory(() => GetStockProductRepositoryImpl(
        getIt<GetStockProductDataSourceImpl>(),
      ));

  //UseCases
  getIt.registerFactory(() => SignUpUseCase(
        getIt<SignUpRepositoryImpl>(),
      ));
  getIt.registerFactory(() => GetUserUseCase(getIt<GetUserRepositoryImpl>()));
  getIt.registerFactory(() => LoginUseCase(getIt<LoginRepositoryImpl>()));
  getIt.registerFactory(
      () => RememberAccountUseCase(getIt<RememberAccountRepositoryImpl>()));
  getIt.registerFactory(
      () => CheckLoggedInUseCase(getIt<CheckLoggedRepositoryImpl>()));
  getIt.registerFactory(
      () => CreateStockUseCases(getIt<CreateStockRepositoryImpl>()));
  getIt.registerFactory(() =>
      GetAllStockProductsUseCase(getIt<GetAllStockProductsRepositoryImpl>()));
  getIt.registerFactory(() =>
      DeleteStockProductUseCase(getIt<DeleteStockProductRepositoryImpl>()));
  getIt.registerFactory(
      () => GetStockProductUseCase(getIt<GetStockProductRepositoryImpl>()));

  //Controllers
  getIt.registerFactory(() => LoginController(
        loginUseCase: getIt<LoginUseCase>(),
        rememberAccountUseCase: getIt<RememberAccountUseCase>(),
        userServiceLocal: getIt<UserServiceLocal>(),
      ));

  getIt.registerFactory(() => SignUpController(
        signUpUseCase: getIt<SignUpUseCase>(),
        getUserUseCase: getIt<GetUserUseCase>(),
      ));

  getIt.registerFactory(() => HomeController(
        getAllStockProductsUseCase: getIt<GetAllStockProductsUseCase>(),
        deleteStockProductUseCase: getIt<DeleteStockProductUseCase>(),
      ));

  getIt.registerFactory(() => AppController(
        checkLoggedInUseCase: getIt<CheckLoggedInUseCase>(),
      ));

  getIt.registerFactory(() => StockController(
        createStockUseCase: getIt<CreateStockUseCases>(),
        getStockProductUseCase: getIt<GetStockProductUseCase>(),
      ));

  getIt.registerFactory(() => HiveConfig());
  getIt.registerFactory(() => UserServiceLocal());
}
