import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../data/models/stock_model.dart';

abstract class GetAllStockProductsRepository {
  Future<Either<Failure, List<StockProductModel>>> getAllStockProducts();
}
