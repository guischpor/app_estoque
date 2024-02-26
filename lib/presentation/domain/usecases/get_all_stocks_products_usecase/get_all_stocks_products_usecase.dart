import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import 'package:app_estoque/presentation/domain/entities/stock_product.dart';
import '../../repositories/get_all_stocks_products_repository/get_all_stocks_products_repository.dart';

class GetAllStockProductsUseCase {
  final GetAllStockProductsRepository _getAllStockProductsRepository;

  GetAllStockProductsUseCase(this._getAllStockProductsRepository);

  Future<Either<Failure, List<StockProductEntity>>> call() async {
    return await _getAllStockProductsRepository.getAllStockProducts();
  }
}
