import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../data/models/user_model.dart';

abstract class GetUserRepository {
  Future<Either<Failure, UserModel>> getUser({
    required String id,
    required String email,
    required String cpf,
  });
}
