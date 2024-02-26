import 'package:hive/hive.dart';
import 'delete_stock_product_datasource.dart';
import '../../../../../core/errors/server_exception.dart';

class DeleteStockProductDataSourceImpl implements DeleteStockProductDataSource {
  @override
  Future<bool> deleteStockProduct(String stockID) async {
    try {
      late Box box;
      box = await Hive.openBox('stocksProduct');

      bool isDelete = false;

      await box.delete(stockID);

      if (await box.get(stockID) == null) {
        isDelete = true;
      }

      return isDelete;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }
}
