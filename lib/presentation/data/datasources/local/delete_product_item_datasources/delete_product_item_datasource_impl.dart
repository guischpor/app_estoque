import 'package:hive/hive.dart';
import 'delete_product_item_datasource.dart';
import '../../../../../core/errors/server_exception.dart';


class DeleteProductItemDataSourceImpl implements DeleteProductItemDataSource {
  @override
  Future<bool> deleteProductItem(String productID) async{
    try{
    late Box box;
      box = await Hive.openBox('productItems');

      bool isDelete = false;

      await box.delete(productID);

      if (await box.get(productID) == null) {
        isDelete = true;
      }

      return isDelete;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ServerBadRequest();
    }
  }
}
