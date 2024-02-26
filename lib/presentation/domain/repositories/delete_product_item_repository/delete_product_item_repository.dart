import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';


abstract class DeleteProductItemRepository {
  Future<Either<Failure, bool>> deleteProductItem(String productID);
}
