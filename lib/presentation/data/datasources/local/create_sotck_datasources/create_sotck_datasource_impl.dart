import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'create_sotck_datasource.dart';
import '../../../models/stock_model.dart';
import '../../../../../core/errors/server_exception.dart';

class CreateStockDataSourceImpl implements CreateStockDataSource {
  @override
  Future<Map<String, dynamic>> createStock(StockProductModel stock) async {
    try {
      late Box box;
      box = await Hive.openBox('stocksProduct');

      final newStockProduct = StockProductModel(
        id: const Uuid().v1(),
        unitStore: stock.unitStore,
        date: stock.date,
        userID: stock.userID,
        statusID: stock.statusID,
        createdAt: stock.createdAt,
        updatedAt: stock.updatedAt,
        product: stock.product,
      );

      print(newStockProduct.userID);

      await box.put(
        newStockProduct.id,
        newStockProduct.toMap(),
      );

      return box.get(newStockProduct.id);
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }
}
