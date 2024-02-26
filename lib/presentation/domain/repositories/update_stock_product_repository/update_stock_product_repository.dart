import 'package:dartz/dartz.dart';
import '../../entities/stock_product.dart';
import '../../../data/models/stock_model.dart';
import 'package:app_estoque/core/errors/failure.dart';

abstract class UpdateStockProductRepository {
  Future<Either<Failure, StockProductEntity>> updateStockProduct(
      StockProductModel stock);
}
