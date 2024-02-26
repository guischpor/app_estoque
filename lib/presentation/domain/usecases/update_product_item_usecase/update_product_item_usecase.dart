import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../data/models/product_model.dart';
import 'package:app_estoque/presentation/domain/entities/product_entity.dart';
import '../../repositories/update_product_item_repository/update_product_item_repository.dart';

class UpdateProductItemUseCase {
  final UpdateProductItemRepository updateProductItemRepository;

  UpdateProductItemUseCase(
    this.updateProductItemRepository,
  );

  Future<Either<Failure, Map<String, dynamic>>> call(
      ProductEntity product) async {
    final productModel = ProductModel(
      id: product.id,
      stockID: product.stockID,
      userID: product.userID,
      barCode: product.barCode,
      title: product.title,
      quantity: product.quantity,
      quantityPackaging: product.quantityPackaging,
      expirationDate: product.expirationDate,
      createdAt: product.createdAt,
      updatedAt: product.updatedAt,
    );

    return await updateProductItemRepository.call(productModel);
  }
}
