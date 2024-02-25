import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import '../../datasources/local/remember_account_datasources/remember_account_datasource.dart';
import '../../../domain/repositories/remember_account_repository/remember_account_repository.dart';

class RememberAccountRepositoryImpl implements RememberAccountRepository {
  final RememberAccountDataSource _rememberAccountDataSource;

  RememberAccountRepositoryImpl(this._rememberAccountDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> call({
    required String email,
    required String password,
    required bool isChecked,
  }) async {
    try {
      final result = await _rememberAccountDataSource.call(
        email: email,
        password: password,
        isChecked: isChecked,
      );
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<dynamic, dynamic>>> getRememberAccount() async {
    try {
      final result = await _rememberAccountDataSource.getRememberAccount();
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
