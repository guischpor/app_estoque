import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import '../../datasources/local/delete_product_item_datasources/delete_product_item_datasource.dart';
import '../../../domain/repositories/delete_product_item_repository/delete_product_item_repository.dart';

class DeleteProductItemRepositoryImpl implements DeleteProductItemRepository {
  final DeleteProductItemDataSource _deleteProductItemDataSource;

  DeleteProductItemRepositoryImpl(this._deleteProductItemDataSource);

  @override
  Future<Either<Failure, bool>> deleteProductItem(String productID) async {
    try {
      final result =
          await _deleteProductItemDataSource.deleteProductItem(productID);
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
