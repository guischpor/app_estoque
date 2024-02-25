import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../repositories/check_logged_repository/check_logged_repository.dart';

class CheckLoggedInUseCase {
  final CheckLoggedRepository _checkLoggedRepository;

  CheckLoggedInUseCase(this._checkLoggedRepository);

  Future<Either<Failure, bool>> setLogging(bool value) async {
    return _checkLoggedRepository.setLogging(value);
  }

  Future<Either<Failure, bool>> getLogging() async {
    return _checkLoggedRepository.getLogging();
  }
}
