import '../../../models/product_model.dart';

abstract class AddProductItemDataSources {
  Future<Map<String, dynamic>> addProductItem(ProductModel product);
}
