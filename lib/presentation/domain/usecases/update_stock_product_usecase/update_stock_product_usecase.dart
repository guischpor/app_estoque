import 'package:dartz/dartz.dart';
import '../../entities/stock_product.dart';
import '../../../../core/errors/failure.dart';
import '../../../data/models/stock_model.dart';
import '../../repositories/update_stock_product_repository/update_stock_product_repository.dart';

class UpdateStockProductUseCase {
  final UpdateStockProductRepository updateStockProductRepository;

  UpdateStockProductUseCase(this.updateStockProductRepository);

  Future<Either<Failure, StockProductEntity>> call(
      StockProductEntity stock) async {
    final stockModel = StockProductModel(
      id: stock.id,
      userID: stock.userID,
      statusID: stock.statusID,
      date: stock.date,
      unitStore: stock.unitStore,
      createdAt: stock.createdAt,
      updatedAt: stock.updatedAt,
      product: stock.product,
    );

    return await updateStockProductRepository.updateStockProduct(stockModel);
  }
}
