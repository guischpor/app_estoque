import 'package:dartz/dartz.dart';
import '../../entities/product_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class GetAllProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProductsItem();
}
