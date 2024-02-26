import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import 'package:app_estoque/presentation/data/models/product_model.dart';


abstract class AddProductItemRepository {
  Future<Either<Failure, Map<String, dynamic>>> addProductItem(ProductModel product);
}