import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import '../../repositories/delete_stock_product_repository/delete_stock_product_repository.dart';

class DeleteStockProductUseCase {
  final DeleteStockProductRepository _deleteStockProductRepository;

  DeleteStockProductUseCase(this._deleteStockProductRepository);

  Future<Either<Failure, bool>> call(String stockID) async {
    return _deleteStockProductRepository.deleteStockProduct(stockID);
  }
}
