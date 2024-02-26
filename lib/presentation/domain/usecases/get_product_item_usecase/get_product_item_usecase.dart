import 'package:dartz/dartz.dart';
import '../../entities/product_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../repositories/get_product_item_repository/get_product_item_repository.dart';

class GetProductItemUseCase {
  final GetProductItemRepository _getProductItemRepository;

  GetProductItemUseCase(this._getProductItemRepository);

  Future<Either<Failure, ProductEntity>> call(String productID) async {
    return await _getProductItemRepository.getProductItem(productID);
  }
}
