import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import 'package:app_estoque/presentation/data/models/user_model.dart';
import '../../datasources/local/signup_datasources/signup_datasource.dart';
import '../../../domain/repositories/signup_repository/signup_repository.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDataSource _signUpDataSource;

  SignUpRepositoryImpl(this._signUpDataSource);

  @override
  Future<Either<Failure, dynamic>> createUser(UserModel user) async {
    try {
      final result = await _signUpDataSource.createUser(user);
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
