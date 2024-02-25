import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import '../../datasources/local/delete_stock_product_datasources/delete_stock_product_datasource.dart';
import '../../../domain/repositories/delete_stock_product_repository/delete_stock_product_repository.dart';

class DeleteStockProductRepositoryImpl implements DeleteStockProductRepository {
  final DeleteStockProductDataSource _deleteStockProductDataSource;

  DeleteStockProductRepositoryImpl(this._deleteStockProductDataSource);

  @override
  Future<Either<Failure, bool>> deleteStockProduct(String stockID) async {
    try {
      final result =
          await _deleteStockProductDataSource.deleteStockProduct(stockID);
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
