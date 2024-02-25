import '../../../models/stock_model.dart';

abstract class GetAllStockProductsDataSource {
  Future<List<StockProductModel>> getAllStockProducts();
}
