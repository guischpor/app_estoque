import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import 'package:app_estoque/presentation/domain/entities/stock_product.dart';
import '../../datasources/local/get_stock_product_datasources/get_stock_product_datasource.dart';
import '../../../domain/repositories/get_stock_product_repository/get_stock_product_repository.dart';

class GetStockProductRepositoryImpl implements GetStockProductRepository {
  final GetStockProductDataSource _getStockProductDataSource;

  GetStockProductRepositoryImpl(this._getStockProductDataSource);
  @override
  Future<Either<Failure, StockProductEntity>> getStockProduct(
      String stockID) async {
    try {
      final result = await _getStockProductDataSource.getStockProduct(stockID);
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
