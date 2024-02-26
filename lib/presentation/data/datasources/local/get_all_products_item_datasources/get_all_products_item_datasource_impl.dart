import 'package:hive/hive.dart';
import 'get_all_products_item_datasource.dart';
import '../../../../../core/errors/server_exception.dart';
import 'package:app_estoque/presentation/data/models/product_model.dart';
import 'package:app_estoque/presentation/domain/entities/product_entity.dart';

class GetAllProductsDataSourceImpl implements GetAllProductsDataSource {
  @override
  Future<List<ProductEntity>> getAllProductsItem() async {
    try {
      late Box box;
      box = await Hive.openBox('productItems');

      final keys = box.keys;

      List<ProductModel> products = [];

      for (var key in keys) {
        products.add(ProductModel.fromMap(await box.get(key)));
      }

      return products;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }
}
