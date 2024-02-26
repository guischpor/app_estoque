import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../repositories/delete_product_item_repository/delete_product_item_repository.dart';

class DeleteProductItemUseCase {
  final DeleteProductItemRepository _deleteProductItemRepository;

  DeleteProductItemUseCase(this._deleteProductItemRepository);

  Future<Either<Failure, bool>> call(String productID) async {
    return await _deleteProductItemRepository.deleteProductItem(productID);
  }
}
