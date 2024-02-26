import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../data/models/product_model.dart';


abstract class UpdateProductItemRepository {
  Future<Either<Failure, Map<String, dynamic>>> call(ProductModel product);
}
