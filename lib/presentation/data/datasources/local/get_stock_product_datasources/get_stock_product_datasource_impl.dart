import 'package:hive/hive.dart';
import '../../../models/stock_model.dart';
import 'get_stock_product_datasource.dart';
import '../../../../../core/errors/server_exception.dart';
import 'package:app_estoque/presentation/domain/entities/stock_product.dart';

class GetStockProductDataSourceImpl implements GetStockProductDataSource {
  @override
  Future<StockProductEntity> getStockProduct(String stockID) async {
    try {
      late Box box;
      box = await Hive.openBox('stocksProduct');

      final data = await box.get(stockID);

      if (data == null) {
        throw StockNotFound();
      }

      final stockProducts = StockProductModel.fromMap(data);

      return stockProducts;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }
}
