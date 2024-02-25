import 'package:dartz/dartz.dart';
import '../../entities/stock_product.dart';
import '../../../../core/errors/failure.dart';

abstract class GetStockProductRepository {
  Future<Either<Failure, StockProductEntity>> getStockProduct(String stockID);
}
