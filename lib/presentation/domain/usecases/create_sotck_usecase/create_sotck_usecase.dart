import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../data/models/stock_model.dart';
import 'package:app_estoque/presentation/domain/entities/stock_product.dart';
import '../../repositories/create_sotck_repository/create_sotck_repository.dart';

class CreateStockUseCases {
  final CreateStockRepository _createStockRepository;

  CreateStockUseCases(this._createStockRepository);

  Future<Either<Failure, Map<String, dynamic>>> call(
      StockProductEntity stock) async {
    final stockProductModel = StockProductModel(
      userID: stock.userID,
      statusID: stock.statusID,
      unitStore: stock.unitStore,
      date: stock.date,
      createdAt: stock.createdAt,
      updatedAt: stock.updatedAt,
      product: const [],
    );

    return await _createStockRepository.createStock(stockProductModel);
  }
}
