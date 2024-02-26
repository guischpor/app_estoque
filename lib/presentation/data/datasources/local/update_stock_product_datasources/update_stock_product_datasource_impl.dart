import 'package:hive/hive.dart';
import 'update_stock_product_datasource.dart';
import '../../../../../core/errors/server_exception.dart';
import 'package:app_estoque/presentation/data/models/stock_model.dart';
import 'package:app_estoque/presentation/domain/entities/stock_product.dart';

class UpdateStockProductDataSourceImpl implements UpdateStockProductDataSource {
  @override
  Future<StockProductEntity> updateStockProduct(StockProductModel stock) async {
    try {
      late Box box;
      box = await Hive.openBox('stocksProduct');

      final newStockProduct = StockProductModel(
        id: stock.id,
        unitStore: stock.unitStore,
        date: stock.date,
        userID: stock.userID,
        statusID: stock.statusID,
        createdAt: stock.createdAt,
        updatedAt: stock.updatedAt,
        product: stock.product,
      );

      final getAllKeys = box.keys.toList();

      getAllKeys.forEach((element) {
        if (element == stock.id) {
          box.putAt(getAllKeys.indexOf(element), newStockProduct.toMap());
        }
      });

      return newStockProduct;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }
}
