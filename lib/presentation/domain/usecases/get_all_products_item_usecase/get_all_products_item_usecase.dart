import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import 'package:app_estoque/presentation/domain/entities/product_entity.dart';
import '../../repositories/get_all_products_item_repository/get_all_products_item_repository.dart';

class GetAllProductsUseCase {
  final GetAllProductsRepository _getAllProductsRepository;

  GetAllProductsUseCase(this._getAllProductsRepository);

  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await _getAllProductsRepository.getAllProductsItem();
  }
}
