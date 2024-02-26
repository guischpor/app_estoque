import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../data/models/stock_model.dart';

abstract class CreateStockRepository {
  Future<Either<Failure, Map<String, dynamic>>> createStock(
      StockProductModel stock);
}
