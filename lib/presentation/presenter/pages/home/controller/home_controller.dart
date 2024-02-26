import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../../../../../core/styles/app_color.dart';
import '../../../widgets/show_snackbar_dialog.dart';
import '../../../../domain/entities/stock_product.dart';
import 'package:app_estoque/presentation/domain/usecases/delete_stock_product_usecase/delete_stock_product_usecase.dart';
import 'package:app_estoque/presentation/domain/usecases/get_all_stocks_products_usecase/get_all_stocks_products_usecase.dart';

part 'home_controller.g.dart';

class HomeController = HomeBase with _$HomeController;

abstract class HomeBase with Store {
  final GetAllStockProductsUseCase getAllStockProductsUseCase;
  final DeleteStockProductUseCase deleteStockProductUseCase;

  HomeBase({
    required this.getAllStockProductsUseCase,
    required this.deleteStockProductUseCase,
  });

  @observable
  bool isLoading = false;

  @observable
  bool isSuccess = false;

  @observable
  List<StockProductEntity> stockProducts = [];

  @observable
  List<StockProductEntity> pendingStockProducts = [];

  @observable
  List<StockProductEntity> shippedStockProducts = [];

  @action
  setLoading(bool value) {
    isLoading = value;
  }

  @action
  void setSuccess(bool value) {
    isSuccess = value;
  }

  @action
  void setPendingStockProducts(List<StockProductEntity> value) {
    pendingStockProducts = value;
  }

  @action
  void setShippedStockProducts(List<StockProductEntity> value) {
    shippedStockProducts = value;
  }

  @action
  Future<void> getAllStockProducts() async {
    stockProducts.clear();
    shippedStockProducts.clear();
    pendingStockProducts.clear();
    final result = await getAllStockProductsUseCase.call();

    result.fold(
      (error) {
        setLoading(false);
        setSuccess(false);
        print(error.toString());
      },
      (success) {
        setLoading(false);
        setSuccess(true);

        setPendingStockProducts(
          success.where((element) => element.statusID == 0).toList(),
        );
        setShippedStockProducts(
          success.where((element) => element.statusID == 1).toList(),
        );
      },
    );
  }

  Future<void> deleteStockProduct(BuildContext context, String stockID) async {
    final result = await deleteStockProductUseCase.call(stockID);

    result.fold(
      (error) {
        print(error.toString());
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
            label: 'Stock excluido com sucesso',
            icon: Icons.error,
            textColorLabel: AppColors.white,
            backgroundColor: AppColors.green,
          ),
        );
        getAllStockProducts();
      },
    );
  }
}
