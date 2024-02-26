import 'package:dartz/dartz.dart';
import '../../entities/stock_product.dart';
import '../../../../core/errors/failure.dart';
import '../../repositories/get_stock_product_repository/get_stock_product_repository.dart';

class GetStockProductUseCase {
  final GetStockProductRepository _getStockProductRepository;

  GetStockProductUseCase(this._getStockProductRepository);

  Future<Either<Failure, StockProductEntity>> call(String stockID) async {
    return _getStockProductRepository.getStockProduct(stockID);
  }
}
