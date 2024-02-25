import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import '../../datasources/local/check_logged_datasources/check_logged_datasource.dart';
import '../../../domain/repositories/check_logged_repository/check_logged_repository.dart';

class CheckLoggedRepositoryImpl implements CheckLoggedRepository {
  final CheckLoggedDataSource _checkLoggedDataSource;

  CheckLoggedRepositoryImpl(this._checkLoggedDataSource);

  @override
  Future<Either<Failure, bool>> getLogging() async {
    try {
      final result = await _checkLoggedDataSource.getLogging();
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> setLogging(bool value) async {
    try {
      final result = await _checkLoggedDataSource.setLogging(value);
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
