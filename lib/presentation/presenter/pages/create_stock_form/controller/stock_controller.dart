import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../../../../../core/styles/app_color.dart';
import '../../../widgets/show_snackbar_dialog.dart';
import 'package:app_estoque/core/utils/date_input_converter.dart';
import 'package:app_estoque/presentation/domain/entities/stock_product.dart';
import '../../../../domain/usecases/get_stock_product_usecase/get_stock_product_usecase.dart';
import 'package:app_estoque/presentation/domain/usecases/create_sotck_usecase/create_sotck_usecase.dart';

part 'stock_controller.g.dart';

class StockController = StockBase with _$StockController;

abstract class StockBase with Store {
  final CreateStockUseCases createStockUseCase;
  final GetStockProductUseCase getStockProductUseCase;

  StockBase({
    required this.createStockUseCase,
    required this.getStockProductUseCase,
  });

  @observable
  StockProductEntity stockProduct = StockProductEntity();

  @observable
  bool isLoading = false;

  @observable
  bool isSuccess = false;

  @action
  setLoading(bool value) {
    isLoading = value;
  }

  @action
  void setSuccess(bool value) {
    isSuccess = value;
  }

  @action
  Future<void> createStockProduct({
    required BuildContext context,
    required String unitStore,
    required String date,
    required String userID,
    required int statusID,
    String? listID,
  }) async {
    final dataConverter = DateInputConverter().convertStringToFormDate(date);

    final stock = StockProductEntity(
      id: listID,
      unitStore: unitStore,
      date: dataConverter,
      userID: userID,
      statusID: statusID,
    );

    final result = await createStockUseCase.call(stock);

    result.fold(
      (error) {
        setLoading(false);
        setSuccess(false);
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Error',
            label: error.toString(),
            icon: Icons.error,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.red,
          ),
        );
      },
      (success) {
        setLoading(false);
        setSuccess(true);
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Sucesso',
            label: 'Estoque salvo com sucesso',
            icon: Icons.check,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.green,
          ),
        );
      },
    );
  }

  Future<void> getStockProduct(BuildContext context, String stockID) async {
    final result = await getStockProductUseCase.call(stockID);

    result.fold(
      (error) {
        print(error.toString());
        setLoading(false);
        setSuccess(false);
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Error',
            label: error.toString(),
            icon: Icons.error,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.red,
          ),
        );
      },
      (success) {
        stockProduct = success;
        setLoading(false);
        setSuccess(true);
      },
    );
  }
}
