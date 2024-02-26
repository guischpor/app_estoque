import 'package:hive/hive.dart';
import 'get_product_item_datasource.dart';
import '../../../../../core/errors/server_exception.dart';
import 'package:app_estoque/presentation/data/models/product_model.dart';
import 'package:app_estoque/presentation/domain/entities/product_entity.dart';

class GetProductItemDataSourceImpl implements GetProductItemDataSource {
  @override
  Future<ProductEntity> getProductItem(String productID) async {
    try {
      late Box box;
      box = await Hive.openBox('productItems');

      final data = await box.get(productID);

      if (data == null) {
        throw ProductNotFound();
      }

      final product = ProductModel.fromMap(data);

      return product;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }
}
