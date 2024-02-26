import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import 'package:app_estoque/presentation/data/models/user_model.dart';
import '../../datasources/local/get_user_datasources/get_user_datasource.dart';
import '../../../domain/repositories/get_user_repository/get_user_repository.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  final GetUserDataSource _getUserDataSource;

  GetUserRepositoryImpl(this._getUserDataSource);

  @override
  Future<Either<Failure, UserModel>> getUser({
    required String id,
    required String email,
    required String cpf,
  }) async {
    try {
      final result = await _getUserDataSource.getUser(
        id: id,
        email: email,
        cpf: cpf,
      );
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
