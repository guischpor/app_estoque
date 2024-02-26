import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class CheckLoggedRepository {
  Future<Either<Failure, bool>> setLogging(bool value);
  Future<Either<Failure, bool>> getLogging();
}
