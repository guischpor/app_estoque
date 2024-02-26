import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'add_product_item_datasource.dart';
import '../../../../../core/errors/server_exception.dart';
import 'package:app_estoque/presentation/data/models/product_model.dart';

class AddProductItemDataSourcesImpl implements AddProductItemDataSources {
  @override
  Future<Map<String, dynamic>> addProductItem(ProductModel product) async {
    try {
      late Box box;
      box = await Hive.openBox('productItems');

      final newProductItem = ProductModel(
        id: const Uuid().v1(),
        stockID: product.stockID,
        userID: product.userID,
        barCode: product.barCode,
        title: product.title,
        quantity: product.quantity,
        quantityPackaging: product.quantityPackaging,
        expirationDate: product.expirationDate,
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      );

      await box.put(
        newProductItem.id,
        newProductItem.toMap(),
      );

      return box.get(newProductItem.id);
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }
}
