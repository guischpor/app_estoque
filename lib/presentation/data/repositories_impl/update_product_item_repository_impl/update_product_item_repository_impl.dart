import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import 'package:app_estoque/presentation/data/models/product_model.dart';
import '../../datasources/local/update_product_item_datasources/update_product_item_datasource.dart';
import '../../../domain/repositories/update_product_item_repository/update_product_item_repository.dart';

class UpdateProductItemRepositoryImpl implements UpdateProductItemRepository {
  final UpdateProductItemDataSource updateProductItemDataSource;

  UpdateProductItemRepositoryImpl(this.updateProductItemDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
      ProductModel product) async {
    try {
      final result =
          await updateProductItemDataSource.updateProductItem(product);
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
