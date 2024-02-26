import '../../../../domain/entities/product_entity.dart';

abstract class GetProductItemDataSource {
  Future<ProductEntity> getProductItem(String productID);
}
