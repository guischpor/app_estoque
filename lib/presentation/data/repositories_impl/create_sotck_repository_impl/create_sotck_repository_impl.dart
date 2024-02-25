import 'package:dartz/dartz.dart';
import '../../models/stock_model.dart';
import 'package:app_estoque/core/errors/failure.dart';
import '../../datasources/local/create_sotck_datasources/create_sotck_datasource.dart';
import '../../../domain/repositories/create_sotck_repository/create_sotck_repository.dart';

class CreateStockRepositoryImpl implements CreateStockRepository {
  final CreateStockDataSource _createStockDataSource;

  CreateStockRepositoryImpl(this._createStockDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createStock(
      StockProductModel stock) async {
    try {
      final result = await _createStockDataSource.createStock(stock);
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
