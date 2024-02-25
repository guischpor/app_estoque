import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import 'package:app_estoque/presentation/data/models/stock_model.dart';
import '../../datasources/local/get_all_stocks_products_datasources/get_all_stocks_products_datasource.dart';
import '../../../domain/repositories/get_all_stocks_products_repository/get_all_stocks_products_repository.dart';

class GetAllStockProductsRepositoryImpl
    implements GetAllStockProductsRepository {
  final GetAllStockProductsDataSource _getAllStockProductsDataSource;

  GetAllStockProductsRepositoryImpl(this._getAllStockProductsDataSource);

  @override
  Future<Either<Failure, List<StockProductModel>>> getAllStockProducts() async {
    try {
      final result = await _getAllStockProductsDataSource.getAllStockProducts();
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
