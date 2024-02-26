import 'package:dartz/dartz.dart';
import 'package:app_estoque/core/errors/failure.dart';
import 'package:app_estoque/presentation/domain/entities/product_entity.dart';
import '../../datasources/local/get_all_products_item_datasources/get_all_products_item_datasource.dart';
import '../../../domain/repositories/get_all_products_item_repository/get_all_products_item_repository.dart';

class GetAllProductsRepositoryImpl implements GetAllProductsRepository {
  final GetAllProductsDataSource getAllProductsDataSource;

  GetAllProductsRepositoryImpl(this.getAllProductsDataSource);
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProductsItem() async {
    try {
      final result = await getAllProductsDataSource.getAllProductsItem();
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
