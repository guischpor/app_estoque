import 'package:hive/hive.dart';
import 'get_all_stocks_products_datasource.dart';
import '../../../../../core/errors/server_exception.dart';
import 'package:app_estoque/presentation/data/models/stock_model.dart';

class GetAllStockProductsDataSourceImpl
    implements GetAllStockProductsDataSource {
  @override
  Future<List<StockProductModel>> getAllStockProducts() async {
    try {
      late Box box;
      box = await Hive.openBox('stocksProduct');

      final keys = box.keys;

      List<StockProductModel> stockProducts = [];

      for (var key in keys) {
        stockProducts.add(StockProductModel.fromMap(await box.get(key)));
      }

      return stockProducts;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }
}
