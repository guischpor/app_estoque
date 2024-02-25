import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import 'package:app_estoque/presentation/data/models/user_model.dart';
import '../../datasources/local/login_datasources/login_datasource.dart';
import '../../../domain/repositories/login_repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;

  LoginRepositoryImpl(this._loginDataSource);

  @override
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password}) async {
    try {
      final result = await _loginDataSource.login(
        email: email,
        password: password,
      );
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
