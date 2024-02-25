import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import 'package:app_estoque/presentation/data/models/stock_model.dart';
import 'package:app_estoque/presentation/domain/entities/stock_product.dart';
import '../../datasources/local/update_stock_product_datasources/update_stock_product_datasource.dart';
import '../../../domain/repositories/update_stock_product_repository/update_stock_product_repository.dart';

class UpdateStockProductRepositoryImpl implements UpdateStockProductRepository {
  final UpdateStockProductDataSource updateStockProductDataSource;

  UpdateStockProductRepositoryImpl(this.updateStockProductDataSource);

  @override
  Future<Either<Failure, StockProductEntity>> updateStockProduct(
      StockProductModel stock) async {
    try {
      final result =
          await updateStockProductDataSource.updateStockProduct(stock);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
