import '../../../models/product_model.dart';

abstract class UpdateProductItemDataSource {
  Future<Map<String, dynamic>> updateProductItem(ProductModel product);
}
