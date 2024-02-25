import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class DeleteStockProductRepository {
  Future<Either<Failure, bool>> deleteStockProduct(String stockID);
}
