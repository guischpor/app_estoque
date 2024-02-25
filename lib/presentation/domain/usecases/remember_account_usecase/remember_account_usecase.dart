import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import '../../repositories/remember_account_repository/remember_account_repository.dart';

class RememberAccountUseCase {
  final RememberAccountRepository _rememberAccountRepository;

  RememberAccountUseCase(this._rememberAccountRepository);

  Future<Either<Failure, Map<String, dynamic>>> call({
    required String email,
    required String password,
    required bool isChecked,
  }) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      return Left(ServerFailure('Os campos não podem ser vazios'));
    }

    return _rememberAccountRepository.call(
      email: email,
      password: password,
      isChecked: isChecked,
    );
  }

  Future<Either<Failure, Map<dynamic, dynamic>>> getRememberAccount() async {
    return _rememberAccountRepository.getRememberAccount();
  }
}
