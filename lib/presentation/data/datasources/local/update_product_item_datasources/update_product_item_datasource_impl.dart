import 'package:hive/hive.dart';
import 'update_product_item_datasource.dart';
import '../../../../../core/errors/server_exception.dart';
import 'package:app_estoque/presentation/data/models/product_model.dart';

class UpdateProductItemDataSourceImpl implements UpdateProductItemDataSource {
  @override
  Future<Map<String, dynamic>> updateProductItem(ProductModel product) async {
    try {
      late Box box;
      box = await Hive.openBox('productItems');

      final productModel = ProductModel(
        id: product.id,
        stockID: product.stockID,
        userID: product.userID,
        barCode: product.barCode,
        title: product.title,
        quantity: product.quantity,
        quantityPackaging: product.quantityPackaging,
        expirationDate: product.expirationDate,
        createdAt: product.createdAt,
        updatedAt: DateTime.now().toIso8601String(),
      );

      final getAllKeys = box.keys.toList();

      getAllKeys.forEach((element) {
        if (element == product.id) {
          box.putAt(getAllKeys.indexOf(element), productModel.toMap());
        }
      });

      return productModel.toMap();
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }
}
