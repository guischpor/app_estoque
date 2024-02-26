import '../../../../domain/entities/stock_product.dart';

abstract class GetStockProductDataSource {
  Future<StockProductEntity> getStockProduct(String stockID);
}
