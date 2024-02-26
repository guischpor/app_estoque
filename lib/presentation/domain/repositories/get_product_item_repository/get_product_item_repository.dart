import 'package:dartz/dartz.dart';
import '../../entities/product_entity.dart';
import '../../../../core/errors/failure.dart';


abstract class GetProductItemRepository {
  Future<Either<Failure, ProductEntity>> getProductItem(String productID);
}
