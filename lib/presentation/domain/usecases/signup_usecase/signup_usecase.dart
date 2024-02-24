import 'package:dartz/dartz.dart';
import '../../entities/user_entity.dart';
import '../../../data/models/user_model.dart';
import '../../../../core/errors/failure.dart';
import '../../repositories/signup_repository/signup_repository.dart';


class SignUpUseCase {
  final SignUpRepository _signUpRepository;

  SignUpUseCase(this._signUpRepository);

  Future<Either<Failure, dynamic>> call(UserEntity user) async {
    final userModel = UserModel(
      name: user.name,
      cpf: user.cpf,
      email: user.email,
      password: user.password,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );

    return _signUpRepository.createUser(userModel);
  }
}
