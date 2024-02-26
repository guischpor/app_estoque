import '../../../../domain/entities/product_entity.dart';

abstract class GetAllProductsDataSource {
  Future<List<ProductEntity>> getAllProductsItem();
}
