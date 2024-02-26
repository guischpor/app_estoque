import 'package:dartz/dartz.dart';
import '../../entities/user_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../repositories/get_user_repository/get_user_repository.dart';

class GetUserUseCase {
  final GetUserRepository _getUserRepository;

  GetUserUseCase(this._getUserRepository);

  Future<Either<Failure, UserEntity>> call({
    required String id,
    required String email,
    required String cpf,
  }) async {
    return _getUserRepository.getUser(
      id: id,
      email: email,
      cpf: cpf,
    );
  }
}
