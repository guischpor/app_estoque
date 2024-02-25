import '../../../models/stock_model.dart';

abstract class CreateStockDataSource {
  Future<Map<String, dynamic>> createStock(StockProductModel stock);
}
