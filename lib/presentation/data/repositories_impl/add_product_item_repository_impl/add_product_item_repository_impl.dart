import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import 'package:app_estoque/presentation/data/models/product_model.dart';
import '../../datasources/local/add_product_item_datasources/add_product_item_datasource.dart';
import '../../../domain/repositories/add_product_item_repository/add_product_item_repository.dart';

class AddProductItemRepositoryImpl implements AddProductItemRepository {
  final AddProductItemDataSources addProductItemDataSources;

  AddProductItemRepositoryImpl(this.addProductItemDataSources);
  @override
  Future<Either<Failure, Map<String, dynamic>>> addProductItem(
      ProductModel product) async {
    try {
      final result = await addProductItemDataSources.addProductItem(product);
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
