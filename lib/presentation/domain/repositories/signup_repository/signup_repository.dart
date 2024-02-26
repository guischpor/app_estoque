import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../data/models/user_model.dart';

abstract class SignUpRepository {
  Future<Either<Failure, dynamic>> createUser(UserModel user);
}
