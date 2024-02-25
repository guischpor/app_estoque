import '../../../models/stock_model.dart';
import '../../../../domain/entities/stock_product.dart';

abstract class UpdateStockProductDataSource {
  Future<StockProductEntity> updateStockProduct(StockProductModel stock);
}
