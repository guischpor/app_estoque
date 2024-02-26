import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
 import 'package:app_estoque/presentation/data/models/user_model.dart';


abstract class LoginRepository {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });
}