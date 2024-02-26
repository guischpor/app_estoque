import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class RememberAccountRepository {
  Future<Either<Failure, Map<String, dynamic>>> call({
    required String email,
    required String password,
    required bool isChecked,
  });

  Future<Either<Failure, Map<dynamic, dynamic>>> getRememberAccount();
}
