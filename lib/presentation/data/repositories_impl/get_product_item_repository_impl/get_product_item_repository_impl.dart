import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import 'package:app_estoque/presentation/domain/entities/product_entity.dart';
import '../../datasources/local/get_product_item_datasources/get_product_item_datasource.dart';
import '../../../domain/repositories/get_product_item_repository/get_product_item_repository.dart';

class GetProductItemRepositoryImpl implements GetProductItemRepository {
  final GetProductItemDataSource _getProductItemDataSource;

  GetProductItemRepositoryImpl(this._getProductItemDataSource);

  @override
  Future<Either<Failure, ProductEntity>> getProductItem(
      String productID) async {
    try {
      final result = await _getProductItemDataSource.getProductItem(productID);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
