import 'package:dartz/dartz.dart';
import '../../entities/user_entity.dart';
import 'package:app_estoque/core/errors/failure.dart';
import '../../repositories/login_repository/login_repository.dart';

class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<Either<Failure, UserEntity>> call({
    required email,
    required password,
  }) async {
    return _loginRepository.login(email: email, password: password);
  }
}
